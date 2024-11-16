sudo dpkg --add-architecture arm64
apt update
apt install vim sudo -y
apt install apt-transport-https ca-certificates
apt install flex:armhf -y
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu cmake meson git wget -y
sudo apt install python3 python3-yaml python3-mako -y
sudo apt install libzstd-dev:armhf libdrm-dev:armhf libudev-dev:armhf libelf-dev:armhf valgrind:armhf bison:armhf byacc:armhf libreadline-dev:armhf libedit-dev:armhf -y

cd ~
echo '[binaries]
c = 'arm-linux-gnueabihf-gcc'
cpp = 'arm-linux-gnueabihf-g++'
ar = 'arm-linux-gnueabihf-ar'
strip = 'arm-linux-gnueabihf-strip'
pkgconfig = 'arm-linux-gnueabihf-pkg-config'
[host_machine]
system = 'linux'
cpu_family = 'arm'
cpu = 'arm'
endian = 'little''>>cross_file_armhf.txt

git clone https://gitlab.freedesktop.org/mesa/mesa.git
cd mesa
meson b32 --cross-file=~/cross_file_armhf.txt -Dgallium-drivers=freedreno,zink,virgl,d3d12,softpipe  -Dvulkan-drivers=freedreno -Dgallium-nine=false -Dfreedreno-kmds=kgsl,msm -Dglx=dri -Dxlib-lease=enabled -Dplatforms=x11,wayland -Dvulkan-beta=true -Dvideo-codecs=all -Dglx-direct=true -Dtools=drm-shim,freedreno -Dopengl=true -Dosmesa=true -Dgles1=enabled -Dgles2=enabled -Degl-native-platform=x11 -Degl=enabled -Dpower8=enabled -Dgallium-d3d12-video=enabled -Dgallium-d3d12-graphics=enabled  -Dxmlconfig=enabled -Dgbm=enabled --prefix=/opt/mesa
