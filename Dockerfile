# this is a comment
FROM ubuntu:14.04
MAINTAINER Jeffrey S. Haemer "jeffrey.haemer+docker@gmail.com"
RUN apt-get -yqq update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
EXPOSE 22

# create a user to ssh in as
ENV NEW_USER jeffrey_haemer_gmail_com
RUN adduser --disabled-password --gecos 'Jeffrey S. Haemer' $NEW_USER
RUN echo "$NEW_USER:foo" | chpasswd
ADD ssh /home/$NEW_USER/.ssh/
RUN chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh
RUN /usr/sbin/sshd -D &

# default command to run if there's nothing on the command line.
CMD [ "/bin/bash" ]
