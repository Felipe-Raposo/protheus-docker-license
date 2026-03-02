# License Server

Imagem Docker para execução do **TOTVS License Server**, em ambiente containerizado.

## Descrição

Este projeto monta uma imagem Docker TOTVS License Server, sobre Oracle Linux 9. A imagem é útil para ambientes de desenvolvimento, testes ou orquestração (Kubernetes, Docker Compose, etc.).

### Características

- **Base:** feliperaposo/protheus-base:24 (Onça Preta)
- **License Server:** License (porta TCP 5555)
- **License Server Monitor:** WebApp (porta TCP 1234)

## Pré-requisitos

- Docker (com BuildKit habilitado para build)

## Build

```bash
# Build local das tags de versão
make build
```

## Publicação da imagem

```bash
# Build e push das tags de versão
make release

# Incluir também a tag latest
make release_latest
```

Gera as tags:

- `feliperaposo/protheus-license:3`
- `feliperaposo/protheus-license:3.7.0`
- `feliperaposo/protheus-license:latest`

## Estrutura interna (referência)

- **Entrypoint:** `/dbaccess.sh`
- **Configuração:** `/protheus12/bin/appserver/appserver.ini`

## Licença

Este projeto está sob a [GNU General Public License v3.0](LICENSE).

## Mantenedor

Felipe Raposo — [feliperaposo@gmail.com](mailto:feliperaposo@gmail.com)
