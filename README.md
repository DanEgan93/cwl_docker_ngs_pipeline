<h1> Introduction

A NGS analysis pipeline to analyse Illumina PE sequencing data. The pipeline is co-ordinated by the CWL specification. The CWL workflow pull images from Dockerhub and runs NGS analysis tools within independent Docker containers. The NGS analysis pipeline and tools included have been summaries in the figure below.

![workflow](/images/workglow.jpg)

Note: Development was suspended and the last container of this pipeline has not been added to the PE_universal workflow. A CWL pipeline is available for all stages up to alignment. This is stored in the iteration 1 folder. Instructions on how to run the CWL-Docker pipeline up to the alignment step have been provided below.

<h1> Dependencies

1. Docker CE edition (version 18.06.1-ce )
1. cwltool (version 1.0.2)
1. Python 3 (version 3.7)

<h1> Pre-requisites

1. Clone this repository- https://github.com/DanEgan93/cwl_docker_ngs_pipeline.git

<h1> Running CWL-Docker pipeline

1. Change directory into directory containing FASTQ samples to be analysed.
1. Manually enter sample names into universal_PE_job.yml.
1. run command (replacing {} with  location of cloned repository}:
    * cwltool {cwl_docker_ngs_pipeline/iteration_1}/universal_PE_workflow.cwl {cwl_docker_ngs_pipeline/iteration_1}/universal_PE_job.yml
1. Check output directory for expected pipeline output.
