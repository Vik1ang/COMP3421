# Tutorial 09

This week we're covering the usage of cubemaps and framebuffers.

## When the Cake Is Sus

For this tutorial, our world consists of two scenes, an interior and an
exterior one. The camera can travel between the two scene via a portal.
In our exterior scene we have a sphere, which we will add a reflection to
using a cubemap. We will then use a framebuffer to make the other scene
visible through the portal, like in Valve's game Portal.

### A. Cubemapped Reflections (15 mins)

A cubemap texture consists of six images, each representing one of the faces
of a cube. OpenGL then allows us to sample this texture using a 3D vector,
indicating which direction we wish to sample from. If we construct an image
of the environment on each side of the cube, we could then sample this cube
using a reflection vector in the fragment shader to get the color a surface
would reflect in the given environment.

To begin with, implement the `make_cubemap` function in `cubemap.cpp`. This
function should load six images into an OpenGL cubemap. The file names are
`base_path + SIDE + extension`, where `SIDE` is one of `_right`, `_left`,
`_top`, `_bottom`, `_front`, and `_back`. You may want to implement the
provided `load_side` to help with this.

> In the reference solution, `make_cubemap` in `cubemap.cpp` is implemented
> as such:
> ```C++
> GLuint make_cubemap(
>         const std::string &base_path,
>         const std::string &extension) {
>     GLuint texture;
>     glGenTextures(1, &texture);
>     glBindTexture(GL_TEXTURE_CUBE_MAP, texture);
> 
>     for (int i = 0; i < 6; i++) {
>         load_side(i, base_path + side_suffixes[i] + extension);
>     }
> 
>     glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
>     glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
>     glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
>     glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
>     glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);
> 
>     glBindTexture(GL_TEXTURE_CUBE_MAP, 0);
>     return texture;
> }
> ```
> The helper function `load_side` is implemented as such:
> ```C++
> void load_side(int side, const std::string &path) {
>     chicken3421::image_t image = chicken3421::load_image(path, false);
>     GLenum fmt = image.n_channels == 3 ? GL_RGB : GL_RGBA;
>     glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_X + side,
>                  0, GL_RGB, image.width, image.height, 0, GL_RGB, GL_UNSIGNED_BYTE, image.data);
>     chicken3421::delete_image(image);
> }
> ```

Now we need to actually load a cubemap and apply it to an object in the scene.
A cubemap is provided in the `res/skybox` folder, take a quick look at it to
get an idea what a cubemap actually looks like on disk. A sphere is already
provided in `make_scene_exterior`, add the cubemap to it's `texture` property.

> Add the following line to `make_scene_exterior` in `scene.cpp`:
> ```C++
> sphere.texture = make_cubemap(SKYBOX_BASE_PATH);
> ```

In `renderer.cpp` we have a `draw_reflective` function, which is used to draw
any node of kind `node_t::REFLECTIVE`, such as our sphere. Add code to this
function to bind it's cubemap for use in our shader.

> Add the following line to `draw_reflective` in `renderer.cpp` where the
> uniforms are set:
> ```C++
> glBindTexture(GL_TEXTURE_CUBE_MAP, texture);
> ```
> Also, add the follow line at the very end:
> ```C++
> glBindTexture(GL_TEXTURE_CUBE_MAP, 0);
> ```
> Note that we are using the target `GL_TEXTURE_CUBE_MAP` instead of
> `GL_TEXTURE_2D` now.

Now we can sample our cubemap in the shaders to simulate a reflection. In
`reflective.vert` the `v_tex_coord` is already set to be a reflection of the
view vector. In `reflective.frag` you should add a cubemap sampler and
use this vector to sample it.

> For the fragment shader `reflective.frag`, you will need to add the following uniform:
> ```GLSL
> uniform samplerCube u_texture;
> ```
> The main function of should then look something like:
> ```GLSL
> void main() {
>     f_color = texture(u_texture, v_tex_coord);
> }
> ```

The sphere should now have a reflection applied to it, congratulations!

### B. Framebuffers (20 mins)

A framebuffer provides us a destination within GPU memory for us to render
a scene to. In fact we have been using a framebuffer all along - the default
framebuffer, set up by GLFW for us, is what is shown on the screen. We can
create our own framebuffers to render another scene off-screen, and then
display that rendering as a texture within our main scene.

