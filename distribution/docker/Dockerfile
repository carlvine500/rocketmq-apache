FROM registry.bizsaas.net/java:openjdk8-alpine-bash-cn


#MAINTAINER cal

WORKDIR /root
ADD ./*.tar.gz /root

#RUN cp -r /root/alibaba-rocketmq/conf/online/defaultcluster /defaultcluster
COPY defaultcluster /defaultcluster

ENV ROCKETMQ_HOME /root/rocketmq-5.3.0
ENV NAMESRV_ADDR nameserver2-0.nameserver.default.svc.cluster.local:9878;nameserver3-0.nameserver.default.svc.cluster.local:9878
RUN sudo chown -R admin /defaultcluster $ROCKETMQ_HOME
COPY Dockerfile /Dockerfile
CMD sudo chown -R admin /app /root/logs/rocketmqlogs && /defaultcluster/start-ns.sh
