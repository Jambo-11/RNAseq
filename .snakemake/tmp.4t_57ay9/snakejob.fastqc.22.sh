#!/bin/sh
# properties = {"log": [], "wildcards": {"filename": "HD17_L1_R2"}, "threads": 1, "cluster": {"mail-type": "start,end,fail", "mail-user": "philipp.graber@students.unibe.ch", "time": 86400, "cpus-per-task": 6, "mem": "25G", "ntasks-per-node": 14, "job-name": "fastqc", "output": "/log/fastqc-%j.out", "error": "/log/fastqc-%j.err"}, "output": ["gen/analysis/output/fastqc/HD17_L1_R2.fastqc.html", "gen/analysis/output/fastqc/HD17_L1_R2.fastqc.zip"], "local": false, "resources": {}, "input": ["src/data/raw_data/HD17_L1_R2.fastq.gz"], "params": {}, "rule": "fastqc", "type": "single", "jobid": 22}
cd /data/courses/rnaseq/lncRNAs/Project1/users/pgraber && \
/software/bin/python3 \
-m snakemake gen/analysis/output/fastqc/HD17_L1_R2.fastqc.html --snakefile /data/courses/rnaseq/lncRNAs/Project1/users/pgraber/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /data/courses/rnaseq/lncRNAs/Project1/users/pgraber/.snakemake/tmp.4t_57ay9 src/data/raw_data/HD17_L1_R2.fastq.gz --latency-wait 5 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
   --nocolor \
--notemp --no-hooks --nolock --mode 2  --allowed-rules fastqc  && touch "/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/.snakemake/tmp.4t_57ay9/22.jobfinished" || (touch "/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/.snakemake/tmp.4t_57ay9/22.jobfailed"; exit 1)

