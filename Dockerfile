FROM ubuntu:16.04

#RUN apt-get update \
#    && apt-get -qq --no-install-recommends install \
#        libmicrohttpd10 \
#        libssl1.0.0 \
#    && rm -r /var/lib/apt/lists/*

WORKDIR /usr/local/src
ADD . /usr/local/src/

RUN apt-get -qq update 

RUN apt-get -qq install git-core \
	binutils-dev libldns1 libldns-dev \
	libpcap-dev libdbi-perl libdbd-mysql-perl \
	libdatetime-format-mysql-perl iftop sysstat \
	unzip autoconf make libdate-simple-perl gcc

RUN rm -r /var/lib/apt/lists/*  

RUN cd /usr/local/src/passivedns/ \
&& autoreconf --install \
&& ./configure \
&& make \
&& make install

ENTRYPOINT ["top", "-b"]]
