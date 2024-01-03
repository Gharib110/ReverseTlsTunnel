FROM ubuntu:20.04
LABEL maintainer="Alireza Gharib <alirezagharib110@gmail.com>"

WORKDIR /root
RUN cd /root
RUN apt-get update
RUN apt upgrade -y
RUN apt install wget iptables unzip wget tzdata -y
RUN wget https://github.com/radkesvat/ReverseTlsTunnel/releases/download/V$VERSION/v$VERSION_linux_amd64.zip
RUN unzip v$VERSION_linux_amd64.zip
RUN chmod +x ./RTT

ENV SNI=example.ir
ENV PASS=123
ENV VERSION=7.1
ENV PORT=443
ENV TZ=Asia/Tehran
CMD /root/RTT --iran --lport:$PORT --sni:$SNI --password:$PASS --terminate:4
