FROM ubuntu:16.04
MAINTAINER Marc Tanis <marc@blendimc.com>

# Install AWS
RUN apt-get update && apt-get install -y awscli jq curl
# Install Docker Client
RUN set -x && \
            VER="17.03.0-ce" && \
            curl -L -o /tmp/docker-$VER.tgz https://get.docker.com/builds/Linux/x86_64/docker-$VER.tgz && \
            tar -xz -C /tmp -f /tmp/docker-$VER.tgz && \
            mv /tmp/docker/* /usr/bin

VOLUME /app

EXPOSE 80

WORKDIR /app

CMD ["bash"] 
