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

#Configure the prometheus server to use authentification:
#vi /etc/promtheus/prometheus.yml
#add
cat >> /etc/promtheus/prometheus.yml
basic_auth:
  username: prometheus
  password: <password>
  
  =========================================================================
  Generate the certificate and key


openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout node_exporter.key -out node_exporter.crt -subj "/C=US/ST=California/L=Oakland/O=MyOrg/CN=localhost" -addext "subjectAltName = DNS:localhost"



Move the crt and key file under /etc/node_exporter/ directory

mv node_exporter.crt node_exporter.key /etc/node_exporter/



Change ownership:


chown nodeusr.nodeusr /etc/node_exporter/node_exporter.key
chown nodeusr.nodeusr /etc/node_exporter/node_exporter.crt



Edit /etc/node_exporter/config.yml file:


vi /etc/node_exporter/config.yml



#Add below lines in this file:

tls_server_config:
  cert_file: node_exporter.crt
  key_file: node_exporter.key



Restart node exporter service:


systemctl restart node_exporter
exit



You can verify your changes using curl command:


curl -u prometheus:secret-password -k https://node01:9100/metrics
