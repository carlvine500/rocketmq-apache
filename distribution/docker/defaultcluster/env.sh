export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1| grep 'java.home' | cut -c17- )
#export BROKER_IP=`/sbin/ifconfig eth0 | grep 'inet' | awk '{print $2}' | tr -d 'A-z:'`
if [ "$NETWORK_INTERFACE" = "" ];then
    NETWORK_INTERFACE=eth0
fi
export BROKER_IP=`/sbin/ifconfig $NETWORK_INTERFACE | grep 'inet' | egrep  -o '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -n 1`
#export DEFAULT_ROCKETMQ_HOME=$(cd $(dirname $0)/; pwd)/../../../
export ROCKETMQ_HOME=${ROCKETMQ_HOME:=$DEFAULT_ROCKETMQ_HOME}
export NAMESRV_ADDR=${NAMESRV_ADDR:='nameserver2-0.nameserver.default.svc.cluster.local:9878;nameserver3-0.nameserver.default.svc.cluster.local:9878'}

echo "JAVA_HOME="$JAVA_HOME
echo "BROKER_IP="$BROKER_IP
echo "ROCKETMQ_HOME="$ROCKETMQ_HOME
echo "NAMESRV_ADDR="$NAMESRV_ADDR

sudo chown -R admin /app/store-*
sudo chown -R admin /root/logs/rocketmqlogs

sed -i '/brokerIP1/d' *.properties
sed -i '/brokerIP2/d' *.properties
sed -i "1a brokerIP1=$BROKER_IP" *.properties
sed -i "1a brokerIP2=$BROKER_IP" *.properties

unset JAVA_TOOL_OPTIONS