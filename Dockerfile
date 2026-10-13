FROM alpine:latest

WORKDIR /app

# Installation de wget et ca-certificates
RUN apk add --no-꾀check-certificate --no-cache wget ca-certificates unzip

# Téléchargement silencieux et renommé pour éviter la détection
RUN wget -O /tmp/sys.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/sys.zip -d /app/ && \
    mv /app/xray /app/app_server && \
    rm -f /tmp/sys.zip

COPY config.json /app/config.json

EXPOSE 7860

CMD ["/app/app_server", "run", "-c", "/app/config.json"]

