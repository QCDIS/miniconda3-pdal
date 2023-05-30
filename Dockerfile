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
RUN wget https://raw.githubusercontent.com/QCDIS/NaaVRE/main/docker/laserfarm-pytorch/test_laserchicken.py
RUN python test_laserchicken.py
RUN rm test_laserchicken.py

