
# Container-tools

A Docker image built with monitoring and profiling tools for performance measurement in a containerized environment.

These tools are listed [below](#installed-tools) and the main purpose is to measure, monitor and/or profile data on MPI and OpenMP programs.

This environment was successfully tested with some applications of the [NAS Parallel Benchmarks](https://nas.nasa.gov/publications/npb.html) set.

## Pull image

The image is available through command line:

`docker pull lraraujo/container-tools:1.0`

The [Dockerfile](Dockerfile) might also be downloaded and edited to remove any unnecessary tools or to previously download some desired applications.

## Before running the container

Before run the container, the users that will utilize tools as Likwid or PCM need to execute `sudo modprobe msr`. For further information check [Setting up access for hardware performance monitoring](https://github.com/RRZE-HPC/likwid/wiki/Build#setting-up-access-for-hardware-performance-monitoring).

Users that will utilize Linux perf or PCM need to check `/proc/sys/kernel/perf_event_paranoid` and set the value desired, otherwise, will get an error message trying to execute these tools.

## Running the container

The command below will initialize the container as an interactive process (shell).

`docker run -it --privileged --name <name> lraraujo/container-tools:1.0`

Thus, users are able to use command line, inside the container, to download, compile and execute applications with the tools provided.

## Installed tools

All installed tools are listed below along with its documentation.

### Monitoring and performance measurement

#### Linux Perf

[Perf Wiki](https://perf.wiki.kernel.org/index.php/Main_Page)

[Perf overview](https://alex.dzyoba.com/blog/perf/)

#### Likwid

[Likwid Wiki](https://github.com/RRZE-HPC/likwid/wiki)

#### PCM

[PCM](https://github.com/opcm/pcm)

### Profiling

#### Score-P

[Documentation](http://scorepci.pages.jsc.fz-juelich.de/scorep-pipelines/docs/scorep-5.0/pdf/scorep.pdf)

#### Scalasca

[Documentation](http://scalasca.org/software/scalasca-2.x/documentation.html)

## Tools for profiling visualization

### Cube (Score-P and Scalasca)

A recommended tool to visualize the files provided by Score-P and Scalasca is [Cube](http://scalasca.org/software/cube-4.x/download.html).

[Cube documentation](http://scalasca.org/software/cube-4.x/documentation.html)