sudo apt-get install libeigen3-dev
sudo apt-get install libpcl1
sudo apt-get install libassimp-dev
sudo apt-get install libnoise-dev
sudo apt-get install libcgal-dev
sudo apt-get install gcc-multilib
sudo apt-get install libboost-all-dev
sudo apt-get install libwebp-dev

#conda remove libtiff

#Get the LD_LIBRARY_PATH
strindex() {
	x="{$1%%$2*}"
	[[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
}



path=$LD_LIBRARY_PATH
echo $path
SOURCE="conda"
SOURCEG="/usr/lib/x86_64-linux-gnu"

if echo "$path" | grep -q "$SOURCEG"; then
	echo "x86_64-linux-gnu is in LD_LIBRARY_PATH!"
	if echo "$path" | grep -q "$SOURCE"; then
		echo "Conda in library path found"

		pos_c="$path" | grep -b -o conda
		pos_g="$path" | grep -b -o /usr/lib/x86_64-linux-gnu

		if [ $pos_g -gt $pos_c ]; then
			echo "LD_LIBRARY_PATH is set up correct"
		        mkdir build
		        cd build
			cmake ..
			make -j8
    else
			echo "Please change LD_LIBRARY_PATH so, that the conda is at the ending of the path"
		fi
	else
		echo "conda not found in LD_LIBRARY_PATH. If you want to install it at some point, conda must be added at the end"
	fi
else
	echo "x86_64-linux-gnu is not in LD_LIBRARY_PATH!"
        if echo "$path" | grep -q "$SOURCE"; then
                echo "Conda in library path found"
		echo "please add usr/lib/x86_64-linux-gnu to your LD_LIBRARY_PATH before conda"
        else
                echo "conda not found in library path"
                echo "please add: /usr/lib/x86_64-linux-gnu to your LD_LIBRARY_PATH"
        fi
fi






