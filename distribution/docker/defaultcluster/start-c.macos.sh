#!/bin/sh
cd $(cd $(dirname $0)/; pwd)
. ./env.sh

export BROKER_IP=`/sbin/ifconfig en0 | grep 'inet' | awk '{print $2}' | tr -d 'A-z:'`
export NAMESRV_ADDR=127.0.0.1:9878
echo "BROKER_IP(macos)="$BROKER_IP
echo "NAMESRV_ADDR(macos)="$NAMESRV_ADDR

sed -i '/brokerIP1/d' broker-a.macos.properties
sed -i '/brokerIP2/d' broker-a.macos.properties
echo "brokerIP1=$BROKER_IP" >> broker-a.macos.properties
echo "brokerIP2=$BROKER_IP" >> broker-a.macos.properties

sh $ROCKETMQ_HOME/bin/mqbroker  -c broker-c.macos.properties


