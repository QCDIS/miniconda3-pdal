FROM continuumio/miniconda3

RUN conda install mamba -n base -c conda-forge
COPY environment.yml .
RUN mamba env create -f environment.yml

RUN conda list