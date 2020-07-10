#!/bin/bash
# vim: expandtab:ts=4:sw=4:syntax=sh

NOW="`date +%Y%m%d%H%M`"
ARK_BAK="$HOME/data/ark/bak"
ARK_TAR="$HOME/data/ark/tar"
SRC="$HOME"
EXCLU="bak-home.lst"
LOG="$ARK_TAR/$NOW-bak.log"
TARBALL="$ARK_TAR/$NOW-bak.tgz"
EMAIL="guillaume@fresse.fr"

# Somme de contrôle récursive
#find $SRC -type f -exec sha1sum {} \; | sort -k 2 > "$NOW-checksum.sha1"

echo "#-----------------------------------------#"  >> "$LOG"
echo "# Synchronisation                         #"  >> "$LOG"
echo "#-----------------------------------------#"  >> "$LOG"

# Test des répertoires

if [ ! -d "$ARK_BAK" ]; then
  mkdir -p "$ARK_BAK"
fi

if [ ! -d "$ARK_TAR" ]; then
  mkdir -p "$ARK_TAR"
fi

# Synchronisation puis test

/usr/bin/rsync --archive --human-readable --recursive --stats --force --delete-after --include-from="$EXCLU" --log-file=$LOG --verbose "$SRC" "$ARK_BAK" &>/dev/null

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

/usr/bin/tar -czPf "$TARBALL" "$ARK_BAK"

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

#/usr/bin/gpg --recipient $EMAIL --encrypt $TARBALL && \
#
#if [ $? -eq 0 ]; then
#    rm -f $TARBALL && \
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
