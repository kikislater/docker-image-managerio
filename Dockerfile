FROM mono:latest

ARG VERSION="19.5.5"
ARG MIRROR="https://d2ap5zrlkavzl7.cloudfront.net"
ARG MANAGER_UID="1073"

WORKDIR /usr/share/manager-server

RUN useradd -u ${MANAGER_UID} manager && \ 
    mkdir /data &&\ 
    chown manager.manager /usr/share/manager-server /data

USER manager

RUN curl ${MIRROR}/${VERSION}/ManagerServer.tar.gz | tar xvz \
    && echo $VERSION > version.txt

CMD ["mono", "ManagerServer.exe","-port","8080","-path","/data"]

VOLUME /data
EXPOSE 8080

