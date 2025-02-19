# Use uma imagem base oficial do Python
FROM python:3.12-slim

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instale as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante do código da aplicação para o diretório de trabalho
COPY . .

# Exponha a porta em que a aplicação Flask irá rodar
EXPOSE 5000

# Defina a variável de ambiente para indicar que a aplicação está em produção
ENV FLASK_ENV=production

# Comando para rodar a aplicação
CMD ["flask", "run", "--host=0.0.0.0"]