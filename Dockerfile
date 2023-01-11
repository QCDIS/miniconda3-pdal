FROM continuumio/miniconda3
RUN conda install -c conda-forge mamba conda-merge conda-pack

COPY environment.yml .
RUN mamba env create -f environment.yml

RUN conda list