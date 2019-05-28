FROM node:latest

LABEL maintainer="David Postle" \
      description="MagicMirror personal image based on bastilimbach/docker-magicmirror" \
      version="1.0"

ENV NODE_ENV production

WORKDIR /opt/magic_mirror

COPY docker-entrypoint.sh /opt

RUN git clone --depth 1 -b master https://github.com/MichMich/MagicMirror.git . && \
    cp -R modules /opt/default_modules && \
    cp -R config /opt/default_config && \
    npm install --unsafe-perm --silent && \
    apt-get update && \
    apt-get -qy install dos2unix && \
    dos2unix /opt/docker-entrypoint.sh && \
    chmod +x /opt/docker-entrypoint.sh && \
    git clone --depth 1 -b master https://github.com/DMailMan/MMM-MQTTfloorplan.git /opt/magic_mirror/modules/MMM-MQTTfloorplan 

#    cp /opt/magic_mirror/modules/MMM-MQTTfloorplan/config.js.sample.js /opt/magic_mirror/config/config.js
COPY config/config.js /opt/magic_mirror/config
    
WORKDIR /opt/magic_mirror/modules/MMM-MQTTfloorplan
RUN npm install

WORKDIR /opt/magic_mirror

EXPOSE 8080
CMD ["node serveronly"]
ENTRYPOINT ["/opt/docker-entrypoint.sh"]
