#!/bin/bash

#-------------------------------------------------------------------#
#
# Script testant l'ouverture des flux ICMP, TCP et UDP.
#
# Nécessite :
#   - Connexion SSH par clefs pour l'utilisateur "root"
#   - SnmpGet installe sur la machine de Test (paquet net-snmp-utils)
#   - Netcat installe sur la machine de Test
#
# Date : 30/08/2016
#
#-------------------------------------------------------------------#

#-------------------------------------------------------------------#
# Variables

IP_TEST=12.34.56.78
IP_ROBOT=101.102.103.104
PROTO="ICMP HOSTNAME SSH HTTP SNMP GEARMAN CHECK_MK"
LOG=$IP_ROBOT.log
LOG_TMP=temp_$IP_ROBOT.log

#-------------------------------------------------------------------#
# Log

> temp_$IP_ROBOT.log
echo >> $LOG
echo "#-----------------------------------------------#" >> $LOG
echo "| Test d'ouverture des flux vers Robot"            >> $LOG
echo "| $(date)"                                         >> $LOG
echo "| $IP_TEST vers $IP_ROBOT"                         >> $LOG
echo "#-----------------------------------------------#" >> $LOG

#-------------------------------------------------------------------#
# Fonction

trace () {
  echo "$1 : $2" >> $LOG_TMP
  echo "$1 : $2"
}

#-------------------------------------------------------------------#
# Test de ports

for i in $PROTO
  do
    case $i in
      "ICMP")
        ssh root@$IP_TEST "ping -c 2 $IP_ROBOT" > /dev/null
        result=$?;;
      "HOSTNAME")
        HOSTNAME=`ssh root@$IP_TEST "snmpget -v 2c -c bornan -OevQ $IP_ROBOT sysName.0"`
        trace $i $HOSTNAME;;
      "SSH")
        ssh root@$IP_TEST "nc -w 1 -z $IP_ROBOT 22" > /dev/null
        result=$?;;
      "HTTP")
        ssh root@$IP_TEST "nc -w 1 -z $IP_ROBOT 80" > /dev/null
        result=$?;;
      "SNMP")
        ssh root@$IP_TEST "nc -w 1 -z $IP_ROBOT -u 161" > /dev/null
        result=$?;;
      "GEARMAN")
        ssh root@$IP_TEST "nc -w 1 -z $IP_ROBOT 4730" > /dev/null
        result=$?;;
      "CHECK_MK")
        ssh root@$IP_TEST "nc -w 1 -z $IP_ROBOT 6556" > /dev/null
        result=$?;;
      *)
        result="3"
    esac

    if [ $result -eq 0 ]; then
      trace $i "UP"
    else
      trace $i "DOWN"
    fi
done

#-------------------------------------------------------------------#
# Log finalisation

cat $LOG_TMP >> $LOG
rm -f $LOG_TMP

# EOF
