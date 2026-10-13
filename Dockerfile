FROM alpine:latest
RUN apk add --no-cache curl unzip
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then XRAY_ARCH="64"; else XRAY_ARCH="arm64-v8a"; fi && \
    curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-$XRAY_ARCH.zip && \
    unzip xray.zip && rm xray.zip
COPY config.json /etc/xray/config.json
EXPOSE 8080
CMD ["./xray", "-config", "/etc/xray/config.json"]

