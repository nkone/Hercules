#Install
apt-get install openssh-server -y

#Replace port no.
sed -i 's/# Port 22/Port 3742/' /etc/ssh/sshd_config

#Restart service
service sshd restart
