# Python for Data Science Playground

> Desenvolvido por **Bruno Henrique Trindade**

Este projeto tem o objetivo de fornecer um ambiente completo e altamente personalizado para o desenvolvimento de scripts e análises de Data Science.

O Playground é um ambiente de desenvolvimento, portanto, não foi projetado nem otimizado para ser utilizado em produção, mas pode e deve ser explorado para fins educacionais.

## Acesso Rápido

---

| Serviço | URL | Porta |
| --- | --- | --- |
| Playground | http://localhost:5000 | 5000 |
| Metabase | http://localhost:3000 | 3000 |
| Adminer | http://localhost:8080 | 8080 |
| PostgreSQL | - | 5432 |

## Bibliotecas

---

Fornece todas as principais ferramentas e bibliotecas utilizadas no Data Science e Machine Learning incluindo:

- Python 3.8
- Jupyter
- Notebook
- Pandas
- Numpy
- Seaborn

E apesar de já estarem incluídos por padrão, nada impede do usuário deste projeto adicionar ou remover qualquer biblioteca ou dependência conforme sua necessidade ou interesse.

## Serviços

---

Além das bibliotecas de Data Science do Python, foram adicionados recursos extras que potencializam e aumentam ainda mais as possibilidades de uso do desenvolvedor, sendo eles:

- Flask: servidor HTTP para Python (obrigatório)
- PostgreSQL: banco de dados PostgreSQL (banco de dados relacional)
- Metabase: dashboards e ferramentas de BI
- Adminer: cliente de banco de dados acessível via browser
- MongoDB: banco de dados MongoDB (banco de dados não relacional) - EM BREVE
- MySQL: banco de dados MySQL (banco de dados relacional) - EM BREVE

> Com exceção do Flask que vem ativado por padrão (e é obrigatório), os demais serviços podem ser ativados manualmente, descomentando-os no arquivo **docker-compose.yml**

## Notebooks

---

Todos os arquivos de notebook devem ser armazenados no diretório 

```
/notebooks
```

## Arquivos de Datasets

---

Todos os arquivos de datasets devem ser armazenados no diretório 

```
/data
```

Os arquivos salvos neste diretório não serão enviados para o Git.

Sempre que iniciar um notebook lembre-se de adicionar a variável data_path e a função data() ao seu notebook para obter os datasets a partir do diretório correto.

```python
data_path = "../data/"

def data(content):
    return data_path + content
```

## Bibliotecas Próprias

---

Caso seja necessário implementar alguma biblioteca própria, salve-a no diretório:

```
/src
```

## Considerações Iniciais e Requisitos

---

### Sistema Operacional

Os comandos descritos neste documento se aplicam para o Linux Ubuntu. No entanto, podem ser adaptados para o uso no Windows.

### Docker

O Docker com Docker Compose é o único requisito obrigatório externo ao projeto que precisa ser instalado no seu computador a fim de executar o playground corretamente.

Todas as demais dependências obrigatórias serão fornecidos pelo próprio Playground em tempo de execução.

### VS Code

Utilize o VSCode (Visual Studio Code) da Microsoft como IDE do projeto.

#### Extenções Recomendadas

```txt
Nome: Dev Containers
ID: ms-vscode-remote.remote-containers
Descrição: Open any folder or repository inside a Docker container and take advantage of Visual Studio Code's full feature set.
Versão: 0.262.3
Editor: Microsoft
Link do Marketplace do VS: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

Nome: Docker
ID: ms-azuretools.vscode-docker
Descrição: Makes it easy to create, manage, and debug containerized applications.
Versão: 1.22.2
Editor: Microsoft
Link do Marketplace do VS: https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker

Nome: Python Extension Pack
ID: donjayamanne.python-extension-pack
Descrição: Popular Visual Studio Code extensions for Python
Versão: 1.7.0
Editor: Don Jayamanne
Link do Marketplace do VS: https://marketplace.visualstudio.com/items?itemName=donjayamanne.python-extension-pack
```

## Comandos Básicos

---

Inicia o playground

```shell
bash dev up
```

Força o build do playground

```shell
bash dev build
```

Para o playground

```shell
bash dev down
```

Reinicia o playground

```shell
bash dev restart
```

Entra no terminal do container do playground

```shell
bash dev cmd
```

Exibe o log de todos os serviços do playground

```shell
bash dev log
```

