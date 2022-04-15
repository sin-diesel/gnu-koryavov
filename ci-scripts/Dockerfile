
FROM ubuntu:18.04
COPY gnu-koryavov /home/gnu-koryavov

RUN apt-get update
RUN apt-get -y install sudo

RUN ["chmod", "+x", "/home/gnu-koryavov/ci-scripts/tests/test_install.sh"]
RUN ["chmod", "+x", "/home/gnu-koryavov/ci-scripts/tests/test_ubuntu_run.sh"]


