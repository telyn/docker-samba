FROM debian:stretch

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

RUN wget https://download.samba.org/pub/samba/rc/samba-4.8.0rc1.tar.gz && tar xf samba-4.8.0rc1.tar.gz


RUN cd samba-4.8.0rc1 && ./configure && make && make install
ENV PATH /usr/local/samba/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
