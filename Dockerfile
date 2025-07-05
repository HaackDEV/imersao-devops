# Define a imagem base como Python 3.14.0b3 (beta) com Alpine Linux 3.22.
# Alpine Linux é uma distribuição leve, resultando em imagens menores.
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho.
COPY requirements.txt .
# Instala as dependências do projeto.
# A opção --no-cache-dir evita o armazenamento de cache, reduzindo o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código do projeto para o diretório de trabalho.
COPY . .

# Exporta a porta 8000 para rodar a fast API.
EXPOSE 8000

# Define o comando a ser executado quando o contêiner for iniciado.
# Utiliza Uvicorn para servir a aplicação FastAPI.
# O app:app indica o módulo e objeto da aplicação.
# --host 0.0.0.0 permite acesso externo ao contêiner.
# --port ${PORT:-8000} define a porta em que a aplicação escuta, lendo da variável de ambiente PORT.
CMD ["sh", "-c", "uvicorn app:app --host 0.0.0.0 --port ${PORT:-8000}"]
