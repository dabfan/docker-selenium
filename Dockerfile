# FROM loyaltyone/docker-alpine-java-node
FROM selenium/standalone-chrome

LABEL maintainer="faneldabija2008@gmail.com"

RUN apt-get install ssh git
# RUN apk --no-cache add curl openssh-client git bash