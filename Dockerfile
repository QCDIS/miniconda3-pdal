FROM continuumio/miniconda3
RUN conda install -c conda-forge conda-pack
COPY environment.yaml .
RUN conda env create -f environment.yaml
