#1: Indicar a imagem base de python

FROM python:3.6-alpine

#2: Copiar os arquivos de dependecia a nível da aplicação

COPY app/requirements.txt /tmp

#3: Instalar as dependencias
RUN pip install -r /tmp/requirements.txt

RUN mkdir /app

#5: Copiar aplicação para diretório específico 
COPY app/* /app/

#6: Mudar o diretório padrão 
WORKDIR /app

#7: Expor a porta 5000
EXPOSE 5000

#8: Processo a ser inicializado
CMD python app.py
