# Building snp-sites from source

## Bioconda build

The bioconda build receipe can be found at https://github.com/bioconda/bioconda-recipes/tree/master/recipes/snp-sites

## Debian/Ubuntu build

The following build of snp-sites 2.4.0 was tested on Debian 9.3.0 'stretch' and Ununtu 16.04.4 LTS 'xenial'.

```bash
export PREFIX=/usr/local
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export CPATH=${PREFIX}/include

sudo apt-get install pkg-config
sudo apt-get install build-essential autoconf automake libtool zlib1g-dev check git libsnp-sites1
sudo mkdir -p $PREFIX/bin

git clone https://github.com/sanger-pathogens/snp-sites.git
cd snp-sites

autoreconf -i -f
./configure --prefix=$PREFIX
make
make check
sudo make install
```

Tim Stickland 2018-06-11
