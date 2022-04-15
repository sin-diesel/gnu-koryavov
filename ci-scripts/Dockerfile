
FROM ubuntu:18.04
COPY gnu-koryavov /home/gnu-koryavov

RUN apt update
RUN apt -y install sudo

RUN ["chmod", "+x", "/home/gnu-koryavov/ci-scripts/tests/test_install.sh"]
RUN ["chmod", "+x", "/home/gnu-koryavov/ci-scripts/tests/test_ubuntu_run.sh"]


