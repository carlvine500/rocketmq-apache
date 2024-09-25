#!/bin/sh
cd $(cd $(dirname $0)/; pwd)
. ./env.sh
sh $ROCKETMQ_HOME/bin/mqbroker  -c broker-c.properties


