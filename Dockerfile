# Comment any lines that download/install unnecessary tools
# Information about the tools or instructions to build and run this image at: https://github.com/lucasroges/container-tools

# OS: debian 9
FROM debian:9

# Create and access user directory
RUN mkdir /home/user && cd /home/user

# Install some needed packages (compilers, mpi, git, wget)
RUN apt-get update && apt-get install -y build-essential gfortran mpi-default-dev git wget

# Install linux-perf
RUN apt-get install -y linux-perf

# Download Likwid
RUN git clone https://github.com/RRZE-HPC/likwid

# Install Likwid
RUN cd likwid && make && make install && cd .. && rm -rf likwid

# Download PCM
RUN git clone https://github.com/opcm/pcm

# Install PCM
RUN cd pcm && make && cd ..

# Download Score-P and Scalasca
RUN wget https://www.vi-hps.org/cms/upload/packages/scorep/scorep-5.0.tar.gz && wget http://apps.fz-juelich.de/scalasca/releases/scalasca/2.5/dist/scalasca-2.5.tar.gz

# Install Score-P and Scalasca
RUN tar -zxvf scorep-5.0.tar.gz && rm scorep-5.0.tar.gz && cd scorep-5.0/ && mkdir _build && cd _build && ../configure --with-mpi=openmpi && make && make install && cd ../../ && rm -rf scorep-5.0/ && tar -zxvf scalasca-2.5.tar.gz && rm scalasca-2.5.tar.gz && cd scalasca-2.5/ && ./configure --with-mpi=openmpi && make && make install && cd .. && rm -rf scalasca-2.5/

# Remove unused packages
RUN apt autoremove -y

# Initial command
CMD "/bin/bash"