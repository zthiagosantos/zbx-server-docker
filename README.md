<h1 align="center">ZABBIX SERVER COM DOCKER</h1>

## DESCRIÇÃO DO PROJETO
Este p

### CONTEÚDO
<!--ts-->
   * [Pré-requisitos](#pr%C3%A9-requisitos)
   * [Instalar Zabbix Server](#instalar-zabbix-server)
   * [Configurar banco de dados Grafana](#configurar-banco-de-dados-para-o-grafana)
   * [Remover Zabbix Server](#remover-zabbixgrafana)
<!--te-->

### PRÉ-REQUISITOS

Antes de começar, você vai precisar ter instalado em sua máquina as ferramentas abaixo:

- [Git](https://git-scm.com/download/linux)
- [Docker](https://docs.docker.com/engine/install/)

### INSTALAR ZABBIX SERVER
>Este projeto é composoto pelas seguintes aplicações:
>- MySQL
>- Zabbix Server
>- Zabbix Java Gateway
>- Nginx
>- Grafana Server

Clone o repositório
```bash
git clone https://github.com/ZTaigho/zabbixDocker.git
```

Configure as variáveis do banco de dados editando o arquivo `.env`:

```env
MYSQL_DATABASE=zabbix             # banco de dados 'zabbix'
MYSQL_PASSWORD=zabbix             # senha do banco de dados 'zabbix'
MYSQL_ROOT_PASSWORD=<changeme>    # senha para usuário 'root'
MYSQL_USER=zabbix                 # usuário do banco de dados 'zabbix'
```

Se desejar utilizar outras versões, defina também as demais variáveis. Por exemplo:

```env
ZABBIX_SERVER_IMAGE=zabbix/zabbix-server-mysql
ZABBIX_SERVER_TAG=ubuntu-7.0-latest
```

Inicie os containers com o comando abaixo:
```bash
docker compose up --build -d
```

<br>

> [!IMPORTANT]
> #### O `Grafana` está configurado para usar o `MySQL` como banco de dados. Para que ele funcione corretamente, será necessário criar o banco de dados com as devidas permissões.

### CONFIGURAR BANCO DE DADOS PARA O GRAFANA

a. Execute o container `mysql-server` no modo interativo com o comando abaixo e insira a senha quando solicitado:
```bash
docker exec -it mysql-server mysql -uroot -p
```

b. Agora, crie o banco de dados e conceda as permissões:
```bash
# CREATE DATABASE grafana;
# CREATE USER 'grafana'@'<ip>' IDENTIFIED BY '<password>';
# GRANT ALL PRIVILEGES ON grafana.* TO 'grafana'@'<ip>';
# FLUSH PRIVILEGES;
```

c. Reinicie o container `grafana-server`:
```bash
docker restart grafana-server
```

<br>

### REMOVER ZABBIX/GRAFANA

Remover apenas os containers
```bash
docker compose down
```

Remover os containers + volumes
```bash
docker compose down -v
```
