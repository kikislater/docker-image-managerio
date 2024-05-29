FROM mono:latest

ARG VERSION=24.5.29.1592 
ARG MIRROR=https://github.com/Manager-io/Manager/releases/download
ARG MANAGER_UID=1073

WORKDIR /usr/share/manager-server

RUN useradd -u $MANAGER_UID manager && \ 
    mkdir /data && \
    mkdir -p /home/manager/.local/share && \ 
    chown manager:manager \
            /usr/share/manager-server \
            /data \
            /home/manager/.local/share

USER manager

RUN curl -L $MIRROR/$VERSION/ManagerServer-linux-x64.tar.gz -o ManagerServer.tar.gz
RUN tar -xvzf ManagerServer.tar.gz
RUN rm -rf ManagerServer.tar.gz
RUN echo $VERSION > version.txt

CMD ["/usr/share/manager-server/ManagerServer","-port","8080","-path","/data"]

VOLUME /data
EXPOSE 8080

