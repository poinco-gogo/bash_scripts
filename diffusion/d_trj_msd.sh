#!/bin/bash

psf="../../popc48.psf"

for i in `seq 1 2`;do

catdcd -o tmp.dcd \
../eq006/output/$i.dcd \
../eq007/output/$i.dcd \
../eq008/output/$i.dcd \
../eq009/output/$i.dcd \
../eq010/output/$i.dcd \
../eq011/output/$i.dcd \
../eq012/output/$i.dcd \
../eq013/output/$i.dcd \
../eq014/output/$i.dcd \
../eq015/output/$i.dcd

/home/ktamu/develop/md_analysis/src/d_trj_msd.x $psf tmp.dcd POPC 100 xy > $i.msd

/home/ktamu/develop/md_analysis/src/d_diffusion.x $i.msd 20 10 xy > $i.log

done

rm -fv tmp.dcd
