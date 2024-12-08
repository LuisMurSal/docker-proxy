# Usar python
FROM python:3.10-slim

# Instala Nginx y dependencias necesarias
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Crea un usuario no root para mayor seguridad
RUN useradd -ms /bin/bash flaskuser

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos del proyecto
COPY ./flask_app /app
COPY ./requirements.txt /app

# Dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia la configuración de Nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# puertos 80 (Nginx) y 5000 (Flask)
EXPOSE 80 5000

# iniciar Nginx y Flask
CMD service nginx start && su flaskuser -c "python app.py"
