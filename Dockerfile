FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl wget git zip unzip \
    build-essential \
    libgl1 \
    libegl1 \
    libxkbcommon0 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    qt6-base-dev \
    libx11-xcb1 \
    libxcb1 \
    libxcb-util1 \
    libxrender1 \
    libxi6 \
    libxcb-render0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-xfixes0 \
    libxcb-sync1 \
    libxcb-randr0 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-icccm4 \
    libxcb-cursor0 \
    libxcb-xinerama0 \
    libxcb-glx0 \
    libxcb-present0 \
    libxcb-dri3-0 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG UID=1000
ARG USER=developer
RUN useradd -m -u ${UID} ${USER}
ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/${USER}
WORKDIR ${HOME}

USER ${USER}
RUN pip install --upgrade pip \
    && pip install commonroad-scenario-designer

RUN git clone https://github.com/CommonRoad/commonroad-scenario-designer.git   

CMD ["/bin/bash"]
