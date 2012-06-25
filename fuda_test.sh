#!/bin/bash

gbn=$(basename ${BASH_SOURCE})
gbn=${gbn%%.sh}

_cuda_home=${CUDA_HOME:-/opt/cuda}
_arch=$(uname -m | awk -F_ '{print $2}')

if test "${OSTYPE##darwin}" = "${OSTYPE}" ; then
  # linux
  LD_LIBRARY_PATH="${_cuda_home}/lib${_arch}"
else
  # osx
  _cuda_home=${CUDA_HOME:-/usr/local/cuda}
  DYLD_LIBRARY_PATH="${_cuda_home}/lib"
fi

./${gbn} $*
