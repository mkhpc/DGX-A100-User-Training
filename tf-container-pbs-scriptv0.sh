#!/bin/bash
#PBS -N testjob
#PBS -l select=1:host=dgx:ncpus=16:ngpus=1
#PBS -q dgx
#PBS -joe

cd $PBS_O_WORKDIR

/usr/local/bin/singularity run --nv /opt/apps/sif/tensorflow_21.12-tf2-py3.sif python -c 'import tensorflow as tf; print(tf.__version__)'
