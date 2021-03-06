#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.bowtie_reference)
      - $(inputs.forward)
      - $(inputs.reverse)
  InlineJavascriptRequirement: {}
  ShellCommandRequirement:
    class:

hints:
  DockerRequirement:
    dockerPull : danielegan93/cwl_docker_ngs_pipeline:bowtie2

baseCommand: [bowtie2-build]
inputs:
  bowtie_reference:
    type: File
    inputBinding:
      valueFrom: $(self.basename)
      position: 1
  ref_name:
    type: string
    default: 'human_bowtie_index'
    inputBinding:
      position: 2
  dual_cmd:
    type: string
    default: '&&'
    inputBinding:
      shellQuote: False
      position: 3
  align_cmd:
    type: string
    default: 'bowtie2'
    inputBinding:
      position: 4
  forward:
    type: File
    inputBinding:
      valueFrom: $(self.basename)
      position: 6
      prefix: '-1'
      separate: True
  reverse:
    type: File
    inputBinding:
      valueFrom: $(self.basename)
      position: 7
      prefix: '-2'
      separate: True
  s_flag:
    type: string
    default: '-S'
    inputBinding:
      position: 8

arguments:
  - valueFrom: $('-x '+inputs.ref_name)
    position: 5
  - valueFrom: $(inputs.forward.nameroot.split("_")[0] + '.sam')
    position: 9
outputs:
  aligned_bam:
    type: File
    outputBinding:
      glob: $(inputs.forward.nameroot.split("_")[0] + '.sam')
  log_file_stdout:
    type: stdout
  log_file_stderr:
    type: stderr

stdout: bowtie2_stdout.txt
stderr: bowtie2_stderr.txt
