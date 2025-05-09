FROM debian:bookworm-slim

# Informer sur le créateur de l'image :
MAINTAINER qui testeur@starinux.org

# Définir les variables d'environnements :
ENV DEBIAN_FRONTEND noninteractive

# installer prérequis
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install openssh-server wget sudo apt-transport-https lsb-release curl cron postfix mailutils iproute2 net-tools lynx -y
RUN mkdir -p /var/run/sshd

# utilisateur starinux
RUN adduser starinux && \
    echo "starinux\nstarinux" | passwd starinux

# menage
RUN apt-get clean

# scripts
COPY main.cf /etc/postfix/
COPY mailname /etc/mailname
RUN /etc/init.d/postfix start

# Add the cron job
RUN crontab -l -u starinux | { cat; echo "* * * * * echo test|mail -s test -r starinux@localhost starinux@localhost"; } | crontab -u starinux -

# entrypoint
COPY start.sh /usr/sbin/starinux.sh
RUN chmod +x /usr/sbin/starinux.sh

# ports
EXPOSE 22

# demarrage des services
ENTRYPOINT ["/bin/bash", "/usr/sbin/starinux.sh"]
#CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]

#faire :
# docker network create starinux -d host --subnet=10.10.10.0/24 br0
# docker build -t starinuxsshd-image .
# docker run -d --name starinuxsshd -p 22004:22 -v /data/containers/starinux/data:/home/starinux/data --network=starinux starinuxsshd-image
# docker start starinuxsshd
# docker exec -ti starinuxsshd bash

