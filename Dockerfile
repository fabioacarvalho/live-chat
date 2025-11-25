FROM python:3.12-alpine

WORKDIR /app

COPY . /app/

# Variáveis de ambiente para otimização
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBEFFERED=1

# Instalar dependências do sistema necessárias para o mysqlclient
RUN apk add --no-cache \
    mariadb-dev \
    build-base \
    libffi-dev \
    openssl-dev \
    pkgconfig

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN export FLASK_APP=api

EXPOSE 8000

# Define o comando para rodar a aplicação
CMD ["flask", "--app=app", "run", "--host=0.0.0.0", "--port=8000", "--reload"]