sudo dpkg --add-architecture arm64
apt update
apt install vim sudo -y
apt install apt-transport-https ca-certificates
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu cmake:arm64 meson:arm64 git wget
sudo apt install python3:arm64 python3-yaml:arm64 python3-mako:arm64

export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++
export PKG_CONFIG_PATH=/usr/aarch64-linux-gnu/lib/pkgconfig
export PKG_CONFIG_LIBDIR=/usr/aarch64-linux-gnu/lib/pkgconfig
export CROSS_COMPILE=aarch64-linux-gnu-
export ARCH=arm64

cd ~
git clone https://gitlab.freedesktop.org/mesa/mesa.git
cd mesa
