FROM mono:latest

ARG VERSION="22.8.30.345"
ARG MIRROR="https://github.com/Manager-io/Manager/releases/download"
ARG MANAGER_UID="1073"

WORKDIR /usr/share/manager-server

RUN useradd -u ${MANAGER_UID} manager && \ 
    mkdir /data &&\ 
    chown manager.manager /usr/share/manager-server /data

USER manager

RUN curl ${MIRROR}/${VERSION}/ManagerServer-linux-x64.tar.gz | tar xvz \
    && echo $VERSION > version.txt

CMD ["mono", "ManagerServer.exe","-port","8080","-path","/data"]

VOLUME /data
EXPOSE 8080

