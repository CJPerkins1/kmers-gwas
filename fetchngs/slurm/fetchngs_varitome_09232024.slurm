#!/usr/bin/env bash
#SBATCH --job-name=nf_fetchngs_test
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=10gb
#SBATCH --time=40:00:00
#SBATCH --account=rpalaniv
#SBATCH --partition=standard
#SBATCH --output=%x_%A_%a.out
#SBATCH --error=%x_%A_%a.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=cjperkins1@arizona.edu

# Sourcing my .bashrc so that conda works and the path is how it should be
source /home/u28/cjperkins1/.bashrc

# Activating the conda environment
conda activate nf

cd '/xdisk/rpalaniv/cjperkins1/kmers-gwas/genomes/varitome'

# Running Nextflow
nextflow run nf-core/fetchngs \
  -c '/xdisk/rpalaniv/cjperkins1/kmers-gwas/fetchngs/config/2023-05-08_fetchngs.config' \
  -r dev \
  -profile singularity \
  -resume \
  --input '/xdisk/rpalaniv/cjperkins1/kmers-gwas/fetchngs/input/gwas_srr_10012024.tsv' \
  --outdir '/xdisk/rpalaniv/cjperkins1/kmers-gwas/genomes/varitome'
