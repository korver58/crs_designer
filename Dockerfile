FROM python:3.9.12-slim

ENV PATH ~/miniconda3/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]
WORKDIR /home/workspace

RUN apt-get update && apt-get install -y \
    curl wget git \
    build-essential \
    libxcb-xinerama0 libxi6 libgl1-mesa-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py39_4.11.0-Linux-x86_64.sh -O ~/Miniconda.sh \
    && /bin/bash ~/Miniconda.sh -b -p ~/miniconda3 \
    && rm ~/Miniconda.sh \
    && echo ". ~/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc \
    && echo "conda activate base" >> ~/.bashrc

RUN ~/miniconda3/bin/conda install -c conda-forge mamba -yq \
    && ~/miniconda3/bin/mamba clean -a -y

RUN conda install -c conda-forge cartopy \
    && conda install -c anaconda pyqt

COPY ./commonroad-scenario-designer .
RUN source ~/.bashrc \
    && python setup.py install

CMD ["/bin/bash"]