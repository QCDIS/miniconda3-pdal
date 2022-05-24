FROM continuumio/miniconda3
RUN apt-get update --allow-releaseinfo-change && apt-get -y install gcc g++
ARG VERSION=v4.9.6
ARG BINARY=yq_linux_386
RUN wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY} -O /usr/bin/yq \ 
    && chmod +x /usr/bin/yq    
RUN conda install -c conda-forge conda-pack
COPY environment.yaml .
RUN conda env create -f environment.yaml
