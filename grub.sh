#!/bin/zsh

GRUB_NAME=grub-2.06
GRUB_TARBALL=$GRUB_NAME.tar.xz
GRUB_URL=https://ftp.gnu.org/gnu/grub/$GRUB_TARBALL
GRUB_DIR=~/goinfre/grub

if [ -d $GRUB_DIR/bin ]
then
	echo "grub already installed!"
	exit 0
fi

set  -e
cd ~/goinfre

curl $GRUB_URL --output $GRUB_TARBLL
tar -xvf $GRUB_TARBALL

cd $GRUB_NAME

mkdir -pv build && cd build
mkdir -pv $GRUB_DIR

../configure --disable-werror TARGET_CC=i686-elf-gcc TARGET_OBJCOPY=i686-elf-objcopy \
TARGET_STRIP=i686-elf-strip TARGET_NM=i686-elf-nm TARGET_RANLIB=i686-elf-ranlib --target=i686-elf --prefix $GRUB_DIR

make
make install

rm -r ~/goinfre/$GRUB_NAME ~/goinfre/$GRUB_TARBALL 

set +e
