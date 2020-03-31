#!/bin/bash

echo "NOTE: Install nvidia-driver and cuda-toolkit manually before executing this script"
read -r -p "Did you complete driver and cuda-toolkit installation? (y/n) " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	sudo apt update

	# install pip and pip3
	sudo apt install -y python-pip
	sudo apt install -y python3-pip

	# adding pip aliases
	echo "" >> ~/.bashrc
	echo "#pip aliases" >> ~/.bashrc
	echo "alias pip='python -m pip'" >> ~/.bashrc
	echo "alias pip3='python3 -m pip'" >> ~/.bashrc

	source ~/.bashrc

	pip install --upgrade pip
	pip3 install --upgrade pip

	# install ipython and ipython3
	pip install ipython --user
	pip3 install ipython --user

	# install python required packages
	pip install numpy --user && pip3 install numpy --user
	pip install matplotlib --user && pip3 install matplotlib --user
	pip install pandas --user && pip3 install pandas --user
	pip install tqdm --user && pip3 install tqdm --user

	# ssh tools
	sudo apt install -y openssh-server
	sudo apt install -y tmux
	echo "" >> ~/.bashrc
	echo "#tmux aliases" >> ~/.bashrc
	echo "alias tn='tmux new -s'" >> ~/.bashrc
	echo "alias tl='tmux ls'" >> ~/.bashrc
	echo "alias ta='tmux attach-session'" >> ~/.bashrc
	echo "" >> ~/.bashrc

	# set up git prompt
	sudo apt install -y git
	cp .prompt ~/
    	echo "" >> ~/.bashrc
	echo "# git prompt" >> ~/.bashrc
    	echo "if [ -f ~/.prompt ] || [ -h ~/.prompt ]; then" >> ~/.bashrc
    	echo "  source ~/.prompt" >> ~/.bashrc
    	echo "fi" >> ~/.bashrc
	echo "alias adog='git log --all --decorate --oneline --graph'" >> ~/.bashrc
    	echo "" >> ~/.bashrc
	
	# set up PATH for cuda-10.1
	echo "" >> ~/.bashrc
	echo "# Setting up paths for cuda-10.1" >> ~/.bashrc
	echo "export PATH=/usr/local/cuda-10.1/bin:\$PATH" >> ~/.bashrc
	echo "export CUDADIR=/usr/local/cuda-10.1" >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc
	echo "" >> ~/.bashrc

	# install pytorch with cuda-10.1
	pip3 install torch torchvision --user
	
	#vim edior
	sudo apt install -y vim

        #sourcing ~/.bashrc for ssh
    	echo "# source ~/.bashrc for ssh automatically" >> ~/.bash_profile
    	echo "if [ -f ~/.bashrc ]; then" >> ~/.bash_profile
    	echo "    . ~/.bashrc"  >> ~/.bash_profile
    	echo "fi" >> ~/.bash_profile
    	echo "" >> ~/.bash_profile

    	# colors for ls
    	# echo "" >> ~/.bashrc
    	# echo "# colors for ls" >> ~/.bashrc
    	# echo "LS_COLORS=\$LS_COLORS:'di=0;35:' ; export LS_COLORS" >> ~/.bashrc
    	# echo "" >> ~/.bashrc

    	# nano settings
    	cp .nanorc ~/
    	echo "" >> ~/.bashrc
    	echo "# nano settings" >> ~/.bashrc
    	echo "alias nano='nano -c'" >> ~/.bashrc
    	echo "" >> ~/.bashrc

	# installing misc tools
	sudo apt install -y htop
	sudo apt install -y build-essential
	sudo apt install -y ack-grep

	source ~/.bashrc
else
	echo "re-run init_setup.sh script after completing driver and cuda tool kit installation"
fi
