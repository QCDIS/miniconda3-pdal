FROM condaforge/mambaforge:23.1.0-4

RUN conda install -c conda-forge conda-merge conda-pack
RUN wget https://raw.githubusercontent.com/QCDIS/NaaVRE/main/docker/laserfarm-pytorch/environment.yaml
RUN mamba env create -f environment.yaml

ENV PATH /opt/conda/envs/venv/bin:$PATH
SHELL ["conda", "run", "-n", "venv", "/bin/bash", "-c"]
RUN echo "conda activate venv" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

# test packages
RUN wget https://raw.githubusercontent.com/QCDIS/NaaVRE/main/docker/laserfarm-pytorch/test_laserchicken.py
RUN python test_laserchicken.py
RUN rm test_laserchicken.py

