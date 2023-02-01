# Notes

## SSH

```shell
ssh-keygen -f "~/.ssh/id_ed25519" -t ed25519 -o -a 111 -C "USER@DOMAINE.TLD"
```

## x509

```shell
openssl rand -base64 44
```

```shell
openssl req -text -noout -verify -in <CERTIFICATE_SIGNING_REQUEST>.csr
```

```shell
openssl rsa -in CertificateKey.key -check
```

```shell
openssl x509 -in <CERTIFICAT>.crt -text -noout
```

```shell
openssl pkcs12 -info -in <CERTIFICAT>.p12
```

```shell
openssl req -x509 -sha512 -nodes -days 3650 -newkey rsa:4096 -keyout <PRIVATE_KEY>.key -out <CERTIFICAT>.crt -subj '/C=<PAYS>/ST=<ETAT>/L=<VILLE>/O=<ENTREPRISE>/OU=<ORGANISATION>/CN=<FQDN>/emailAddress=<EMAIL>'
```

Liste les certificats émis pour un domaine, via https://crt.sh/ :

```shell
curl --silent "https://crt.sh/?q=<DOMAINE>.<TLD>" | grep -v white-space | grep "<TD>" | cut -d ">" -f2 | cut -d "<" -f1 | sort -u
```

Liste les certificats émis pour un domaine, via https://crt.sh/, puis vérification des enregistrements DNS :

```shell
curl --silent "https://crt.sh/?q=<DOMAINE>.<TLD>" | grep -v white-space | grep "<TD>" | cut -d ">" -f2 | cut -d "<" -f1 | sort -u | xargs -l host
```

## 7zip

```shell
7z a -mx=9 -ms=on -p <ARCHIVE>.7z <DIRECTORY>
```

## User Agent

Modification de l'User Agent sur les navigateurs Chromium et dérivés.

1. Developer Tools (Ctrl+Shift+I)
2. Burger Menu
3. More Tools
4. Network Conditions
5. User agent
