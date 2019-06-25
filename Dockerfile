FROM debian:jessie
MAINTAINER Avalitan <docsup@avalitan.com>

ENV ff_version=45.9.0esr

COPY firefox.sh /opt/firefox.sh

RUN chmod 755 /opt/firefox.sh && apt-get update && apt-get install -y icedtea-7-plugin adwaita-icon-theme at-spi2-core colord colord-data dconf-gsettings-backend dconf-service glib-networking glib-networking-common glib-networking-services gsettings-desktop-schemas i965-va-driver init-system-helpers libatk-bridge2.0-0 libatspi2.0-0 libavcodec56 libavresample2 libavutil54 libcairo-gobject2 libcolord2 libcolorhug2 libcroco3 libdbus-glib-1-2 libdconf1 libexif12 libfile-copy-recursive-perl libgd3 libgphoto2-6 libgphoto2-l10n libgphoto2-port10 libgsm1 libgtk-3-0 libgtk-3-bin libgtk-3-common libgudev-1.0-0 libgusb2 libieee1284-3 libjson-glib-1.0-0 libjson-glib-1.0-common libltdl7 libmp3lame0 libopenjpeg5 libopus0 liborc-0.4-0 libpam-systemd libpolkit-agent-1-0 libpolkit-backend-1-0 libpolkit-gobject-1-0 libproxy1 librest-0.7-0 librsvg2-2 librsvg2-common libsane libsane-common libsane-extras libsane-extras-common libschroedinger-1.0-0 libsoup-gnome2.4-1 libsoup2.4-1 libspeex1 libstartup-notification0 libtheora0 libusb-1.0-0 libv4l-0 libv4lconvert0 libva1 libvdpau1 libvpx1 libwayland-client0 libwayland-cursor0 libx264-142 libxcb-util0 libxkbcommon0 libxpm4 libxt6 libxvidcore4 policykit-1 sane-utils update-inetd va-driver-all vdpau-va-driver xkb-data bzip2 wget && apt-get clean && rm -rf /var/lig/apt/lists/* && cd /opt/ && wget -nv -O /opt/firefox-${ff_version}.tar.bz2 https://ftp.mozilla.org/pub/firefox/releases/${ff_version}/linux-$(uname -m)/en-GB/firefox-${ff_version}.tar.bz2 && tar -xjf /opt/firefox-${ff_version}.tar.bz2 && rm /opt/firefox-${ff_version}.tar.bz2 && useradd -u 1000 -ms /bin/bash firefox

USER firefox

WORKDIR /home/firefox

RUN mkdir -p /home/firefox/.config/icedtea-web/ && echo "deployment.security.level=ALLOW_UNSIGNED\ndeployment.security.sandbox.awtwarningwindow=false\ndeployment.manifest.attributes.check=NONE" > /home/firefox/.config/icedtea-web/deployment.properties && echo "alias firefox='/opt/firefox/firefox --no-remote'" >> /home/firefox/.bash_aliases

ENV DISPLAY=":0"

ENTRYPOINT /opt/firefox.sh
CMD ["firefox"]
