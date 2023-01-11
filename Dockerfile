FROM continuumio/miniconda3

RUN conda install -c mamba conda-forge conda-merge conda-pack

COPY environment.yml .
RUN mamba env create -f environment.yml

RUN conda list