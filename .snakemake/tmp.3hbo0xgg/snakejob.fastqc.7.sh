#!/bin/sh
# properties = {"wildcards": {"filename": "HD16_L2_R2"}, "threads": 1, "params": {}, "jobid": 7, "rule": "fastqc", "resources": {}, "type": "single", "output": ["gen/analysis/output/fastqc/HD16_L2_R2.fastqc.html", "gen/analysis/output/fastqc/HD16_L2_R2.fastqc.zip"], "cluster": {"mail-type": "start,end,fail", "mail-user": "philipp.graber@students.unibe.ch", "time": 86400, "cpus-per-task": 6, "mem": "25G", "ntasks-per-node": 14, "job-name": "fastqc", "output": "/log/fastqc-%j.out", "error": "/log/fastqc-%j.err"}, "local": false, "input": ["src/data/raw_data/HD16_L2_R2.fastq.gz"], "log": []}
cd /data/courses/rnaseq/lncRNAs/Project1/users/pgraber && \
/software/bin/python3 \
-m snakemake gen/analysis/output/fastqc/HD16_L2_R2.fastqc.html --snakefile /data/courses/rnaseq/lncRNAs/Project1/users/pgraber/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /data/courses/rnaseq/lncRNAs/Project1/users/pgraber/.snakemake/tmp.3hbo0xgg src/data/raw_data/HD16_L2_R2.fastq.gz --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
   --nocolor \
--notemp --no-hooks --nolock --mode 2  --allowed-rules fastqc  && touch "/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/.snakemake/tmp.3hbo0xgg/7.jobfinished" || (touch "/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/.snakemake/tmp.3hbo0xgg/7.jobfailed"; exit 1)

