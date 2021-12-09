IDs, = glob_wildcards("src/data/raw_data/{filename}.fastq.gz")
raw_data_dir = "src/data/raw_data"
outputdir = "gen/analysis/output"



rule all:
    input: 
        expand(outputdir + "/{filename}.fastqc.html", filename = IDs)

rule fastqc:
    input:
        raw_data_dir + "/{filename}.fastq.gz"
    output: 
        outputdir + "/{filename}.fastqc.html",
        outputdir + "/{filename}.fastqc.zip"
    shell: 
        """
        mkdir fastqc
        fastqc --outdir="{/fastqc"} {input.read}