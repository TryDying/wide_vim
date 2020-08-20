#!/bin/bash

export PWD_TMP=$PWD
export VIM=$HOME/.vim
mkdir /tmp/.ycm_build
cd /tmp/.ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=OFF -DUSE_SYSTEM_LIBCLANG=ON \
    -DUSE_PYTHON2=OFF \
    . $VIM/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core
yes | rm -rf /tmp/.ycm_build
cd $PWD_TMP
