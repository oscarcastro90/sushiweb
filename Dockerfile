FROM ubuntu:22.04

# Evita preguntas interactivas
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar paquetes e instalar lo necesario
RUN apt update && \
    apt install -y telnet net-tools iproute2 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
