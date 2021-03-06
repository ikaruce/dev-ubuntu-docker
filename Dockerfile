FROM ubuntu:20.04

RUN apt-get update && apt-get install -y openssh-server openjdk-14-jdk
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

RUN mkdir /root/.ssh
RUN mkdir /root/workspace

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]




