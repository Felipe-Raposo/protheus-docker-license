# License Server 3.7.2

Imagem Docker para execução do **TOTVS License Server** 3.7.2 em ambiente containerizado.

## Descrição

Este projeto monta uma imagem Docker do TOTVS License Server 3.7.2 sobre `feliperaposo/protheus-docker-base:24`. Serve para desenvolvimento, testes ou orquestração (Kubernetes, Docker Compose, etc.).

Se estiver buscando um ambiente completo com Protheus + License + dbAccess + Postgres, acesse esse [projeto](https://github.com/Felipe-Raposo/protheus-docker-compose).

### Características

- **Base:** `feliperaposo/protheus-docker-base:24` (AppServer 24.3.1.9; RPO e dados do patch 26-09-16 TOTVSLICENSE 3.7.2)
- **License Server:** porta TCP 5555
- **License Server Monitor:** WebApp na porta TCP 1234 (`TOTVSLSMONITOR`)
- **Artefatos do patch (RPO-only):** `tttm120.rpo` em `/protheus12/data/apo/`, `lsinitialize.inf` em `/protheus12/bin/appserver/`, certificado cloud em `/protheus12/data/certs/` e `special.key` em `/protheus12/data/semaforo/`

O instalador oficial 3.7.2 embarca AppServer **24.3.0.11** como referência; esta imagem **não** substitui os binários da base Docker (modo RPO-only), mantendo `protheus-docker-base:24` alinhado à linha 24.x do License.

## Pré-requisitos

- Docker (com BuildKit habilitado para build)
- Host de build `linux/amd64` (`make build` passa `--platform=linux/amd64`)
- Imagem `feliperaposo/protheus-docker-base:24` disponível localmente ou no registry

## Build

```bash
make build
```

## Publicação da imagem

```bash
make release
make release_latest
```

Gera as tags:

- `feliperaposo/protheus-license:3`
- `feliperaposo/protheus-license:3.7.2`
- `feliperaposo/protheus-license:latest`

## Estrutura interna (referência)

- **Entrypoint:** `/protheus.sh` (herdado da base)
- **Configuração:** `/protheus12/bin/appserver/appserver.ini` (License Server + TLS)
- **RPO:** `/protheus12/data/apo/tttm120.rpo`
- **Licença:** `/protheus12/bin/appserver/lsinitialize.inf` e `/protheus12/bin/appserver/licenseserver.ini`

## Licença

Este projeto está sob a [GNU General Public License v3.0](LICENSE).

## Mantenedor

Felipe Raposo — [feliperaposo@gmail.com](mailto:feliperaposo@gmail.com)
