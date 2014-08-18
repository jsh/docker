# set up initial container
FROM ubuntu:14.04
MAINTAINER Jeffrey S. Haemer "jeffrey.haemer+docker@gmail.com"

ENV packages openssh-server git-annex
RUN apt-get -yqq update; \
    apt-get -yqq install $packages;

# create a user so I can ssh in
#ENV NEW_USER jhaemer
ADD etc/sudoers.d/ /etc/sudoers.d
ENV NEW_USER jeffrey_haemer_gmail_com
RUN mkdir /var/run/sshd; \
    groupadd -g 1001 $NEW_USER; \
    useradd -m -c 'Jeff Haemer' -s '/bin/bash' $NEW_USER -u 1001 -g 1001

# default command to run if there's nothing on the command line.

EXPOSE 22
CMD [ "/usr/sbin/sshd", "-D" ]
