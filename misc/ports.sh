#!/bin/bash

#####################################################################
# Script testant l'ouverture des flux ICMP, TCP et UDP.
# Date : 29/08/2016
#####################################################################

IP_TEST=12.34.56.78
IP_ROBOT=101.102.103.104

echo " #-----------------------------------------# "
echo " # Test d'ouverture des flux vers Robotest   "
echo " # $IP_TEST -> $IP_ROBOT                     "
echo " #-----------------------------------------# "

#-------------------------------------------------------------------#
# Interaction
#-------------------------------------------------------------------#

#read -p "Adresse IP de la machine Test : " IP_TEST
#    set $IP_TEST
#
#read -p "Adresse IP de la machine Robot : " IP_ROBOT
#    set $IP_ROBOT

#-------------------------------------------------------------------#
# LOG
#-------------------------------------------------------------------#
LOG=$IP_ROBOT.log
LOG_TMP=temp_$IP_ROBOT.log
> $LOG_TMP
echo >> $LOG
echo "#-----------------------------------------------#"  >> $LOG
echo "| Test d'ouverture des flux vers Robot"             >> $LOG
echo "| $(date)"                                          >> $LOG
echo "| $IP_TEST vers $IP_ROBOT"                          >> $LOG
echo "#-----------------------------------------------#"  >> $LOG

#-------------------------------------------------------------------#
# Ports / Variables / Fonction
#-------------------------------------------------------------------#

ICMP=ICMP
SNMP=SNMP
TCP_SSH=22
TCP_HTTP=80
TCP_GEARMAN=4730
TCP_MK=6556
UDP_SNMP=161

trace() {
  echo $1 : $2 >> $LOG_TMP
  echo $1 : $2
}

#-------------------------------------------------------------------#
# ICMP
#-------------------------------------------------------------------#
for PING in $ICMP
  do
      ssh root@$IP_TEST "ping -c 3 $IP_ROBOT " > /dev/null
    if [ $? -eq 0 ]; then
      etat="UP"
    else
      etat="DOWN"
    fi
      trace "ICMP" $etat
  done

#-------------------------------------------------------------------#
# Hostname
#-------------------------------------------------------------------#

for SNMP in $SNMP
  do
      HOSTNAME=`ssh root@$IP_TEST "snmpget -v 2c -c community -OevQ $IP_ROBOT sysName.0"`
    if [ -n $HOSTNAME ]; then
      etat="UP"
    else
      etat="DOWN"
    fi
      trace "Hostname : $HOSTNAME"
  done

#-------------------------------------------------------------------#
# TCP
#-------------------------------------------------------------------#

for PORT_TCP in $TCP_SSH $TCP_HTTP $TCP_GEARMAN $TCP_MK
  do
      ssh root@$IP_TEST "nc -w 1 -z $IP_ROBOT $PORT_TCP" > /dev/null
    if [ $? -eq 0 ]; then
      echo "Port $PORT_TCP UP" >> $LOG_TMP
      echo "Port $PORT_TCP UP"
    else
      echo "Port $PORT_TCP DOWN" >> $LOG_TMP
      echo "Port $PORT_TCP DOWN"
    fi
  done

#-------------------------------------------------------------------#
# UDP
#-------------------------------------------------------------------#

for PORT_UDP in $UDP_SNMP
  do
      ssh root@$IP_TEST "nc -w 1 -z $IP_ROBOT -u $PORT_UDP" > /dev/null
    if [ $? -eq 0 ]; then
      echo "Port $PORT_UDP UP" >> $LOG_TMP
      echo "Port $PORT_UDP UP"
    else
      echo "Port $PORT_UDP DOWN" >> $LOG_TMP
      echo "Port $PORT_UDP DOWN"
    fi
  done

echo ""

#-------------------------------------------------------------------#
# LOG 2
#-------------------------------------------------------------------#

cat $LOG_TMP >> $LOG
rm -f $LOG_TMP
echo ">>> Resultats des tests dans $LOG <<<"
echo ""

#-------------------------------------------------------------------#
# EOF
#-------------------------------------------------------------------#