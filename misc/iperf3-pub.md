# iperf3

Liste de serveurs iPerf3 publics :

* `https://github.com/R0GGER/public-iperf3-servers`
* `https://iperf3serverlist.net/`

## Usage

```shell
iperf3 -c <IPERF3_SERVER> -p <PORT>
```

Options :

* `-c` : host
* `-p, --port` : Port en écoute du serveur iPerf3 (5201 par défaut)
* `-R, --reverse` : run in reverse mode (server sends, client receives)(download)
* `-4, --version4` : IPv4 uniquement
* `-6, --version6` : IPv6 uniquement

## Serveurs

### Africa

| COMMAND                                            | OPT | GB/s | COUNTRY | SITE         |   |
|:---------------------------------------------------|-----|------|---------|:-------------|---|
| iperf3 -c speed.mymanga.pro                        | -R  |      | KE      | Nairobi      |   |
| iperf3 -c 197.155.149.134                          | -R  |      | ML      |              |   |
| iperf3 -c speedtest.telecom.mu -p 5201-5209        | -R  |      | MU      | Port Louis   |   |
| iperf3 -c speedtestfl.telecom.mu -p 5201-5209      | -R  |      | MU      | Floreal      |   |
| iperf3 -c speedtestrh.telecom.mu -p 5201-5209      | -R  |      | MU      | Rose Hill    |   |
| iperf3 -c speedtestlondon.telecom.mu -p 5201-5209  | -R  |      | MU      | Tamarin      |   |
| iperf3 -c 41.213.138.11                            | -R  |      | RE      |              |   |
| iperf3 -c 154.73.174.30                            |     |      | SN      | Dakar        |   |
| iperf3 -c 13.244.123.229 -p 5201-5203              |     |      | ZA      | Cape Town    |   |
| iperf3 -c 154.0.5.20                               |     |      | ZA      | Cape Town    |   |
| iperf3 -c 41.168.5.158                             |     |      | ZA      | Johannesburg |   |
| iperf3 -c 102.165.60.112                           | -R  |      | ZA      | Johannesburg |   |
| iperf3 -c 102.134.120.74                           |     |      | ZA      | Johannesburg |   |
| iperf3 -c speedtest.rocketnet.co.za                | -R  |      | ZA      | Johannesburg |   |

### America

| COMMAND                                            | OPT | GB/s | COUNTRY | SITE            |   |
:----------------------------------------------------|-----|------|---------|:----------------|---|
| iperf3 -c 168.195.96.44 -p 5201-5204               |     |      | BR      | Joinville       |   |
| iperf3 -c 216.40.45.41                             |     |      | CA      |                 |   |
| iperf3 -c vern.cc -p 5201-5203                     | -R  | 1    | CA      | Beauharnois     |   |
| iperf3 -c speedtest3.sasknet.sk.ca                 | -R  |      | CA      | Saskatoon       |   |
| iperf3 -c 74.205.217.156                           |     |      | CA      | Stittsville     |   |
| iperf3 -c sp11.wom.cl                              |     |      | CL      | Santiago        |   |
| iperf3 -c speedtest.masnet.ec                      | -R  | 1    | EC      | Santa Ana       |   |
| iperf3 -c lists.vern.cc -p 5201-5202               | -R  | 1    | US      | Atlanta         |   |
| iperf3 -c atl.speedtest.clouvider.net -p 5200-5209 | -R  | 10   | US      | Atlanta         |   |
| iperf3 -c ash.speedtest.clouvider.net -p 5200-5209 | -R  | 10   | US      | Ashburn         |   |
| iperf3 -c speedtest13.suddenlink.net               | -R  | 10   | US      | Charleston      |   |
| iperf3 -c speedtest15.suddenlink.net               | -R  | 10   | US      | Charleston      |   |
| iperf3 -c charlottesville.speedtest.ting.com       | -R  |      | US      | Charlottesville |   |
| iperf3 -c dal.speedtest.clouvider.net -p 5200-5209 | -R  | 10   | US      | Dallas          |   |
| iperf3 -c la.speedtest.clouvider.net -p 5200-5209  | -R  | 10   | US      | Los Angeles     |   |
| iperf3 -c speedtest.tds.net                        | -R  |      | US      | Madison         |   |
| iperf3 -c iceberg.vern.cc                          | -R  | 1    | US      | New Jersey      |   |
| iperf3 -c nyc.speedtest.clouvider.net -p 5200-5209 | -R  | 10   | US      | New York City   |   |
| iperf3 -c speedtest.ny.buyvm.net                   | -R  | 1    | US      | New York        |   |
| iperf3 -c nyfiosspeed1.west.verizon.net            | -R  |      | US      | New York        |   |
| iperf3 -c nyfiosspeed2.west.verizon.net            | -R  |      | US      | New York        |   |
| iperf3 -c nyfiosspeed3.west.verizon.net            | -R  |      | US      | New York        |   |
| iperf3 -c nyfiosspeed4.west.verizon.net            | -R  |      | US      | New York        |   |

