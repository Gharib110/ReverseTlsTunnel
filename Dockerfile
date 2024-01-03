FROM ubuntu:20.04
LABEL maintainer="Alireza Gharib <alirezagharib110@gmail.com>"

WORKDIR /root
RUN cd /root
RUN apt-get update
RUN apt upgrade -y
RUN apt install wget iptables unzip wget tzdata -y
RUN wget https://github.com/radkesvat/ReverseTlsTunnel/releases/download/V7.1/v7.1_linux_amd64.zip
RUN unzip v7.1_linux_amd64.zip
RUN chmod +x ./RTT

ENV SNI=example.ir
ENV PASS=123
ENV TZ=Asia/Tehran
CMD /root/RTT --iran --lport:80 --sni:$SNI --password:$PASS --terminate:4
