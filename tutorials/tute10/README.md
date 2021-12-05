# Tutorial 10

This week is dedicated to exploring some simple post-processing effects and exploring how our favourite games/movies
have used all the techniques learnt in this course to immerse us.

**IMPORTANT!!! Before completing this tute Please fill out MyExperience!**

## It's ~~Not~~ All Black & White

### A. Implementing a Black & White Filter (25 mins)

The current program showcases the true overlord of Computer graphics in her full sRGB glory.

Let's explore how glorious she'll be in Black & White.

We shall implement a simple black and white filter as a post-processing effect.

How to accomplish this? If one considers the window as a 2D surface (which it is), then the scene can be thought of as a
texture that covers it completely. In this perspective, any post-processing effect simply operates on the pixels in that
texture!

With this in mind:

1. Fill in the code in `model.hpp/cpp` that generates the geometry for a simple textured quad.
    - What co-ordinate space are the positions of this quad in? Where have we seen this before?
    - > Should be in NDC. No projection needs to occur. Throwback to weeks 1 & 2.

2. Extend the functions in `renderer.hpp/cpp` to accommodate for rendering to a specified target and applying a
   black-and-white filter effect.
    - One of these functions is an overload of `render()`. It should delegate most of the work to the other version
      of `render()`, but first sets the active framebuffer.
    - `post_process()` should simply render the textured quad given to it with the B&W shaders.
3. Combine these two modifications in `main.cpp` by generating a new framebuffer object the same size as the window and
   and conditionally rendering the coloured scene vs. the same scene in black white. A callback that toggles whether or
   not to use this filter by pressing the spacebar is provided for you.
4. Finally, fill in `bw.vert/frag` in `res/shaders` to implement the black-and-white filter. The vertex shader should be
   a simple passthrough and the fragment shader should average the pixels of the scene texture.

Once this is completed, bask in the glory that is B&W chicken!

What's that message in the bottom-right corner?
> Just some wholesome communication

### B. How It's Made (35 mins)

Select 1 - 3 screenshots or videos of your favourite game, movie, tech demo, etc., that are visually appealing to you.

Analyse the scene and hypothesise how the creators of this content might have used the various techniques learnt in this
course to create such a scene.

Things to look out for:

- If there's a sky, is it moving? If there's not a sky, how have the developers prevented (or intended!) a
  claustrophobic feeling?
- If there's water, is the water moving? How might we simulate simple water physics without being too computationally
  intensive?
- If the character in the foreground is humanoid, how are they composed? Is there anything hanging off of them?
- Is there lighting in the scene? If so, how many lights? Are the lights dynamic or static?

## Challenge Yourself

### 1. Composing Effects

Black & White is cool, but there are many more post-processing effects that could be done. One relatively simple effect
is motion blur.

At a high-level, motion blur is simply blending the current frame with _n_ many frames rendered previously in some
weighted manner (e.g. uniformly interpolate, weight the current frame more, etc.).

Try implementing motion blur on top of or in lieu of the current B&W filter.

### 2. R&D

There is still much to learn in computer graphics (even from decades ago). Choose **one** aspect of the scene from (B)
you're unsure of and that appeals to you and research it.

Then, try and make a simple program that demonstrates that technique. Feel free to show everyone you know how smart you
are if you succeed!

## Further Resources

- [LearnOpenGL on another screen-space effect called Screen-Space Ambient Occlusion](https://learnopengl.com/Advanced-Lighting/SSAO)
