FROM ubuntu

RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends git make cmake g++ pkg-config libtool libtool-bin m4 wget unzip automake && \
    apt install -y --no-install-recommends python-dev python-pip python3-dev python3-pip && \
    apt install -y --no-install-recommends software-properties-common && \
    add-apt-repository ppa:neovim-ppa/stable && \
    apt update && \
    apt install -y neovim && \
    apt clean

WORKDIR /work

ENV NVIM_VERSION 0.2.0

RUN wget --no-check-certificate https://github.com/neovim/neovim/archive/v${NVIM_VERSION}.tar.gz && \
    tar xvf v${NVIM_VERSION}.tar.gz

WORKDIR /work/neovim-${NVIM_VERSION}

# RUN make -j 4
# RUN make install

RUN pip install neovim && \
    pip3 install neovim

WORKDIR /src
