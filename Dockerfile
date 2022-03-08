FROM ubuntu:18.04

WORKDIR /home
RUN apt-get update 
RUN apt install flex bison -y
RUN apt install libglib2.0-dev -y
RUN apt install libgmp-dev -y
RUN apt install libssl-dev git wget -y


RUN wget https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz
RUN tar zxvf pbc-0.5.14.tar.gz
WORKDIR /home/pbc-0.5.14
RUN ./configure --prefix=/usr/local --with-pic
RUN make
RUN make install
WORKDIR /home

RUN wget http://acsc.cs.utexas.edu/cpabe/libbswabe-0.9.tar.gz
RUN tar zxvf libbswabe-0.9.tar.gz
WORKDIR /home/libbswabe-0.9
RUN ./configure --prefix=/usr/local
RUN make CC="gcc -fPIC"
RUN make install
WORKDIR /home

RUN git clone https://github.com/beebit-sec/beebit-mqttc-sdk.git
WORKDIR /home/beebit-mqttc-sdk/paho.mqtt.c
RUN make clean
# RUN make uninstall
# RUN make
# RUN make install

