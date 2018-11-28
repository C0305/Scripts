#!/bin/bash

##################################################################################
# Author: Ernesto Cobos   <c0305@cobos.xyz>                                      #
# Description: automated lando vm deploy                                         #
#                                                                                #
# Licence MIT                                                                    #
#                                                                                #
# Copyright (c) 2018 Ernesto cobos <c0305@cobos.xyz>                             #
#                                                                                #
# Permission is hereby granted, free of charge, to any person obtaining a copy   #
# of this software and associated documentation files (the "Software"), to deal  #
# in the Software without restriction, including without limitation the rights   #
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      #
# copies of the Software, and to permit persons to whom the Software is          #
# furnished to do so, subject to the following conditions:                       #
#                                                                                #
# The above copyright notice and this permission notice shall be included in all #
# copies or substantial portions of the Software.                                #
#                                                                                #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  #
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  #
# SOFTWARE.                                                                      #
##################################################################################

read -rsp $'Esta iniciando el script landoAtomatedInstall, presione cualquier tecla ...\n' -n1 key
cd
sudo apt update 
sudo apt -y upgrade 
sudo apt -y install build-essential dkms linux-headers-$(uname -r)
mkdir cdrom
read -rsp $'Ingrese el cd VBoxGuestAdditions y despues presione cualquier tecla ...\n' -n1 key
mount /dev/cdrom cdrom
cd cdrom
sudo ./VBoxLinuxAdditions.run 
sudo apt update
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt -y install docker-ce
cd
wget https://github.com/lando/lando/releases/download/v3.0.0-beta.46/lando-v3.0.0-beta.46.deb
sudo dpkg -i lando-v3.0.0-beta.46.deb
sudo apt -y -f install 
