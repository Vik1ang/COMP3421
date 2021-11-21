#!/usr/bin/env sh

tmp_dir="tmp"

chicken_dir="$(dirname -- "$(realpath -- "../chicken3421-package/CMakeLists.txt")")"

echo "Removing old lib folder(if it exists)..."
rm -rf lib

mkdir lib
cd lib || exit

echo "Fetching dependencies..."

cp -r ${chicken_dir} ${tmp_dir}

cd ${tmp_dir} || exit

if [ $# -eq 0 ];
then
  echo "Running CMake with system defaults"
  cmake_args="-DCMAKE_BUILD_TYPE=Default"
else
  echo "Running CMake with args: $*"
  cmake_args=$*
fi

cmake -S . -B ${tmp_dir} $cmake_args
cmake --build ${tmp_dir}

cd ..
cmake --install ${tmp_dir}/${tmp_dir} --prefix .

echo "Cleaning up..."
rm -rf ${tmp_dir}