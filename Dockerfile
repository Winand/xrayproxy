FROM alpine:3.20
ARG XRAY_VER='1.8.23'

RUN apk add --no-cache trurl jq envsubst && \
    wget https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VER}/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip xray && \
    mv xray /usr/local/bin/ && \
    chmod +x /usr/local/bin/xray && \
    rm Xray-linux-64.zip

ADD config_template.json /config_template.json
ADD start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