The starter code already has two scenes set up, an interior and an exterior.
We will render whichever scene the camera is not in to a framebuffer, and
then apply the framebuffer's texture to the portal in the camera's scene in
order to simulate a portal to the other scene.

To begin with, implement the `make_framebuffer` function in `framebuffer.cpp`. This
function should create a framebuffer, along with a texture for color and a
renderbuffer for depth.

> In the reference solution, `make_framebuffer` in `framebuffer.cpp` is
> implemented as such:
> ```C++
> framebuffer_t make_framebuffer(int width, int height) {
>     GLuint fbo, texture, rbo;
> 
>     // create framebuffer
>     glGenFramebuffers(1, &fbo);
>     glBindFramebuffer(GL_FRAMEBUFFER, fbo);
> 
>     // create texture for framebuffer color
>     glGenTextures(1, &texture);
>     glBindTexture(GL_TEXTURE_2D, texture);
>     glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0,
>                  GL_RGB, GL_UNSIGNED_BYTE, nullptr);
>     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
>     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
> 
>     // create renderbuffer for framebuffer depth/stencil
>     glGenRenderbuffers(1, &rbo);
>     glBindRenderbuffer(GL_RENDERBUFFER, rbo);
>     glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8, width, height);
> 
>     // attach texture and renderbuffer to framebuffer
>     glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, 0);
>     glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_STENCIL_ATTACHMENT, GL_RENDERBUFFER, rbo);
> 
>     // reset state
>     glBindFramebuffer(GL_FRAMEBUFFER, 0);
>     glBindTexture(GL_TEXTURE_2D, 0);
>     glBindRenderbuffer(GL_RENDERBUFFER, 0);
> 
>     return { fbo, texture, rbo };
> }
> ```

Then, we can construct our framebuffer in `main`. You should pass the
framebuffer's texture in to the `make_scene_*` functions so it can be
added to the portals.

> In the `main` function in `main.cpp`, change the scene set up code to:
> ```C++
> framebuffer_t framebuffer = make_framebuffer(1280, 720);
> node_t scene_interior = make_scene_interior(framebuffer.texture);
> node_t scene_exterior = make_scene_exterior(framebuffer.texture);
> ```
> Note that the framebuffer size must match the window. More specifically,
> `glViewport` should be called with the framebuffer size before rendering
> to the framebuffer. If our framebuffer matches the default framebuffer's
> size, we can omit this as it is already set correctly.

Next, we need to actually render the other scene to the framebuffer. To do
this, we first bind the framebuffer, then render the opposite scene, and then
bind the default framebuffer again, so any further drawing doesn't continue
to happen within our framebuffer.

> Add the following code to the `main` function, right before rendering
> the normal scene.
> ```C++
> glBindFramebuffer(GL_FRAMEBUFFER, framebuffer.fbo);
> if (!camera_in_interior) {
>     render(renderer, cam, scene_interior);
> } else {
>     render(renderer, cam, scene_exterior);
> }
> glBindFramebuffer(GL_FRAMEBUFFER, 0);
> ```

And... we're done! The portal's shaders are already set up to just draw
whatever texture we gave them in the `make_scene_*` functions, so we don't
need to adjust them (yet...). Try running the code and seeing what it looks
like now. What's wrong with the result? How could we fix it?

### C. Generating Texture Coordinates (10 mins)

The scene in the framebuffer is drawn from the main camera's view, and the
current portal shader is just using the portal mesh's provided texture
coordinates to apply the texture. These two don't really match up, and as a
result we see the other scene from our cameras perspective applied flatly
to the portal.

There are two possible solutions here - either we adjust the camera we render
the second scene with so the texture looks correct when applied to the portal,
or we adjust the texture coordinates so the portal looks correct. The latter
is far simpler, and so it's the approach we shall follow.

Note that, because the second scene is drawn with the exact same perspective
as our main one, we could draw the second scene's framebuffer directly onto
our window and it'd correctly show us the world through the portal. Of course,
we don't want to render this onto the entire window, but we can use our
portal as a 'window' into this view of the framebuffer.

