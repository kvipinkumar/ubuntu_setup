#!/bin/sh

# sudo su root

sudo apt update

# install pip and pip3
sudo apt python-pip
sudo apt python3-pip

pip install --upgrade pip

# adding pip aliases
echo "" >> ~/.bashrc
echo "#pip aliases" >> ~/.bashrc
echo "alias pip = \'python -m pip\'" >> ~/.bashrc
echo "alias pip3 = \'python3 -m pip\'" >> ~/.bashrc

# install ipython and ipython3
pip install ipython --user
pip3 install ipython --user

# install python required packages
pip install numpy --user && pip3 install numpy --user
pip install matplotlib --user && pip3 install matplotlib --user
pip install pandas --user && pip3 install pandas --user
pip install tqdm --user && pip3 install tqdm --user
pip install tqdm --user && pip3 install tqdm --user


# install cuda tool kit
# sudo apt install -y nvidia-cuda-toolkit

# ssh tools
sudo apt install tmux
echo "" >> ~/.bashrc
echo "#tmux aliases" >> ~/.bashrc
echo "alias tn = \'tmux new -s\'" >> ~/.bashrc
echo "alias tl = \'tmux ls\'" >> ~/.bashrc
echo "alias ta = \'tmux attach-session\'" >> ~/.bashrc

# set up git prompt
cp .gitpromp.sh ~/
echo "# git prompt" >> ~/.bashrc
echo "source .gitprompt.sh" >> ~/.bashrc
