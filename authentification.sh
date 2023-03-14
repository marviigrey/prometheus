apt update
apt install apache2-utils -y

#Generate password hash:

htpasswd -nBC 10 "" | tr -d ':\n'; echo

#Finally, you will get a hashed value of your password.

#Edit /etc/node_exporter/config.yml file:


cat >> /etc/node_exporter/config.yml
basic_auth_users:
  prometheus: <hashed-password>
EOF  

systemctl restart node_exporter
