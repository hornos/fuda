#!/bin/bash

gbn=$(basename ${BASH_SOURCE})
gbn=${gbn%%.sh}

if test "${OSTYPE##darwin}" = "${OSTYPE}" ; then
  # linux
  LD_LIBRARY_PATH="${CUDA_HOME:-/opt/cuda}/lib"
else
  # osx
  DYLD_LIBRARY_PATH="${CUDA_HOME:-/usr/local/cuda}/lib"
fi

./${gbn} $*