### Asia

| COMMAND                                         | OPT | GB/s | COUNTRY | SITE          |   |
|:------------------------------------------------|-----|------|---------|:--------------|---|
| iperf3 -c iperf.biznetnetworks.com -p 5201-5203 | -R  | 1    | ID      | Jakarta       |   |
| iperf3 -c oke.net.id                            | -R  | 1    | ID      | Jakarta       |   |
| iperf3 -c speed.netfiber.net.il                 | -R  | 1    | IL      | Jerusalem     |   |
| iperf3 -c speed.rimon.net.il                    | -R  | 1    | IL      | Jerusalem     |   |
| iperf3 -c in-speedtest.host-palace.com          | -R  | 1    | IN      | Suri          |   |
| iperf3 -c 91.185.23.98                          | -R  |      | KZ      | Aktau         |   |
| iperf3 -c gpon.time.net.my                      | -R  | 1    | MY      | Kuala Lumpur  |   |
| iperf3 -c speedtest.uztelecom.uz -p 5200-5207   | -R  | 10   | UZ      | Tashkent      |   |
| iperf3 -c 156.59.143.226                        | -R  | 1    | VN      | Hanoi         |   |

### Europe

| COMMAND                                              | OPT   | GB/s | COUNTRY | SITE              |    |
|:-----------------------------------------------------|-------|------|---------|:------------------|----|
| iperf3 -c lg.vie.alwyzon.net                         | -R    |      | AT      | Vienna            |    |
| iperf3 -c speedtest.neterra.net                      |       | 10   | BG      | Sofia             |    |
| iperf3 -c speed.nimag.net                            | -R -6 | 10   | CH      | Lausanne          |    |
| iperf3 -c speedtest.shinternet.ch -p 5200-5209       | -R -6 |      | CH      | Schaffhausen      |    |
| iperf3 -c speedtest.iway.ch                          | -R    | 10   | CH      | Zürich            |    |
| iperf3 -c 178.215.228.109 -p 9210                    | -R    |      | DE      | Frankfurt         |    |
| iperf3 -c lg.ip-projects.de                          |       |      | DE      | Frankfurt         |    |
| iperf3 -c speedtest.wobcom.de :small_blue_diamond:   | -R -6 | 2x25 | DE      | Wolfsburg         |    |
| iperf3 -c a400.speedtest.wobcom.de                   | -R -6 | 2x25 | DE      | Wolfsburg         |    |
| iperf3 -c a209.speedtest.wobcom.de                   | -R -6 | 2x25 | DE      | Berlin            |    |
| iperf3 -c a110.speedtest.wobcom.de                   | -R -6 | 2x25 | DE      | Berlin            |    |
| iperf3 -c a210.speedtest.wobcom.de                   | -R -6 | 2x25 | DE      | Frankfurt         |    |
| iperf3 -c a205.speedtest.wobcom.de                   | -R -6 | 2x25 | DE      | Frankfurt         |    |
| iperf3 -c a208.speedtest.wobcom.de                   | -R -6 | 2x25 | DE      | Düsseldorf        |    |
| iperf3 -c speedtest.wtnet.de -p 5200-5209            | -R -6 | 40   | DE      | Norderstedt       |    |
| iperf3 -c iperf.deic.dk                              | -R    | 10   | DK      | Copenhagen        |    |
| iperf3 -c speedtest.hiper.dk -p 5201-5203            | -R    |      | DK      | Copenhagen        |    |
| iperf3 -c speed.fiberby.dk -p 9201-9240              | -R -6 | 10   | DK      | Copenhagen        |    |
| iperf3 -c speedtest-hki.netplaza.fi                  | -R    |      | FI      | Helsinki          |    |
| iperf3 -c speedtest.cinia.fi                         |       |      | FI      | Oulu              |    |
| iperf3 -c speedtest.extra.telia.fi                   |       |      | FI      | Helsinki          |    |
| iperf3 -c iperf.online.net -p 5204                   | -R    | 10   | FR      | Vitry-sur-Seine   |    |
| iperf3 -c iperf.par2.as49434.net -p 9202             | -R    | 40   | FR      | Paris             |    |
| iperf3 -c aix-marseille.testdebit.info -p 9200-9240  | -6 -R | 10   | FR      | Aix-en-Provence   |    |
| iperf3 -c bordeaux.testdebit.info -p 9200-9240       | -6 -R | 10   | FR      | Bordeaux          |    |
| iperf3 -c lille.testdebit.info -p 9200-9240          | -6 -R | 10   | FR      | Lille             |    |
| iperf3 -c lyon.testdebit.info -p 9200-9240           | -6 -R | 10   | FR      | Lyon              |    |
| iperf3 -c bouygues.testdebit.info -p 9200-9240       | -6 -R | 10   | FR      | Paris             |    |
| iperf3 -c paris.testdebit.info -p 9200-9240          | -6 -R | 10   | FR      | Paris             |    |
| iperf3 -c scaleway.testdebit.info -p 5200-5209       | -6 -R | 10   | FR      | Vitry-sur-Seine   |    |
| iperf3 -c ping-90ms.online.net -p 5200-5209          | -R    | 10   | FR      | Vitry-sur-Seine   |    |
| iperf3 -c ping6-90ms.online.net -p 5200-5209         | -6 -R | 10   | FR      | Vitry-sur-Seine   |    |
| iperf3 -c ping.online.net -p 5200-5209               | -R    | 10   | FR      | Vitry-sur-Seine   |    |
| iperf3 -c ping6.online.net -p 5200-5209              | -6 -R | 10   | FR      | Vitry-sur-Seine   |    |
| iperf3 -c proof.ovh.net -p 5201-5210                 | -R    | 10   | FR      | Paris             |    |
| iperf3 -c iperf.as42831.net -p 5300-5400             | -R    |      | GB      | London            |    |
| iperf3 -c lon.speedtest.clouvider.net -p 5200-5209   | -R    | 10   | GB      | London            |    |
| iperf3 -c speed.dimensione.com                       | -R    | 1    | IT      | Milan             |    |
| iperf3 -c speed.dimensione.com -p 5206               | -R -6 | 1    | IT      | Milan             |    |
| iperf3 -c speed.itgate.net 5201-5202                 | -R    |      | IT      | Gerbido           |    |
| iperf3 -c speedtest.lu.buyvm.net                     | -R    |      | LU      | Bissen            |    |
| iperf3 -c a204.speedtest.wobcom.de                   | -R -6 | 2x25 | NL      | Amsterdam         |    |
| iperf3 -c ams.speedtest.clouvider.net -p 5200-5209   | -R    | 10   | NL      | Amsterdam         |    |
| iperf3 -c nl.iperf.014.fr -p 10420                   | -R    | 1    | NL      | Amsterdam         |    |
| iperf3 -c ping-ams1.online.net -p 5200-5209          | -R    | 10   | NL      | Amsterdam         |    |
| iperf3 -c speedtest-nl-oum.hybula.net -p 5202-5206   | -R -6 | 40   | NL      | Amsterdam         |    |
| iperf3 -c speedtest.ams1.novogara.net -p 5200-5209   | -R -6 | 20   | NL      | Amsterdam         |    |
| iperf3 -c speedtest.novoserve.com -p 5202-5206       | -R -6 | 40   | NL      | Amsterdam         |    |
| iperf3 -c speedtest.serverius.net -p 5002            | -R -6 | 10   | NL      | Amsterdam         |    |
| iperf3 -c spt01.sdhd.hosting                         | -R    | 10   | NL      | Dronten           |    |
| iperf3 -c lg-drn.liteserver.nl -p 5201-5240          | -R    | 1    | NL      | Dronten           |    |
| iperf3 -c iperf.worldstream.nl                       | -R -6 | 10   | NL      | Naaldwijk         |    |
| iperf3 -c lg.terrahost.com -p 9200                   |       | 10   | NO      | Sandefjord        |    |
| iperf3 -c speedtest.fiberway.pl                      | -R    |      | PL      | Kazimierza Wielka |    |
| iperf3 -c speedtest.midiko.pl                        | -R    |      | PL      | Katowice          |    |
| iperf3 -c 95.95.252.87 -p 5201/5205/5207             | -R    |      | PT      | Lissabon          |    |
| iperf3 -c 31.148.48.5                                | -R    |      | RU      | Angarsk           |    |
| iperf3 -c speedtest.kamel.network -p 5201-5205       | -R    |      | SE      | Kista             |    |
| iperf3 -c speedtest.ownit.se                         | -R    | 10   | SE      | Stockholm         |    |
| iperf3 -c speedtestv6.ownit.se                       | -R -6 | 10   | SE      | Stockholm         |    |
| iperf3 -c se-speedt01.fre.nis.telia.net -p 5201-5210 | -R -6 |      | SE      | Viken             |    |
| iperf3 -c iperf.astra.in.ua -p 5201-5210             | -R    | 10   | UA      | Lviv              |    |
| iperf3 -c speed.cosmonova.net                        | -R    |      | UA      | Kyiv              |    |
| iperf3 -c speedtest.astra.in.ua                      | -R    |      | UA      | Lviv              |    |
| iperf3 -c speedtest.pol.volia.net                    | -R    |      | UA      | Poltava           |    |
| iperf3 -c speedtest.solver.net.ua                    | -R    |      | UA      | Poltava           |    |

:small_blue_diamond: speedtest.wobcom.de connects to the nearest *.speedtest.wobcom.de server.
