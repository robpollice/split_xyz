#!/bin/bash

#$1 path to XYZ file

# Get number of atoms in molecule
natoms=$(head -n1 $1)
nxyz=$(( natoms + 2 ))

# Count number of conformers
nlines=$(cat $1 | wc -l)
nconf=$(awk -v num=$nlines -v den=$nxyz 'BEGIN {print num/den}')

for i in $(seq 1 $nconf); do

    mkdir ./$i
    nlines=$(( i * nxyz ))
    head -n $nlines $1 | tail -n $nxyz > ./$i/conf.xyz

done