Since the goal is to project the framebuffer directly onto the screen, what
we'd like to do is use the portals screen-space coordinates as it's texture
coordinates. Adjust the texture coordinates within the vertex shader so they
are set according to the screen space position. Recall that the vertex
shader's output `gl_Position` is used to determine the screen space position.

> In `portal.vert`, after calculating `gl_Position`, use the following to
> determine the texture coordinates:
> ```GLSL
> v_tex_coord = (gl_Position.xy / gl_Position.w) * 0.5 + vec2(0.5);
> ```
> Importantly, note that we have to divide by `w`. Remember that OpenGL
> determines the final position in NDC space by dividing `gl_Position.xyz`
> by `gl_Position.w` - this is the perspective transform.
> 
> Also, we multiply by 0.5 and add 0.5 in order to translate from
> NDC's -1 to 1 range to the 0 to 1 range of texture coordinates.

This should now look much better. However, strange deformation occurs when
the camera gets close. Why is this?

> By default OpenGL's interpolation of all vertex shader outputs takes
> perspective into account. This is correct when values are being
> interpolated across the surface of a polygon in 3D, but looks wrong when
> applied to the screen-space coordinates of our texture.
> 
> For what it's worth, the PS1 lacked perspective correct interpolation,
> and so you'd see a similar warping on all objects. However, in that case
> they experienced the exact opposite issue to us.

We can fix this by adding the `noperspective` interpolation qualifier to
`v_tex_coord`.

> In `portal.vert` you should have:
> ```GLSL
> noperspective out vec2 v_tex_coord;
> ```
> And in `portal.frag` you should have:
> ```GLSL
> noperspective in vec2 v_tex_coord;
> ```

Try running the scene again. This time you should have a working portal
effect, congratulations!

### D. Clipping Planes (15 mins)

If you went through the portal into the interior scene and then looked back
out, you may have noticed your view through the portal was cut off by a wall.
What is this wall, and why is it there?

> This wall is the backside of the wall the portal is placed on to in the
> exterior scene. Remember that the exterior scene in the framebuffer is
> being rendered from the perspective of your current camera. If you place the
> camera in the exterior scene behind the wall (where the interior scene is
> located spatially), it should be clearer how the wall blocks your view of
> the other side of the portal.

We can remove this wall by utilising a clipping plane. You may recall from
the lecture that OpenGL provides us with several clipping planes by default -
one for each side of the unit cube within NDC. We can however specify our own,
and so we will create a plane where the portal is, clipping anything on the
wrong side of it.

First, we need to calculate where the clipping plane is. Since we are using
a combined model/view matrix, we will have to do all our calculations in view
space, which means converting this plane to view space also. Add code to the
`main` function which calculates the plane equation of the view space
clipping plane. The usual plane equation is `Ax + By + Cz + D = 0`, we can
represent this as `glm::vec4(A, B, C, D)` for easy use in our shader. The
`renderer_t` struct has a `portal_clip_plane` field for us to store this
plane in.

> In the reference solution, the view space clipping plane is calculated with
> the following code each frame in the `main` function in `main.cpp`:
> ```C++
> glm::mat4 view = get_view(cam);
> glm::vec3 plane_point(0, 0, -10);
> glm::vec3 plane_normal(0, 0, camera_in_interior ? -1 : 1);
> glm::vec3 view_ppoint = glm::vec3(view * glm::vec4(plane_point, 1));
> glm::vec3 view_pnormal = glm::mat3(view) * plane_normal;
> float view_pd = glm::dot(-view_ppoint, view_pnormal);
> renderer.portal_clip_plane = glm::vec4(view_pnormal, view_pd);
> ```
> `plane_point` is an arbitrary point on the plane and `plain_normal` is it's
> normal in world space. The `view_ppoint` and `view_pnormal` variables are
> the equivalent in view space, as they are transformed by the view matrix.
> Finally, `view_pd` is the `D` term of our plane equation.

We will also need to enable our custom clipping plane. Surround the code to
draw to the framebuffer with `glEnable`/`glDisable` for `GL_CLIP_DISTANCE0`.

