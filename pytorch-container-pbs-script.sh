#!/bin/bash
#PBS -N testjob
#PBS -l select=1:host=dgx:ncpus=16:ngpus=1
#PBS -q dgx
#PBS -joe

cd $PBS_O_WORKDIR

/usr/local/bin/singularity run --nv /opt/apps/sif/pytorch_21.12-py3.sif python -c 'import torch; print(torch.__version__)'
