#!/usr/bin/perl
use warnings;

rename 's/(\w_).*_(R[1-2]).*(.fastq.gz)/$1$2$3/' .*fastq.gz