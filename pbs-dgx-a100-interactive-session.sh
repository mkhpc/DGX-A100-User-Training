#!/bin/bash
qsub -I -q dgx -l select=1:host=dgx:ncpus=16:ngpus=1
