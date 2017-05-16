FROM resin/rpi-raspbian

MAINTAINER Evan Salter <evanearlsalter@gmail.com>

RUN apt-get update && apt-get install -y \
   git \
   build-essential \
   autoconf \
   automake \
   libtool \
   libdaemon-dev \
   libasound2-dev \
   libpopt-dev \
   libconfig-dev \
   avahi-daemon \
   libavahi-client-dev \
   libssl-dev

RUN git clone https://github.com/mikebrady/shairport-sync.git
WORKDIR shairport-sync
RUN autoreconf -i -f
RUN ./configure --with-alsa --with-avahi --with-ssl=openssl --with-systemd --sysconfdir=/etc

RUN make
RUN make install

RUN sed -i 's/rlimit-nproc=3//' /etc/avahi/avahi-daemon.conf

COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh
