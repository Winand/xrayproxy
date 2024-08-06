# XTLS-Reality client in Docker

Xray client container for XTLS-Reality configurable via command line arguments.

Usage:
```bash
docker run -p 1080:1080 -p 1080:1080/udp -d --name xrayproxy xrayproxy "vless://client-id@domain.com:443?type=tcp&security=reality&pbk=(public-key)&fp=chrome&sni=domain.com&sid=(sid)&spx=%2F&flow=xtls-rprx-vision#config-name"
```

See also [samuelhbne/proxy-xray](https://github.com/samuelhbne/proxy-xray)
