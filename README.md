# ansible-kubernetes

# kubernete cluster deployment on 3 hosts 


* At high level, deployment has following steps -
Install the kubernetes master on one host
Install the kubernete slaves on two hosts

# ASSUMPTIONS/PREREQUISITIES
 * This scirpt assumes ubuntu server version 16.05.
 * All servers are configured with NTP or atleast with correct Date and Time
 * No PreInstalled package or application onto the servers
 * Expects passwordless sudo
 * Requires Ansible 1.3
 
# USER ACTION REQUIRED 
1. Update the datetime if ntp server is not configured
#date -s '2018-11-22 15:42:00'

2. Edit file /etc/ansible/ansible.cfg for correct path of inventory file
#inventory      = /etc/ansible/hosts
inventory = /root/ansible-kubernetes

3. Edit the /etc/hosts file to add static entry for ip to hostname mapping that are not resolving by DNS
192.168.10.10   clusterVM1.xyz.com clusterVM1
127.0.0.1       localhost

4. To facilitates automated, passwordless logins and single sign-on using the SSH protocol, execute below commands fror each host
ssh-copy-id userid@clusterVM1

5. To run excute below cli
ansible-playbook -i inventory site.yml

6. For debug purpose use a tag for a particular role as below
ansible-playbook -vvvvvv  -i inventory site.yml --limit @/root/ansible-kubernetes/site.retry --tag kubeadm

