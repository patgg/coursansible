FROM debian:bookworm-slim

# Informer sur le créateur de l'image :
MAINTAINER qui testeur@starinux.org

# Définir les variables d'environnements :
ENV DEBIAN_FRONTEND noninteractive

# installer prérequis
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install openssh-client wget sudo apt-transport-https lsb-release curl cron iproute2 net-tools lynx ansible -y
RUN mkdir -p /var/run/sshd

# utilisateur starinux
RUN adduser starinux && \
    echo "starinux\nstarinux" | passwd starinux

# menage
RUN apt-get clean

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
# docker build -t starinuxansible-image .
# docker run -d --name starinuxansible -p 22005:22 -v /data/containers/starinux/data:/home/starinux/data --network=starinux starinuxansible-image
# docker start starinuxansible
# docker exec -ti starinuxansible bash

