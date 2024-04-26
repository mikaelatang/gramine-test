#!/usr/bin/env bash

whereis python
cd gatk
gatk --list
gatk ValidateSameFile -I /inputs/NA12878_24RG_small.hg38.bam -MODE SUMMARY
