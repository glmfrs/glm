# localhost.crt

```shell
openssl req -x509 -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -sha256 -days 3650 -nodes -keyout localhost.key.pem -out localhost.crt.pem -subj "/CN=localhost.localdomain"
```

```shell
openssl pkcs12 -export -inkey localhost.key.pem -in localhost.crt.pem -out localhost.p12
```

