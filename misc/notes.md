# notes

## certificats publics

Liste les certificats émis pour un domaine, via https://crt.sh/ :

```shell
curl --silent "https://crt.sh/?q=<DOMAINE>.<TLD>" | grep -v white-space | grep "<TD>" | cut -d ">" -f2 | cut -d "<" -f1 | sort -u
```

Liste les certificats émis pour un domaine, via https://crt.sh/, puis vérification des enregistrements DNS :

```shell
curl --silent "https://crt.sh/?q=<DOMAINE>.<TLD>" | grep -v white-space | grep "<TD>" | cut -d ">" -f2 | cut -d "<" -f1 | sort -u | xargs -l host
```
