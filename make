#!/bin/bash
# This script will compile a .gba, .map, and .elf from the master branch of the
# project. It is the script used to compile nightlies as well.

# Make sure you have apt installed for this. If you're using Arch or msys2 with pacman,
# see makerom_pacman.

# If using openSUSE, suse Enterprise Linux, Fedora, or RHEL, please stop. I'm not going to help you. Just use Mint or Arch.

# This command updates and upgrades all installed packages as a precaution.
sudo apt update && sudo apt upgrade -y # if this fails, try replacing "apt" with "apt-get".
# This command installs required dependencies
sudo apt install git binutils-arm-none-eabi libpng-dev build-essential -y # again, if this fails, run the command with "apt-get" instead of "apt".
# This command clones repositories
git clone git://github.com/pret/agbcc.git
git clone git://github.com/Rebirth-Devs/tumbledemerald.git
# This command sets up agbcc, our C compiler.
cd agbcc
./build.sh
./install.sh ../tumbledemerald
# This command finally compiles our .gba, .map, and .elf files, after changing directory back to our game code.
cd ../tumbledemerald
make