 sudo useradd --no-create-home --shell /bin/false prometheus
     sudo mkdir /etc/prometheus
     sudo mkdir /var/lib/prometheus
     sudo chown prometheus:prometheus /etc/prometheus
     sudo chown prometheus:prometheus /var/lib/prometheus
      sudo cp prometheus /usr/local/bin
      sudo cp promtool /usr/local/bin
      sudo chown prometheus:prometheus /usr/local/bin/prometheus
      sudo chown prometheus:prometheus /usr/local/bin/promtool
     sudo cp -r consoles /etc/prometheus
     sudo cp -r consoles_libraries /etc/prometheus
     sudo cp -r console_libraries /etc/prometheus
     sudo chown -R prometheus:prometheus /etc/prometheus/consoles
     sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
     cp prometheus.yml /etc/prometheus/prometheus.yml
     sudo cp prometheus.yml /etc/prometheus/prometheus.yml
     sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
