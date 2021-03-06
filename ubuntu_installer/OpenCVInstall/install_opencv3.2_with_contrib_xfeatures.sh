#!/bin/bash
sudo apt-get install --assume-yes build-essential checkinstall libgtk2.0-dev libboost-all-dev  libdc1394-22 libdc1394-22-dev libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip ffmpeg libgtk-3-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev qtbase5-dev yasm libavcodec-dev libavformat-dev libswscale-dev python3-dev python3-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# install opencv
cd ~
git clone git://github.com/opencv/opencv.git
cd opencv

# install more functional from contrib
git clone https://github.com/opencv/opencv_contrib.git
mkdir build
cd build

# this cmake set up will disable opencv contrib module related with caffe.
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules -D PYTHON_EXECUTABLE=/usr/bin/python -D WITH_CUDA=OFF -D BUILD_SHARED_LIBS=OFF -D BUILD_EXAMPLES=ON  ..
make -j8
make check -j8
sudo make install
sudo ldconfig