Limpa serviços desativados do playground

```shell
bash dev clear
```

## Preparação do Playground

---

Antes de começar a usar o Playground é necessário prepará-lo.

```shell
cp requirements.example.txt requirements.txt && cp docker-compose.example.yml docker-compose.yml
```

Este comando copiará os arquivos necessários para executar o Playground. 

> Mais adiante, nesta documentação, entraremos em detalhes sobre estes arquivos.

## Instalando bibliotecas ao Python

---

- Utilizando o VSCode abra o arquivo requirements.txt
- Adicione o nome da biblioteca ao final do arquivo e salve

No terminal, execute o seguinte comando:

```shell
bash dev restart
```

## Instalando serviços do Playground

---

### Banco de Dados PostgreSQL

Utilizando o VSCode abra o arquivo docker-compose.yml;

Descomente o seguinte trecho:

```yml
nb-database:
    image: postgres
    container_name: nb-db-postgres
    restart: always
    environment:
        - POSTGRES_PASSWORD=nbdb
        - POSTGRES_DB=nbdb
    volumes:
        - ./nb-db-postgres:/var/lib/postgresql/data
    ports:
        - 5432:5432
    networks:
        - nb_network
```

No terminal, execute o seguinte comando:

```shell
bash dev restart
```

### Adminer

Utilizando o VSCode abra o arquivo docker-compose.yml;

Descomente o seguinte trecho:

```yml
nb-adminer:
    image: adminer
    container_name: nb-adminer
    restart: always
    ports:
        - 8080:8080
    networks:
        - nb_network
```

No terminal, execute o seguinte comando:

```shell
bash dev restart
```

#### Acessando o banco de dados via Adminer

- Abra o navegador e digite: localhost:8080
- Na tela de entrada do Adminer, preencha com as seguintes informações:
    - Sistema: PostgreSQL
    - Servidor: nb-database
    - Usuário: postgres
    - Senha: nbdb
    - Banco de dados: nbdb

### Metabase

Utilizando o VSCode abra o arquivo docker-compose.yml;

Descomente o seguinte trecho:

```yml
nb-metabase:
    image: metabase/metabase:latest
    container_name: nb-metabase
    hostname: nb-metabase
    volumes:
    - ./nb-metabase:/metabase.db
    ports:
      - 3000:3000
    networks:
      - nb_network
```

No terminal, execute o seguinte comando:

```shell
bash dev restart
```

#### Acessando o Metabase

- Abra o navegador e digite: localhost:3000

## Desinstalando Serviços do Playground

---

### Banco de Dados PostgreSQL

Utilizando o VSCode abra o arquivo docker-compose.yml;

Comente o seguinte trecho:

```yml
# nb-database:
#     image: postgres
#     container_name: nb-db-postgres
#     restart: always
#     environment:
#         - POSTGRES_PASSWORD=nbdb
#         - POSTGRES_DB=nbdb
#     volumes:
#         - ./nb-db-postgres:/var/lib/postgresql/data
#     ports:
#         - 5432:5432
#     networks:
#         - nb_network
```

No terminal, execute o seguinte comando:

```shell
bash dev restart
sudo rm -rf nb-db-postgres
```

### Adminer

Utilizando o VSCode abra o arquivo docker-compose.yml;

Comente o seguinte trecho:

```yml
# nb-adminer:
#     image: adminer
#     container_name: nb-adminer
#     restart: always
#     ports:
#         - 8080:8080
#     networks:
#         - nb_network
```

No terminal, execute o seguinte comando:

```shell
bash dev restart
```

### Metabase

Utilizando o VSCode abra o arquivo docker-compose.yml;

Comente o seguinte trecho:

```yml
# nb-metabase:
#     image: metabase/metabase:latest
#     container_name: nb-metabase
#     hostname: nb-metabase
#     volumes:
#     - ./nb-metabase:/metabase.db
#     ports:
#       - 3000:3000
#     networks:
#       - nb_network
```

No terminal, execute o seguinte comando:

```shell
bash dev restart
sudo rm -rf nb-metabase
```

## Documentações

---

No diretório .docs estão os demais documentos que podem conter informações, instruções e tutoriais extras sobre o projeto.

### Referências

O arquivo **/.docs/references.md** possui o link de acesso a documentação oficial de cada um dos recursos, serviços e bibliotecas utilizados no Playground.