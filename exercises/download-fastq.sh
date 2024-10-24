#!/bin/bash

# Set run parameters
set -euo pipefail

# Define config variables
R1_FASTQ="subset-SRR11518889_1.fastq.gz"
R2_FASTQ="subset-SRR11518889_2.fastq.gz"
R1_URL="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset/${R1_FASTQ}"
R2_URL="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset/${R2_FASTQ}"

DATADIR="../data/raw/fastq"
mkdir -pv "$DATADIR"

download_file() {
	echo "downloading ${1}"
	curl "$1" -o - > "$(basename "$1")"
}

download_file "$R1_URL"
download_file "$R2_URL"

mv "$R1_URL" "$DATADIR/${R1_FASTQ#subset-}"
mv "$R2_URL" "$DATADIR/${R2_FASTQ#subset-}"

# echo "Read 1 FASTQ contains  $(( $(curl "$R1_URL" -o - | gunzip | wc -l) / 4)) reads"
# echo "Read 2 FASTQ contains  $(( $(curl "$R2_URL" -o - | gunzip | wc -l) / 4)) reads"
