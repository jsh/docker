# this is a comment
FROM ubuntu:14.04
MAINTAINER Jeffrey S. Haemer "jeffrey.haemer+docker@gmail.com"
RUN apt-get -yqq update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
EXPOSE 22

ENV NEW_USER jeffrey_haemer_gmail_com
RUN adduser --disabled-password --gecos 'Jeffrey S. Haemer' $NEW_USER
RUN echo "$NEW_USER:$NEW_USER" | chpasswd
