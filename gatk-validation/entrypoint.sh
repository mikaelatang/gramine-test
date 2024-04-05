#!/bin/sh

gramine-sgx-get-token --output bash.token --sig bash.sig
gramine-sgx ./bash -c "pwd && ls && bash /app/gatk.sh"
#gramine-sgx gatk ValidateSameFile -I /inputs/NA12878_24RG_small.hg38.bam -M SUMMARY 
