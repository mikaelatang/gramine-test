#!/usr/bin/env bash

whereis python
/gatk/gatk --list
/gatk/gatk ValidateSameFile -I /inputs/NA12878_24RG_small.hg38.bam -MODE SUMMARY
