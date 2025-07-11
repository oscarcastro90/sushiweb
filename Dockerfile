FROM ubuntu:22.04

# Evita preguntas interactivas
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar paquetes e instalar lo necesario
RUN apt update && \
    apt install -y apache2 telnet net-tools iproute2 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Copiar el sitio web
COPY website/ /var/www/html

# Personalizar el archivo index.html
RUN ARCH=$(uname -m) && \
    sed "s/_ARCHITECTURE_/$ARCH/" /var/www/html/index_template.html > /var/www/html/index.html

# Exponer el puerto HTTP
EXPOSE 80

# Iniciar Apache en primer plano
CMD ["apachectl", "-D", "FOREGROUND"]
