FROM continuumio/miniconda3:23.3.1-0
RUN conda install -c conda-forge mamba
RUN wget https://raw.githubusercontent.com/QCDIS/NaaVRE/main/docker/laserfarm-pytorch/environment.yaml
RUN mamba env create -f environment.yaml

RUN conda list


SHELL ["conda", "run", "-n", "venv", "/bin/bash", "-c"]
RUN echo "conda activate venv" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

RUN conda install -c conda-forge conda-merge conda-pack

# test packages
RUN python -c "import fnmatch"
RUN python -c "from dask.distributed import LocalCluster, SSHCluster "
RUN python -c "from laserfarm import Retiler, DataProcessing, GeotiffWriter, MacroPipeline"
RUN python -c "from laserfarm.remote_utils import get_wdclient, get_info_remote, list_remote"
RUN python -c "from laserfarm.data_processing import DataProcessing"


