#!/bin/bash
function uninstall {

echo "WARNING : This will remove homebrew and all applications installed through it"
echo -n "are you sure you want to do that? [y/n] : "
read confirmation

if [ $confirmation == "y" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    exit 0
else
  echo "keeping everything intact"
  exit 0
fi

}

if [ $1 == "uninstall" ]; then
    uninstall
fi

echo "====================="
echo "Setting up your MacOS"
echo "====================="

sudo easy_install pip
sudo pip install ansible

installdir = "/tmp/summon-$RANDOM"
mkdir $installdir

echo "========================="
echo "Ansible Playbook Progress"
echo "========================="

ansible-playbook -i ./hosts playbook.yml --verbose




ansible-galaxy install -r requirements.yml
