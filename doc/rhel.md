# Red Hat Enterprise Linux

* [Dépôts](#d%C3%A9p%C3%B4ts)
* [Dépôts RedHat](#d%C3%A9p%C3%B4ts-red-hat)
* [Stockage](#stockage)
* [Paquets](#paquets)
* [Démons](#d%C3%A9mons)
  * [system-v](#system-v)
  * [systemd](#systemd)
* [NTP](#ntp)

## Dépôts

Liste des dépôts.

```shell
# yum repolist
```

Répertoire par défaut des dépôts.

```shell
# /etc/yum.repos.d/
```

EPEL RHEL 6

```shell
# rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
```

EPEL RHEL 7

```shell
# rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
```

## Dépôts Red Hat

Les dépôts Red Hat sont soumis à un compte, il faut enregistrer la machine.

```shell
# subscription-manager register --username <USER> --password <PASSWORD> --auto-attach
```

Configuration du proxy si nécessaire

```shell
# cat /etc/rhsm/rhsm.conf

proxy_hostname =
proxy_port =
proxy_user =
proxy_password =
```

```shell
# subscription-manager register
# subscription-manager refresh
# subscription-manager attach --auto
# yum repolist
```

## Stockage

| Partition     | Taille minimale   	|
|---------------|-----------------------|
| /boot         | 1 GB              	|
| /             | 10 GB             	|
| /home         | 1 GB              	|
| /var          | 3 GB              	|
| /usr          | 5 GB              	|

| RAM           | Swap                  |
|---------------|-----------------------|
| > 2 GB RAM    | RAM x 2               |
| 2 GB - 8 GB   | RAM x 1               |
| 8 GB - 64 GB  | RAM x 0,5 - 4 GB min  |
| 64 GB         | 4 GB min              |

[Préconisations RedHat](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-disk-partitioning-setup-x86.html)

## Paquets

Installation ou mise à jour d'un paquet

```shell
# rpm -Uvh <PACKAGE>.rpm
```

Désinstallation d'un paquet

```shell
# rpm -e <PACKAGE>
```

Liste des paquets

```shell
# rpm -qa
```

Version du paquet installé

```shell
# rpm -q <PACKAGE>
```

Liste tous les paquets dont le nom contient NOM

```shell
# rpm -qa '<NOM>'
```

Installation du paquet

```shell
# yum install <PACKAGE>
# dnf install <PACKAGE>
```

Mise à jour du paquet

```shell
# yum update <PACKAGE>
# dnf update <PACKAGE>
```

Désinstallation du paquet

```shell
# yum remove <PACKAGE>
# dnf remove <PACKAGE>
```

Liste des paquets disponibles

```shell
# yum list <PACKAGE>
# dnf list <PACKAGE>
```

Liste de tous les paquets installés

```shell
# yum list installed
# dnf list installed
```

Nettoyage des metadata

```shell
# yum clean metadata
# dnf clean metadata
```

Nettoyage de yum

```shell
# yum clean all
# dnf clean all
```

Information sur un paquet

```shell
# yum provides <PACKAGE>
# dnf provides <PACKAGE>
```

Nettoyage des anciens noyaux (conserve les deux dernières versions)

```shell
# yum install -y yum-utils && package-cleanup --oldkernels --count=1 -y
```

```shell
# dnf remove --oldinstallonly --setopt installonly_limit=1 kernel
```

```shell
# dnf remove --oldinstallonly --setopt installonly_limit=2 kernel
```

Vérification de la nécessite de mises à jour du système

```shell
# yum check-update
# dnf check-update
```

Mise à jour du système automatique

```shell
# yum update -y
# dnf update -y
```

Liste des mises à jour de sécurité déjà installées.

```shell
# yum updateinfo list security installed
```

Liste des mises à jour de sécurité disponibles.

```shell
# yum updateinfo list updates security
```

Installation des mises à jour de sécurité.

```shell
# yum update --security
```

Configuration de DNF :

* limiter le nombre de noyaux à 3
* sélection automatique des mirroirs sur leurs performances
* désactivation de DeltaRPM en raison de sa consommation élevée de I/O
* préconfiguration du proxy

```shell
# cat /etc/dnf/dnf.conf

installonly_limit=3
fastestmirror=true
deltarpm=0
# proxy=http://USER:PASSWORD@<IP>:<PORT>
```

### Paquets sélectionnés

Paquets recommandés.

```shell
# yum install -y bash-completion vim-enhanced tmux htop curl lsof
```

Paquets nécessaires aux pilotes virtuels.

```shell
# yum install -y kernel-devel kernel-headers make gcc binutils
```

### Téléchargement de RPM

Téléchargement en spécifiant le répertoire.

```shell
# yumdownloader <PACKAGE> --destdir <PATH>
```

Téléchargement du paquet et de ses dépendances.

```shell
# yumdownloader --resolve <PACKAGE>
```

### Avertissement de Mise à jour

Installation de Yum-Cron.

```shell
# yum install yum-cron
```

Copie du fichier de configuration.

```shell
# cp /etc/yum/yum-cron.conf /etc/yum/yum-cron.conf.orig
```

Configuration.

```shell
# cat /etc/yum/yum-cron.conf

email_from = root@<FQDN>
email_to = <EMAIL>
```

Redémarrage du démon.

```shell
# systemctl restart yum-cron.service
```

## Démons

### System V

Liste des démons.

```shell
# /sbin/chkconfig --list
```

Automatisation des démons / scripts.

```shell
# /sbin/chkconfig --add <SERVICE/SCRIPT>		/sbin/chkconfig <SERVICE/SCRIPT> on
# /sbin/chkconfig --del <SERVICE/SCRIPT>		/sbin/chkconfig <SERVICE/SCRIPT> off
```

Gestion des services / démons.

```shell
# service <SERVICE> start|stop|restart|reload|status
```

Service arrêt / démarrage.

```shell
# service <SERVICE> start
```

Service au démarrage.

```shell
# chkconfig <SERVICE> on
```

Service désactiver au démarrage.

```shell
# chkconfig <SERVICE> off
```

### SystemD

#### SystemD disponibles par défaut

```shell
/lib/systemd/system/
/usr/lib/systemd/
```

#### Liste des Unités

```shell
# systemctl list-unit-files
# systemctl list-units --all
```

#### Unités

| Unités    	| Systemd                                               |
|---------------|-------------------------------------------------------|
| `service`     | Service / Démon                                       |
| `socket`      | Socket (types UNIX, Internet, fichier...)             |
| `mount`       | Système de fichiers                                   |
| `swap`        | Partitions de swap                                    |
| `automount`   | Système de fichiers monté à la demande                |
| `device`      | Périphérique                                          |
| `timer`       | Activation basée sur une date                         |
| `path`        | Activation basée sur des fichiers ou des répertoires  |
| `target`      | Macro-unité permettant de grouper plusieurs unités    |
| `snapshot`    | Sauvegarde                                            |

#### Démons configurés et/ou personnalisés

```shell
/etc/systemd/system
```

#### Information sur un Démon

```shell
# systemctl cat <SERVICE>.service
```

#### Liste des démons actifs

```shell
# systemctl list-unit-files | grep enabled
```

#### Gestion des services

```shell
# systemctl <start|stop|reload|enable|disable|show> <SERVICE>
```

* `start` : démarrage
* `stop` : arrêt
* `enable` : activé dès le démarrage
* `disable` : désactivé dès le démarrage
* `status` : informations
* `is-enabled` : vérification de l'état
* `kill` : SIGTERM ou signal d'arrêt

Démarrage / Arrêt immédiat d'un service, et dès le démarrage.

```shell
# systemctl <enable|disable> --now <SERVICE>
```

## Hostname

```shell
# hostnamectl set-hostname <HOSTNAME>
```

## NTP

Installation.

```shell
# yum install ntp
```

Configuration.

```shell
# vi /etc/ntp.conf

server <FQDN>
```

Synchronisation.

```shell
# ntpdate <FQDN>
```

#### RHEL 6

Démarrage automatique.

```shell
# chkconfig ntpd on
```

Démarrage.

```shell
# service ntpd start
```

#### RHEL 7

Démarrage automatique.

```shell
# systemctl enable ntpd
```

Démarrage.

```shell
# systemctl start ntpd
```

Démarrage automatique.

```shell
# timedatectl set-ntp yes
```

Dans certains cas, il peut être intéressant d'envoyer l'heure NTP vers l'horloge du BIOS.

```shell
# hwclock --systohc --utc
```

#### Chrony

Chrony est le nouvel outil de synchronisation du temps.

Installation.

```shell
# yum install -y chrony
```

Démarrage.

```shell
# systemctl enable chronyd
# systemctl start chronyd
# systemctl disable ntpd.service
```

Configuration.

```shell
# vi /etc/chrony.conf
```

Usage.

```shell
# chronyc tracking
# chronyc sources -v
# chronyc sourcestats -v
```

## SELinux

Statut.

```shell
# sestatus
```

Changement jusqu'au prochain redémarrage (`0` = désactivé - `1` = activé).

```shell
# setenforce <0|1>
```

SELinux désactivation.

```shell
# vi /etc/selinux/config

# SELINUX=enforcing
SELINUX=disabled
SELINUXTYPE=targeted
```

## KDump

KDump désactivé.

```shell
# chkconfig kdump off
```

## Réseau

Interfaces réseaux : liste.

```shell
# ip link show    |   ip address show
# ip link list    |   ip addr list
```

Interfaces réseaux : activation | désactivation.

```shell
# ip link set down <NIC>  |   ip link set up <NIC>
```

IPv4 : affichage.

```shell
# ip addr show <NIC>
# ip a
# hostname -I
```

IPv4 : ajout | suppression.

```shell
# ip addr add <IP/MASK> dev <NIC>     |   ip addr del <IP/MASK> dev <NIC>
```

IPv4 : plusieurs adresses par interface.

```shell
# ip addr add <IP-1/MASK> broadcast <IP-BROADCAST> dev <NIC>
# ip addr add <IP-2/MASK> broadcast <IP-BROADCAST> dev <NIC>
# ip addr add <IP-3/MASK> broadcast <IP-BROADCAST> dev <NIC>
```

IPv6 : plusieurs adresses par interface.

```shell
# ip -6 addr add <IPv6-1/MASK> dev <NIC>
# ip -6 addr add <IPv6-2/MASK> dev <NIC>
```

IPv6 : suppression d'une adresse.

```shell
# ip -6 addr del <IPv6/MASK> dev <NIC>
```

MAC : changement d'adresse.

```shell
# ip link set dev <NIC> address <MAC>
```

## Hostname

Nom de la machine.

```shell
# vi /etc/hostname

<HOST>.<DOMAIN>.<TLD>
```

```shell
# hostnamectl set-hostname --static <HOSTNAME>
```

```shell
# vi /etc/hosts

127.0.0.1 <HOST>.<DOMAIN>.<TLD> localhost.localdomain
```

Vérification du Hostname court.

```shell
# hostname -s
```

Vérification du FQDN.

```shell
# hostname -f
```

### RHEL 6

Nom de la machine.

```shell
# vi /etc/sysconfig/network

HOSTNAME=<HOSTNAME>.<DOMAIN>
NETWORKING=yes
NETWORKING_IPV6=no
GATEWAY=<IP-GW>
```

DHCP configuration.

```shell
# vi /etc/sysconfig/network-scripts/ifcfg-<NIC>

DEVICE=eth0
BOOTPROTO=dhcp
ONBOOT=yes
```

IP statique configuration.

```shell
# vi /etc/sysconfig/network-scripts/ifcfg-<NIC>

DEVICE=eth0
TYPE=Ethernet
NM_CONTROLLED=no
USERCTL=no
BOOTPROTO=none
ONBOOT=yes
IPADDR=<IP>
NETMASK=<MASK>
GATEWAY=<IP-GW>
DNS1=<IP-DNS>
```

DNS configuration.

```shell
# vi /etc/resolv.conf

nameserver <IP-DNS>
```

NetworkManager désactivé définitivement.

```shell
# service NetworkManager stop
# chkconfig NetworkManager off
```

### RHEL 7

Configuration du nom de machine.

```shell
# hostnamectl set-hostname <HOSTNAME>
```

```shell
# vi /etc/hostname
# vi /etc/hosts
```

DHCP configuration.

```shell
# vi /etc/sysconfig/network-scripts/ifcfg-<NIC>

TYPE=Ethernet
BOOTPROTO=dhcp
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=no
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_PEERDNS=yes
IPV6_PEERROUTES=yes
IPV6_FAILURE_FATAL=no
NAME=eth0
ONBOOT=yes
HWADDR=<MAC>
PEERDNS=yes
PEERROUTES=yes
```

IP statique configuration.

```shell
# vi /etc/sysconfig/network-scripts/ifcfg-<NIC>

TYPE=Ethernet
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=no
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_PEERDNS=yes
IPV6_PEERROUTES=yes
IPV6_FAILURE_FATAL=no
NAME=eth0
ONBOOT=yes
HWADDR=<MAC>
PEERDNS=yes
PEERROUTES=yes
BOOTPROTO=none
IPADDR=<IP>
NETMASK=<MASK>
GATEWAY=<IP-GW>
DOMAIN=<DOMAIN>
DNS1=<IP-DNS>
DNS2=<IP-DNS>
```

S'il existe plusieurs cartes réseaux, une seule route par défaut peut-être utilisée.  
Désactivé la valeur DEFROUTE sur la carte réseau à ne pas router.

```shell
# vi /etc/sysconfig/network-scripts/ifcfg-<NIC>

# DEFROUTE=yes
DEFROUTE=no
# .../...
```

Affichage de la table de routage.

```shell
# ip route
# ip r
```

DNS configuration.

```shell
# vi /etc/resolv.conf

nameserver <IP-DNS>
```

## NetworkD

### Version

```shell
# systemctl --version
```

Désactivation de NetworkManager.

```shell
# systemctl disable NetworkManager
```

#### NetworkD activé

Service activé, dès le démarrage.

```shell
# systemctl enable --now systemd-networkd.service
```

### Stockage des fichiers de configuration

```shell
/etc/systemd/network/
```

### Adresse

```shell
# vi /etc/systemd/network/<NIC>.network

[Match]
Name=<NIC>
MACAddress=<MAC>
[Network]
#DHCP=yes
DHCP=no
Address=<IP>/<MASK>
Gateway=<IPGW>
Address=<IP1>/<MASK>
Gateway=<IPGW1>
DNS=<IP>
[Route]
Gateway=<IPGW>
Destination=<IP>/<MASK>
```

### DNS

```shell
# vi /etc/systemd/resolved.conf

DNS=
FallbackDNS=
Domains=
LLMNR=
DNSSEC=
```

```shell
# rm /etc/resolv.conf
# ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
```

### Matériel optionnel

```shell
# vi /etc/systemd/network/<NIC>.link

[Match]
MACAddress=<MAC>
Driver=<PILOTE>
[Link]
Name=<NIC>
MTUBytes=<MTU>
BitsPerSecond=<1G>
MACAddress=<MAC>
# Duplex=full
# WakeOnLan=magic
```

### Services

NetworkManager désactivé.

```shell
# systemctl disable NetworkManager
```

NetworkD activé.

```shell
# systemctl enable systemd-networkd.service
# systemctl start systemd-networkd.service
# systemctl enable systemd-resolved
# systemctl start systemd-resolved
```

### Interfaces virtuelles

NetworkD est capable de gérer les cartes réseaux virtuelles (ponts, vLAN, tunnel, bonding).

### Bridge

```shell
# vi /etc/systemd/network/bridge-<BRIDGE>.netdev

[NetDev]
Name=<BRIDGE>
Kind=bridge
```

```shell
# vi /etc/systemd/network/bridge-<BRIDGE>-slave.network

[Match]
Name=<NIC>
[Network]
Bridge=<BRIDGE>
```

```shell
# vi /etc/systemd/network/bridge-<BRIDGE>.network

[Match]
Name=<BRIDGE>
[Network]
Address=<IP>/<MASK>
Gateway=<IPGW>
DNS=<IP>
```

### vNIC

Création d'une carte réseau virtuelle et de son adressage spécifique.

```shell
# cp -v /etc/sysconfig/network-scripts/ifcfg-<NIC> /etc/sysconfig/network-scripts/ifcfg-<NIC>:1
```

```shell
# vi /etc/sysconfig/network-scripts/ifcfg-<NIC>:1

TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=static
IPADDR=<IP>
NETMASK=<MASK>
GATEWAY=<IP-GW>
DOMAIN=<DOMAIN>
DNS1=<IP-DNS>
DNS2=<IP-DNS>
```

Gestion du réseau.

```shell
# systemctl status|start|restart|stop network.service
```

### Proxy

Proxy pour YUM / DNF.

```shell
# vi /etc/yum.conf    |       vi /etc/dnf/dnf.conf

proxy=http://<IP>:<PORT>
proxy_username=<USER>
proxy_password=<PASSWORD>
```

Proxy pour l'utilisateur.

```shell
vi ~/.bashrc

export http_proxy='http://<USER>:<PASSWORD>@<IP>:<PORT>'
export https_proxy='http://<USER>:<PASSWORD>@<IP>:<PORT>'
export no_proxy='localhost,127.0.0.1'
```

### NetworkManager Text User Interface

Installation.

```shell
# yum install NetworkManager-tui
```

Configuration.

```shell
# nmtui edit <NIC-NAME>
# nmtui connect <NIC-NAME>
```

### NetworkManager CLI

Status.

```shell
# nmcli general status
# nmcli device
```

Liste des interfaces réseaux.

```shell
# nmcli connection
```

Affichage de la configuration d'une interface.

```shell
# nmcli connection show <NOM-CONNEXION>
```

Liste des interfaces actives.

```shell
# nmcli device status
```

Activation d'une interface.

```shell
# nmcli device connect <NIC>
```

Désactivation d'une interface.

```shell
# nmcli device disconnect <NIC>
```

Configuration IPv4 d'une interface, puis démarrage.

```shell
# nmcli connection add type ethernet con-name <NOM-CONNEXION> ifname <NIC> ip4 <IP> gw4 <IP-GW>
# nmcli connection up <NOM-CONNEXION> ifname <NIC>
```

Configuration DHCP d'une interface.

```shell
# nmcli connection add type ethernet con-name <NOM-CONNEXION> ifname <NIC>
```

#### Teaming - Agrégation de liens

NetworkManager status.

```shell
# nmcli device
```

Création d'une interface de Teaming, puis vérification.

```shell
# nmcli con add type team con-name <NOM-CONNEXION-TEAM> ifname <NIC> config  '{"runner":{"name":"<PROTOCOLE>"}}'
```
`<PROTOCOLE>` peut prendre l'une des valeurs suivantes : `broadcast|activebackup|roundrobin|loadbalance|lacp`.

Vérification.

```shell
# nmcli device
```

Association des interfaces physiques à l'interface de Teaming.

```shell
# nmcli con add type team-slave con-name <NOM-CONNEXION>-<NICX> ifname <NIC> master <NOM-CONNEXION-TEAM> ; nmcli con add type team-slave con-name <NOM-CONNEXION>-<NICY> ifname <NIC> master <NOM-CONNEXION-TEAM>
```

Configuration IPv4 de l'interface de Teaming, puis démarrage.

```shell
# nmcli con mod <NOM-CONNEXION-TEAM> ipv4.addresses "<IP>/<CIDR> <IP-GW>"
# nmcli con mod <NOM-CONNEXION-TEAM> ipv4.method manual
# nmcli con up <NOM-CONNEXION-TEAM>
# nmcli device ; ifconfig
```

Vérification.

```shell
# teamdctl <NOM-CONNEXION-TEAM> state
# teamnl <NOM-CONNEXION-TEAM> ports
```

### Firewall

#### RHEL 6

Configuration du firewall par assistant.

```shell
# system-config-firewall-tui
```

#### RHEL7 - FirewallD

Etat.

```shell
# firewall-cmd --state  |   firewall-cmd --list-all
```

Zone : liste.

```shell
# firewall-cmd --get-zones
```

Zone par défaut.

```shell
# firewall-cmd --get-default-zone
```

Zone en cours d'utilisation.

```shell
# firewall-cmd --get-active-zones
```

Liste des zones et aperçu de leurs configurations.

```shell
# firewall-cmd --list-all-zones
```

Zone par défaut, changement.

```shell
# firewall-cmd --set-default-zone=<ZONE>
# firewall-cmd --get-zone-of-interface=<NIC>
```

Liste des services disponibles.

```shell
# firewall-cmd --get-services
```

Configuration des services.

```shell
# ls /usr/lib/firewalld/services/
```

Affichage d'une configuration de services.

```shell
# cat /usr/lib/firewalld/services/<SERVICES>.xml
```

Prise en compte des modifications opérées.

```shell
# firewall-cmd --reload
```

Vérification des services disponibles.

```shell
# firewall-cmd --get-services
```

Ouverture du port 22 jusqu'au prochain reboot.

```shell
# firewall-cmd --zone=public --add-port=22/tcp
# firewall-cmd --reload
```

Ouverture du port 22 définitivement.

```shell
firewall-cmd --zone=public --add-service=ssh --permanent && firewall-cmd --reload
```

## GRUB

Verbosité de GRUB :

RHEL 6

```shell
# vi /boot/grub/grub.conf
```

Supprimer les options : `rhgb` et `quiet`

RHEL 7

```shell
vi /etc/default/grub
```

Supprimer les options : `rhgb` et `quiet` dans la section `GRUB_CMDLINE_LINUX=`.

Modifier le temps de démarrage.

```shell
# GRUB_TIMEOUT=5
GRUB_TIMEOUT=1
```

Permettre de fixer les noms des interfaces réseaux en `ethX`.

```shell
GRUB_CMDLINE_LINUX="[...] net.ifnames=0 biosdevname=0"
```

Forcer la résolution de la console en 1024x768 :

```shell
# GRUB_CMDLINE_LINUX="[.../...] rhgb quiet"
GRUB_CMDLINE_LINUX="[.../...] vga=773"
```

Synthèse du fichier de configuration :

```shell
# vi /etc/default/grub

GRUB_TIMEOUT=1
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="[.../...] vga=773 net.ifnames=0 biosdevname=0"
GRUB_DISABLE_RECOVERY="true"
```

Mise à jour de GRUB, pour BIOS.

```shell
# grub2-mkconfig -o /boot/grub2/grub.cfg
# reboot
```

Mise à jour de GRUB, pour UEFI.

```shell
# grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg
```

## Cockpit

Cockpit est une interface de gestion en WebUI, développé par Red Hat et donc dans les dépôts officiels.

Installation.

```shell
# yum install cockpit
```

Démarrage de Cockpit.

```shell
# systemctl start cockpit
```

Démarrage automatique de Cockpit à chaque démarrage.

```shell
# systemctl enable --now cockpit.socket
```

Autorisation d'accès à la WebUI par le firewall.

```shell
# firewall-cmd --add-service=cockpit --permanent && firewall-cmd --reload
```

La connexion à Cockpit se fait sur le port TCP/9090, le certificat proposé est auto-signé.

```shell
curl -I -k https://127.0.0.1:9090
```

Affichage du certificat.

```shell
openssl s_client -connect 127.0.0.1:9090
```

## SUDO

Installation.

```shell
# yum install -y sudo
```

Le fichier de configuration de base propose quelques exemples. Il convient d'éviter de le modifier directement.

```shell
# less /etc/sudoers
```

Octroi des droits d'administation à un utilisateur, sans limites.

```shell
# vi /etc/sudoers.d/<UTILISATEUR-A>

<UTILISATEUR-A>  ALL=(ALL)  ALL
```

Octroi des droits d'administation à un utilisateur, au périmètre défini.

```shell
# vi /etc/sudoers.d/<UTILISATEUR-B>

Defaults: !requiretty
Cmnd_Alias <PERIMETRE> = /usr/bin/ping, /usr/bin/yum, /usr/bin/systemctl
<UTILISATEUR-B> ALL=(ALL:ALL) NOPASSWD: <PERIMETRE>
```

Vérification des droits octroyés, en tant que `root`.

```shell
# sudo -l -U <UTILISATEUR>
```


Vérification des droits octroyés, en tant qu'utilisateur.

```shell
sudo -l
```
