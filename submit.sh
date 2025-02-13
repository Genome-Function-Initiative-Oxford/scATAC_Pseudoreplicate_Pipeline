#!/bin/bash
#SBATCH --partition=long
#SBATCH --job-name=pseudo_snake
#SBATCH --ntasks=8
#SBATCH --mem=100G
#SBATCH --time=01-00:00:00 # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --mail-user=tom.wilson@imm.ox.ac.uk
#SBATCH --output=slurm_debug/%j_%x.out
#SBATCH --error=slurm_debug/%j_%x.err

source /path/to/baseenv/bin/activate upstream

mkdir slurm_debug -p

snakemake --configfile=config/config.yaml all --cores 8 --unlock
snakemake --configfile=config/config.yaml all --cores 8 --rerun-incomplete --keep-going