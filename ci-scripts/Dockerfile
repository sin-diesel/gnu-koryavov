
FROM ubuntu:18.04
COPY gnu-koryavov /home/gnu-koryavov

RUN apt update
RUN apt -y install wget
RUN apt -y install sudo
RUN apt -y install curl
RUN apt -y install atril

RUN ["chmod", "+x", "/home/gnu-koryavov/ci-scripts/tests/test_install.sh"]
RUN ["chmod", "+x", "/home/gnu-koryavov/ci-scripts/tests/test_ubuntu_run.sh"]


