# Building snp-sites from source

## Bioconda build

The bioconda build receipe can be found at https://github.com/bioconda/bioconda-recipes/tree/master/recipes/snp-sites

## Debian/Ubuntu build

The following build of snp-sites 2.4.0 was tested on Debian 8.10.0 'jessie' and 9.3.0 'stretch', and Ununtu 16.04.4 LTS 'xenial'.

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

## Vagrant boxes

The 'Vagrantfile' provides bare Debian jessie and Ubuntu xenial boxes to test building.  Use `vagrant up ubuntu && vagarnt ssh ubuntu` or `vagrant up debian && vagrant ssh debian` to access either Ununto or the Debian box, respctively.  (Suggest not doing `vagrant up`, as it will start both, not useful in this context.)

Tim Stickland 2018-06-12
