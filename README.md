# Containerized Mozilla Firefox - firefox-icedtea

## WHY ?
When you are SysAdmin and it comes to connecting to old unsupported management interfaces, often packed with Java technology it's propably broken with modern standards.

## Prepare ?
Only thing you need is configured docker and right permissions in your system for your user for docker.
If your user cannot run docker add your user to docker group in the system.

`# sudo usermod -aG docker $USER`

## Run it

```
# wget -O /usr/bin/firefox-icedtea https://raw.githubusercontent.com/avalitan/firefox-icedtea/master/firefox-icedtea
# chmod 755 /usr/bin/firefox-icedtea
# firefox-icedtea
```
