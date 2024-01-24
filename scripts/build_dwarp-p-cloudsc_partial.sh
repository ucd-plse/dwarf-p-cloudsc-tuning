#!/bin/bash

TUNING_REPO_ROOT=$(realpath $(dirname $(realpath $0))/.. )
cd $TUNING_REPO_ROOT

source ./scripts/set_env.sh

cd build
make -f CMakeFiles/Makefile2 cloudsc-dwarf/src/cloudsc_fortran/all