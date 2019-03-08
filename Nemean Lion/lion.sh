#Install
apt-get install openssh-server -y

#Copy config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original-copy

#Replace port no.
sed -i '' 's/# Port 22/Port 3742/' /etc/ssh/sshd_config

#Restart service
service sshd 
