sudo apt-get install libeigen3-dev
sudo apt-get install libpcl1
sudo apt-get install libassimp-dev
sudo apt-get install libnoise-dev
sudo apt-get install libcgal-dev
sudo apt-get install gcc-multilib
sudo apt-get install libboost-all-dev
sudo apt-get install libwebp-dev

#conda remove libtiff

mkdir build
cd build
cmake ..
make -j8
