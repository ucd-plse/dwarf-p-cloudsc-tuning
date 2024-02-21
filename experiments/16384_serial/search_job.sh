#!/bin/bash
#PBS -N cloudsc_experiment
#PBS -A UCDV0023
#PBS -l walltime=1:00:00
#PBS -q main
#PBS -l job_priority=regular
#PBS -j oe
#PBS -k eod
#PBS -l select=10:ncpus=128:mpiprocs=128:mem=235GB

source ../../scripts/set_env.sh
python3 ${PROSE_REPO_PATH}/scripts/prose_search.py -s setup.ini