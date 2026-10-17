# License Server 3.7.2

Imagem Docker para execução do **TOTVS License Server** 3.7.2 em ambiente containerizado.

## Descrição

Este projeto monta uma imagem Docker TOTVS License Server sobre a imagem base Protheus. A imagem é útil para ambientes de desenvolvimento, testes ou orquestração (Kubernetes, Docker Compose, etc.).

### Características

- **Base:** `feliperaposo/protheus-docker-base:24` (AppServer da base Docker; RPO/dados do patch 26-09-16 TOTVSLICENSE 3.7.2)
- **License Server:** porta TCP 5555
- **License Server Monitor:** WebApp (porta TCP 1234)
- **Artefatos do patch (RPO-only):** `tttm120.rpo`, `lsinitialize.inf`, certificado cloud e `special.key` em `/protheus12/data/`

O instalador oficial 3.7.2 embarca AppServer **24.3.0.11** como referência; esta imagem **não** substitui os binários da base Docker (modo RPO-only), mantendo `protheus-docker-base:24` alinhado à linha 24.x do License.

## Pré-requisitos

- Docker (com BuildKit habilitado para build)
- Imagem `feliperaposo/protheus-docker-base:24` disponível localmente ou no registry

## Atualizar artefatos do patch

```bash
./scripts/extract-license-372.sh /caminho/para/26-09-16-TOTVSLICENSE_3_7_2_LINUX.TAR.GZ
```

Requer Docker (Oracle Linux 9 + Java) para instalação silent temporária e cópia dos arquivos para `root/protheus12/`.

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

## Licença

Este projeto está sob a [GNU General Public License v3.0](LICENSE).

## Mantenedor

Felipe Raposo — [feliperaposo@gmail.com](mailto:feliperaposo@gmail.com)
