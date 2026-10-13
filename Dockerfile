FROM alpine:latest

WORKDIR /app

# Installation de wget, ca-certificates et unzip
RUN apk add --no-cache wget ca-certificates unzip

# Téléchargement de Xray et renommage pour le camouflage
RUN wget --no-check-certificate -O /tmp/sys.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/sys.zip -d /app/ && \
    mv /app/xray /app/app_server && \
    rm -f /tmp/sys.zip

COPY config.json /app/config.json

EXPOSE 7860

CMD ["/app/app_server", "run", "-c", "/app/config.json"]
