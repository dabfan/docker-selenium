FROM subhojit777/nightwatch:latest

LABEL maintainer="faneldabija2008@gmail.com"

USER root

RUN npm install pm2 -g

USER node

COPY entrypoint.sh /usr/local/bin/entrypoint