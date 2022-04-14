
FROM ubuntu:18.04
COPY gnu-koryavov /home/gnu-koryavov

RUN ["chmod", "+x", "/home/gnu-koryavov/ci-scripts/entrypoint.sh"]
ENTRYPOINT ["/home/gnu-koryavov/ci-scripts/entrypoint.sh"]
