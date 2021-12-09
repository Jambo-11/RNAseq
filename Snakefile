IDs, = glob_wildcards("src/data/raw_data/{filename}.fastq.gz")
raw_data_dir = "src/data/raw_data"
outputdir = "gen/analysis/output"



rule all:
    input: 
        expand("/{filename}.fastqc.html", filename = IDs)

rule fastqc:
    input:
        read = raw_data_dir + "/{filename}.fastq.gz"
    output: 
        "/{filename}.fastqc.html"
#        outputdir + "/{filename}.fastqc.zip"
    shell:
        """
        module add UHTS/Quality_control/fastqc/0.11.9
        fastqc {input.read}
        """

