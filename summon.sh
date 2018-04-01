#!/bin/bash
function uninstall {

echo "WARNING : This will remove homebrew and all applications installed through it"
echo -n "are you sure you want to do that? [y/n] : "
read confirmation

if [ "$confirmation" == "y" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    exit 0
else
  echo "keeping everything intact"
  exit 0
fi

}

if [ "$1" == "uninstall" ]; then
    uninstall
fi

echo "====================="
echo "Setting up your MacOS"
echo "====================="

sudo easy_install pip
sudo pip install ansible

echo "========================"
echo "Clone Ansible Repository"
echo "========================"

installdir="/tmp/summon-$RANDOM"
mkdir $installdir

git clone https://github.com/Quynh-Nguyen/ansible-macos-developer.git $installdir
if [ ! -d $installdir ]; then
    echo "Failed to find Ansible MacOS for Developer."
    echo "git cloned failed"
    exit 1
else
    cd $installdir

    echo "========================="
    echo "Ansible Playbook Progress"
    echo "========================="

    ansible-playbook -i ./hosts playbook.yml --verbose
fi
