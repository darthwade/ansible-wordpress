#!/usr/bin/env bash

ANSIBLE_PROJECT=/vagrant/ansible

# Read args
for i in "$@"
do
case $i in
    -i=*|--inventory=*)
    INVENTORY="${i#*=}"
    ;;
    -p=*|--playbook=*)
    PLAYBOOK="${i#*=}"
    ;;
    -u=*|--user=*)
    REMOTE_USER="${i#*=}"
    ;;
    -c=*|--connection=*)
    CONNECTION="${i#*=}"
    ;;
    --default)
	# Set default args
    INVENTORY="stage"
    PLAYBOOK="site.yml"
    REMOTE_USER="vagrant"
    CONNECTION="local"
    ;;
    *)
    ;;
esac
done

# Show args
echo INVENTORY = ${INVENTORY}
echo PLAYBOOK = ${PLAYBOOK}
echo REMOTE_USER = ${REMOTE_USER}
echo CONNECTION = ${CONNECTION}

# Install ansible
apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update && apt-get -y upgrade
apt-get install -y ansible

# Install boto
# apt-get install -y python-boto

# Install ansible dependencies
sudo ansible-galaxy install -r $ANSIBLE_PROJECT/requirements.txt --force

# ssh-keygen -y -f $ANSIBLE_PROJECT/furfurpl.pem >> ~/.ssh/authorized_keys
# TODO: add fingerprint to known_hosts

# Run playbook
ansible-playbook -i $ANSIBLE_PROJECT/$INVENTORY -u $REMOTE_USER $ANSIBLE_PROJECT/$PLAYBOOK --connection=$CONNECTION --sudo -vvvv