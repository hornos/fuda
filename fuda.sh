#!/bin/bash

if test "${OSTYPE##darwin}" = "${OSTYPE}" ; then
  # linux
  LD_LIBRARY_PATH="${CUDA_HOME:-/opt/cuda}/lib" ./fuda $*
else
  # osx
  DYLD_LIBRARY_PATH="${CUDA_HOME:-/usr/local/cuda}/lib" ./fuda $*
fi
