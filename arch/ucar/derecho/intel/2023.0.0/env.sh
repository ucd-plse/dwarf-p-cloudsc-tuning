#!/bin/bash
source /glade/u/home/jdvanover/precimonious-w-rose/scripts/derecho/activate_PROSE_environment.sh

module reset
module load intel-classic/2023.0.0
module load parallel-netcdf/1.12.3
module load parallelio/2.6.1
module load cmake

export CC=mpicc
export CXX=mpicxx
export FC=mpif90

export HDF5_ROOT=/glade/u/apps/derecho/23.06/spack/opt/spack/hdf5/1.12.2/cray-mpich/8.1.25/oneapi/2023.0.0/ktun
export ECBUILD_TOOLCHAIN="./toolchain.cmake"
# export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/glade/u/home/jdvanover/gptl-8.1.1/install-intel/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/glade/u/home/jdvanover/gptl-8.1.1/install-intel-w-omp/lib