> In the `main` function in `main.cpp`, rendering your other scene should now
> look something like:
> ```C++
> glBindFramebuffer(GL_FRAMEBUFFER, framebuffer.fbo);
> glEnable(GL_CLIP_DISTANCE0);
> if (!camera_in_interior) {
>     render(renderer, cam, scene_interior);
> } else {
>     render(renderer, cam, scene_exterior);
> }
> glDisable(GL_CLIP_DISTANCE0);
> glBindFramebuffer(GL_FRAMEBUFFER, 0);
> ```                     

Before we can use it in a shader, we will need to upload the plane equation
to a uniform. We will need to do this for every shader that needs clipping.
As only the `static_mesh` shader is used for anything that intersects our
view, we can get away with only implementing for this shader.

Upload the plane equation to the `u_clip_plane` uniform in the `draw_model` function.

> In the `draw_model` function in `renderer.cpp`, add this code towards the
> beginning:
> ```C++
> set_uniform("u_clip_plane", renderer.portal_clip_plane);
> ```

Next, add the corresponding uniform to `static_mesh.vert`. You also need to
define `out float gl_ClipDistance[1];`, and then calculate and store the
signed distance from the vertex to the plane in `gl_ClipDistance[0]`.

> Your final `static_mesh.vert` should look something like:
> ```GLSL
> #version 330 core
> uniform mat4 u_model_view;
> uniform mat4 u_projection;
> uniform vec4 u_clip_plane;
> 
> layout (location = 0) in vec4 a_pos;
> layout (location = 1) in vec2 a_tex_coord;
> 
> out vec2 v_tex_coord;
> out float gl_ClipDistance[1];
> 
> void main() {
>     v_tex_coord = a_tex_coord;
>     vec4 view_pos = u_model_view * a_pos;
>     gl_Position = u_projection * view_pos;
>     gl_ClipDistance[0] = dot(u_clip_plane, view_pos);
> }
> ```
> Unlike gl_Position, we need to explicity declare gl_ClipDistance as an
> output. It is an array of one as we only have a single clipping plane, if
> we had multiple we would give the array the corresponding size.
> 
> The gl_ClipDistance array elements should be the signed distance from each
> corresponding clip plane. OpenGL will then clip the face where it crosses
> a distance of zero from the plane. The formula `dot(u_clip_plane, view_pos)`
> is sufficient to calculate the distance from the plane in the encoding we
> used, see if you can figure out why.

Congratulations, you should now have a fully working portal effect! Feel
free to play around with it and see what new effects you can come up with.
See the Challenge Yourself section for some ideas.

## Challenge Yourself

### 1. Improved Cubemap

The current cubemap doesn't match the surrounding scene at all. Can you make
a more believable cubemap? How can you ensure the edges of the images are
properly aligned?

### 2. Mirror Reflections

The exact same technique we used to create the portals can be used to
implement a mirror. Think of a mirror as just being a 'portal'  into a
mirrored version of your own world. Try turning the portals into mirrors.
What advantages and disadvantages does this kind of reflection have over
cubemaps?

### 3. Stencils

In fact, framebuffers are not the only way to achieve either a portal or
a mirroring effect. Research how a stencil buffer could be used for either
effect. What advantages and disadvantages does each approach have? What
technique does Valve's game Portal use, and why?

### 4. Distortion

Currently we sample the pixel in the framebuffer corresponding exactly to the
pixel on the screen, so it looks as if the surface isn't there at all.
However, we could offset our texture coords by small amounts in the fragment
shader to implement a distortion effect. Try adding a wavy texture to the
portal, sampling it using the texture coordinate vertex attribute, and adding
it's red/green channels to the coordinate used for sampling the framebuffer.
This technique is known as a Du/Dv map (amongst other names).

## Further Reading
- LearnOpenGL has sections on both [cubemaps](https://learnopengl.com/Advanced-OpenGL/Cubemaps) and [framebuffers](https://learnopengl.com/Advanced-OpenGL/Framebuffers).
- YouTube user ThinMatrix has a great [playlist on creating a water effect using planar reflections](https://www.youtube.com/playlist?list=PLRIWtICgwaX23jiqVByUs0bqhnalNTNZh).
- [This video](https://www.youtube.com/watch?v=_SmPR5mvH7w) details someone's attempt at recreating the portal effect in Unity with stencils.
- The tutorial site open.gl has a tutorial on [reflections using stencils](https://open.gl/depthstencils).
