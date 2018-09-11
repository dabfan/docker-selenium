FROM mhart/alpine-node:8
# FROM subhojit777/nightwatch:latest

LABEL maintainer="faneldabija2008@gmail.com"

RUN apk --no-cache add \
    # Install tini, a tiny but valid init for containers:
    tini \
    # Install ffmpeg for video recording:
    ffmpeg \
    curl \
  && npm install -g \
    # Install Nightwatch.js:
    nightwatch \
    pm2 \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

# Add node system user/group with uid/gid 1000.
# This is a workaround for boot2docker issue #581, see
# https://github.com/boot2docker/boot2docker/issues/581
RUN adduser -D -u 1000 node

USER node

WORKDIR /home/node

COPY wait-for.sh /usr/local/bin/wait-for
COPY entrypoint.sh /usr/local/bin/entrypoint

EXPOSE 3000

ENTRYPOINT ["entrypoint"]