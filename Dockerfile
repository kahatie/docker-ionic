FROM kahatie/debian:wheezy
MAINTAINER kahatie <kahatie@gmail.com>

VOLUME ["/home/mediatomb/.mediatomb"]

# Mise a jour / installation des packet
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y\
 mediatomb-daemon\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*

# ADD config.xml /etc/mediatomb/config.xml
# ADD config.xml /var/lib/mediatomb/config.xml

# RUN mkdir /.mediatomb
RUN chown -R mediatomb:mediatomb /home/mediatomb

USER mediatomb

# Map port
EXPOSE 50500
EXPOSE 1900
EXPOSE 41570

ENTRYPOINT /usr/bin/mediatomb -m /home/mediatomb/ -p 50500
