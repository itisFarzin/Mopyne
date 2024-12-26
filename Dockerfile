FROM alpine:3.21

RUN apk update && apk upgrade

RUN apk add --no-cache \
    bash \
    git \
    mopidy \
    py3-pip \
    pulseaudio \
    yt-dlp

RUN pip install --upgrade --no-cache-dir --break-system-packages \
    Mopidy-MPD \
    Mopidy-Local \
    Mopidy-Iris \
    pysocks \
    ytmusicapi \
    git+https://github.com/itisFarzin/mopidy-youtube#egg=Mopidy-YouTube

RUN sed -i 's/_USE_SUDO = os\.environ\.get("IRIS_USE_SUDO", True)/_USE_SUDO = str(os.environ.get("IRIS_USE_SUDO", True)).lower() == "true"/' /usr/lib/python*/site-packages/mopidy_iris/system.py  # https://github.com/jaedb/Iris/pull/979

RUN touch /IS_CONTAINER

RUN mkdir -p /root/.config/mopidy 

RUN ln -s /root/.config/mopidy /config

RUN ln -s /var/lib/mopidy/media /tracks

COPY mopidy.conf /config

COPY pulse-client.conf /etc/pulse/client.conf

EXPOSE 6600 6680

ENV IRIS_USE_SUDO=false

STOPSIGNAL SIGQUIT
CMD ["mopidy"]
