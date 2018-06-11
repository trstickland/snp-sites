#
#  From this base-image / starting-point
#
FROM debian:testing

#
#  Authorship
#
MAINTAINER ap13@sanger.ac.uk

#
# Pull in packages from testing
#
RUN apt-get update -qq

#
# Install SNP-sites

# install from debian repo
# RUN apt-get -y install snp-sites

# clone from githun & build from source
RUN apt-get -y install pkg-config
RUN apt-get -y install build-essential autoconf automake libtool zlib1g-dev check git libsnp-sites1

RUN mkdir -p $PREFIX/bin

RUN git clone https://github.com/sanger-pathogens/snp-sites.git

RUN cd snp-sites && \
    autoreconf -i -f && \
    ./configure && \
    make && \
    make check && \
    make install
    
    
RUN echo -n "\n\033[1;32mSuccessfully installed "; snp-sites -V; echo "\033[0m"
