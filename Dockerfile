FROM baymose/docker-webpack
MAINTAINER Bailey Griswold <bailey@rehabpath.com>

# Install AWS
RUN apt-get update && \
    apt-get install -y python3-pip jq curl wget vim php && \
    pip3 install awscli
# Install Composer
RUN wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb \
  && dpkg -i /tmp/libpng12.deb \
  && rm /tmp/libpng12.deb
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
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
