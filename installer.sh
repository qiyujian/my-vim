# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# clang and gcc gcc-c++
sudo yum install gcc gcc-c++
sudo yum install clang

# cmake
wget https://cmake.org/files/v3.12/cmake-3.12.2.tar.gz
tar -xzvf cmake-3.12.2.tar.gz
cd cmake-3.12.2.tar.gz
./bootstrap
make
make install
cd ~

# git
sudo yum install git

# python-devel
sudo yum install python-devel

# python36 and virtualenv
sudo yum install python36
sudo yum install python36-devel
sudo yum install python36-setuptools
sudo easy_install pip
sudo pip install virtualenv
# add /usr/local/bin to /etc/sudoers
# Defaults secure_path = /sbin:/usr/sbin:/usr/bin:/usr/local/bin
mkdir venv
cd venv
virtualenv .
cd ~

# vim
sudo yum install ncurses-devel
git clone https://github.com/vim/vim.git
cd vim/src
# if you build Vim before
# make distclean
make
sudo make install
cd ~

# ycm
git clone https://github.com/Valloric/YouCompleteMe.git
mkdir -p .vim/bundle
cp YouCompleteMe .vim/bundle
cd ~ && mkdir ycm_build && cd ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=on . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core



