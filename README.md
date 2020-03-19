# Traefik 2 docker-compose

使用`Traefik 2`來作為`docker-compose`的`proxy`

## 與其他 docker-compose 串接

需要先啟動本處的`docker-compose`
再啟動其他`docker-compose`來接上`network`

範例:

``` yaml
version: "3.7"

networks:
  traefik_bridge:
    external: true
    name: traefik_bridge

services:
  other-cantainer:
    build:
      context: ./
    volumes:
      - ./:/var/www/app/
    labels:
      - "traefik.http.routers.other-cantainer.rule=Host(`domain`)"
      - "traefik.http.routers.other-cantainer.tls=true"
      - "traefik.http.services.other-cantainer.loadbalancer.server.port=80"
      - "traefik.enable=true"
    networks:
      - traefik_bridge
```
