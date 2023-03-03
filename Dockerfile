FROM ubuntu:latest

COPY ./docker-entrypoint.sh /usr/sbin/

RUN apt update

RUN apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN usermod -aG sudo test

RUN chmod +x /usr/sbin/docker-entrypoint.sh

RUN service ssh start

RUN  echo 'test:test' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/docker-entrypoint.sh"]
