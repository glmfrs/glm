#!/bin/bash
# vim: expandtab:ts=4:sw=4:syntax=sh

NOW="`date +%Y%m%d%H%M`"
SHA="/root/$NOW-checksum.sha1"
BAK_ROOT="/srv/files"
TAR_ROOT="/srv/tar"
LOG="$TAR_ROOT/$NOW-bak.log"
TARBALL="$TAR_ROOT/$NOW-bak.tgz"

# Test de l'utilisateur root

if [ "$EUID" -ne 0 ]; then
    echo "ROOT est requis"
    exit
fi

# Liste des paquets installés

rpm -qa | sort -h > "/root/$NOW-yum.lst"

# Somme de contrôle récursive

find /root -type f -exec sha1sum {} \; | sort -k 2 > $SHA
find /etc -type f -exec sha1sum {} \; | sort -k 2 >> $SHA

# Test des répertoires

if [ ! -d "$BAK_ROOT" ]; then
    mkdir -p "$BAK_ROOT"
fi

if [ ! -d "$TAR_ROOT" ]; then
    mkdir -p "$TAR_ROOT"
fi

# Synchronisation puis test

echo "#-----------------------------------------#"  >> "$LOG"
echo "# Synchronisation                         #"  >> "$LOG"
echo "#-----------------------------------------#"  >> "$LOG"

/usr/bin/rsync \
    --archive \
    --human-readable \
    --recursive \
    --stats \
    --force \
    --delete-after \
    --log-file=$LOG \
    --verbose \
    /root \
    /etc/ \
    /$BAK_ROOT
    &>/dev/null

if [ $? -eq 0 ]; then
    echo "#-----------------------------------------#"  >> "$LOG"
    echo "# Rsync : OK                              #"  >> "$LOG"
    echo "#-----------------------------------------#"  >> "$LOG"
else
    echo "#-----------------------------------------#"  >> "$LOG"
    echo "# Rsync : KO KO KO KO KO KO KO KO KO KO   #"  >> "$LOG"
    echo "#-----------------------------------------#"  >> "$LOG" ; exit 3
fi

# Archivage, compression puis test

/usr/bin/tar -czPf \
    "$TARBALL" \
    "$BAK_ROOT"

if [ $? -eq 0 ]; then
    echo "#-----------------------------------------#"  >> "$LOG"
    echo "# Gzip : OK                               #"  >> "$LOG"
    echo "#-----------------------------------------#"  >> "$LOG"
else
    echo "#-----------------------------------------#"  >> "$LOG"
    echo "# Gzip : KO KO KO KO KO KO KO KO KO KO KO #"  >> "$LOG"
    echo "#-----------------------------------------#"  >> "$LOG" ; exit 3
fi

# Chiffrement GnuPG

#/usr/bin/gpg2 --recipient $EMAIL --encrypt $TARBALL && \
#if [ $? -eq 0 ]; then
#  rm -f $TARBALL && \
#    echo "#-----------------------------------------#"  >> "$LOG"
#    echo "# GnuPG : OK                              #"  >> "$LOG"
#    echo "#-----------------------------------------#"  >> "$LOG"
#else
#    echo "#-----------------------------------------#"  >> "$LOG"
#    echo "# GnuPG : KO KO KO KO KO KO KO KO KO KO   #"  >> "$LOG"
#    echo "#-----------------------------------------#"  >> "$LOG" ; exit 3
#fi

echo "#-----------------------------------------#"  >> "$LOG"
echo "# Sauvegarde complète                     #"  >> "$LOG"
echo "#-----------------------------------------#"  >> "$LOG"
