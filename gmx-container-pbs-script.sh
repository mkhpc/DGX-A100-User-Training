#!/bin/bash
#PBS -N testjob
#PBS -l select=1:host=dgx:ncpus=16:ngpus=1
#PBS -q dgx
#PBS -joe

cd $PBS_O_WORKDIR
DATA_SET=water_GMX50_bare
wget -c https://ftp.gromacs.org/pub/benchmarks/${DATA_SET}.tar.gz
tar xf ${DATA_SET}.tar.gz
cd ./water-cut1.0_GMX50_bare/1536

/usr/local/bin/singularity run --nv /opt/apps/sif/gromacs_2021.3.sif gmx grompp -c conf.gro -p topol.top -f pme.mdp -o test.tpr

/usr/local/bin/singularity run --nv /opt/apps/sif/gromacs_2021.3.sif gmx mdrun -deffnm test -v -nsteps 10000 -nb gpu -pme gpu -ntmpi 1 -ntomp 16 -resethway -noconfout -pin on -noddcheck -update gpu
