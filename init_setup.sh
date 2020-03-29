#!/bin/bash

echo "NOTE: Install nvidia-driver and cuda-toolkit manually before executing this script"
read -r -p "Did you complete driver and cuda-toolkit installation? (y/n) " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	sudo apt update

	# install pip and pip3
	sudo apt python-pip
	sudo apt python3-pip

	pip install --upgrade pip

	# adding pip aliases
	echo "" >> ~/.bashrc
	echo "#pip aliases" >> ~/.bashrc
	echo "alias pip='python -m pip'" >> ~/.bashrc
	echo "alias pip3='python3 -m pip'" >> ~/.bashrc

	# install ipython and ipython3
	pip install ipython --user
	pip3 install ipython --user

	# install python required packages
	pip install numpy --user && pip3 install numpy --user
	pip install matplotlib --user && pip3 install matplotlib --user
	pip install pandas --user && pip3 install pandas --user
	pip install tqdm --user && pip3 install tqdm --user
	pip install tqdm --user && pip3 install tqdm --user

	# ssh tools
	sudo apt install tmux
	echo "" >> ~/.bashrc
	echo "#tmux aliases" >> ~/.bashrc
	echo "alias tn='tmux new -s'" >> ~/.bashrc
	echo "alias tl='tmux ls'" >> ~/.bashrc
	echo "alias ta='tmux attach-session'" >> ~/.bashrc
	echo "" >> ~/.bashrc

	# set up git prompt
	cp .gitpromp.sh ~/
	echo "# git prompt" >> ~/.bashrc
	echo "source .gitprompt.sh" >> ~/.bashrc
	
	# set up PATH for cuda-10.1
	echo "" >> ~/.bashrc
	echo "# Setting up paths for cuda-10.1" >> ~/.bashrc
	echo "export PATH=/usr/local/cuda-10.1/bin:\$PATH" >> ~/.bashrc
	echo "export CUDADIR=/usr/local/cuda-10.1" >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc
	echo "" >> ~/.bashrc

	# install pytorch
	pip3 install torch torchvision --user
	


	source ~/.bashrc
else
	echo "re-run init_setup.sh script after completing driver and cuda tool kit installation"
fi
