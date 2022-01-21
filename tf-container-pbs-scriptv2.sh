#!/bin/bash
#PBS -N testjob
#PBS -l select=1:host=dgx:ncpus=16:ngpus=1
#PBS -q dgx
#PBS -joe

cd $PBS_O_WORKDIR

git clone https://github.com/tensorflow/benchmarks.git
cd benchmarks/scripts/tf_cnn_benchmarks
/usr/local/bin/singularity run --nv /opt/apps/sif/tensorflow_21.12-tf2-py3.sif python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=32 --model=resnet50 --variable_update=parameter_server
