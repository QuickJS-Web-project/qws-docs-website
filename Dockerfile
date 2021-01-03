FROM gcc:latest
FROM node:latest AS node_base

RUN apt-get update

RUN echo "NODE Version:" && node --version
RUN echo "NPM Version:" && npm --version

ADD ./src /app/src

WORKDIR /app/src/node_modules/quickwebserver
RUN ./build-shared.sh

WORKDIR /app/src/node_modules/quickwebserver/c
RUN make install

WORKDIR /app/src
