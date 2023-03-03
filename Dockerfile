FROM ubuntu:latest

COPY ./docker-entrypoint.sh /usr/sbin/

RUN apt update

RUN apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN usermod -aG sudo test

RUN chmod +x /usr/sbin/docker-entrypoint.sh

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN echo "export VISIBLE=now" >> /etc/profile

RUN service ssh start

RUN  echo 'test:test' | chpasswd

RUN  echo 'root:root' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/docker-entrypoint.sh"]
