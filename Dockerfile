# FROM loyaltyone/docker-alpine-java-node
# FROM selenium/standalone-chrome
FROM selenium/node-chrome

LABEL maintainer="faneldabija2008@gmail.com"

USER root

ENV NVM_DIR="/root/.nvm"
# ENV CHROME_DEB="google-chrome-stable_65.0.3325.181-1_amd64.deb"
# ENV CHROME_URL="https://s3.amazonaws.com/gitlab-google-chrome-stable/${CHROME_DEB}"

RUN mkdir $NVM_DIR | true
RUN apt-get -y update
RUN apt-get -y install ssh git libnss3 libgconf-2-4 curl bash
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get -y install nodejs
# RUN apt-get -y install npm
# RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# RUN . /root/.profile
# RUN nvm install 8.9.3

# RUN curl --silent --show-error --fail -O $CHROME_URL
# RUN dpkg -i ./$CHROME_DEB || true
# RUN apt-get install -f -y
# RUN rm -f $CHROME_DEB

RUN nodejs -v
RUN npm -v

USER seluser
# RUN apk --no-cache add curl openssh-client git bash