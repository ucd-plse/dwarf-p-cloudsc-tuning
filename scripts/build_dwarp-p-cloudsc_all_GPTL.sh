#!/bin/bash

TUNING_REPO_ROOT=$(realpath $(dirname $(realpath $0))/.. )
cd $TUNING_REPO_ROOT

./cloudsc-bundle build --clean --with-mpi --arch=./arch/ucar/derecho/intel/2023.0.0_GPTL