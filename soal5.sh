awk '/cron/ || /CRON/ && !/sudo/ && !/SUDO/' /var/log/syslog | awk 'NF < 13' >> /home/vagrant/modul1/syslogno5.log
