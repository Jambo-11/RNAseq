#!/bin/sh
# properties = {"log": [], "cluster": {"mail-type": "start,end,fail", "mail-user": "philipp.graber@students.unibe.ch", "time": 86400, "cpus-per-task": 6, "mem": "25G", "ntasks-per-node": 14, "job-name": "fastqc", "output": "/log/fastqc-%j.out", "error": "/log/fastqc-%j.err"}, "wildcards": {"filename": "HD19_L1_R1"}, "rule": "fastqc", "threads": 1, "input": ["src/data/raw_data/HD19_L1_R1.fastq.gz"], "params": {}, "jobid": 11, "output": ["gen/analysis/output/fastqc/HD19_L1_R1.fastqc.html", "gen/analysis/output/fastqc/HD19_L1_R1.fastqc.zip"], "type": "single", "resources": {}, "local": false}
cd /data/courses/rnaseq/lncRNAs/Project1/users/pgraber && \
/software/bin/python3 \
-m snakemake gen/analysis/output/fastqc/HD19_L1_R1.fastqc.html --snakefile /data/courses/rnaseq/lncRNAs/Project1/users/pgraber/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /data/courses/rnaseq/lncRNAs/Project1/users/pgraber/.snakemake/tmp.wcd1sdel src/data/raw_data/HD19_L1_R1.fastq.gz --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
   --nocolor \
--notemp --no-hooks --nolock --mode 2  --allowed-rules fastqc  && touch "/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/.snakemake/tmp.wcd1sdel/11.jobfinished" || (touch "/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/.snakemake/tmp.wcd1sdel/11.jobfailed"; exit 1)

