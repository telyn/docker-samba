FROM debian:stretch

ENV SMBVERSION=4.8.0rc1
ENV PATH=/usr/local/samba/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get -y update && apt-get -y install \
    build-essential \
    wget \
    python-dev \
    libavahi-glib-dev \
    gnutls-dev \
    pkg-config \
    docbook-xsl \
    libacl1-dev \
    libldap2-dev \
    libpam0g-dev 

RUN wget https://download.samba.org/pub/samba/rc/samba-$VERSION.tar.gz \
 && tar xf samba-$VERSION.tar.gz \
 && cd samba-$VERSION \
 && ./configure \
 && make \
 && make install \
 && cd .. \
 && rm -rf samba-$VERSION
