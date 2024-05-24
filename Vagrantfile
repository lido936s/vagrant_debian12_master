Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.define "debian12"
  config.vm.network "private_network", ip: "192.168.40.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
    vb.name = "debian12"
    vb.customize ["modifyvm", :id, "--groups", "/Vagrant"]
  end

  config.vm.provision "shell", inline: <<-SHELL
  ssh-keygen -t rsa -b 4096
  scp ~/.ssh/id_rsa.pub lfrere@192.168.40.10:/home/utilisateur/.ssh/authorized_keys
  ssh -i ~/.ssh/id_rsa lfrere@192.168.40.10 << EOF
  cd
  mkdir -p .ssh
  cat /home/lfrere/.ssh/authorized_keys >> .ssh/authorized_keys
  cd
  rm -rf /var/www/html
  mkdir -p /var/www/html
  git push https://github.com/lido936s/vagrant_debian12_master.git 
  cd /var/www/html
  git pull https://github.com/lido936s/vagrant_debian12_master.git
  cd
  mkdir -p /etc/zabbix
  cp /var/www/html/zabbix.conf.php /etc/zabbix
  cp /var/www/html/mibs/* /var/lib/zabbix/mibs
  cp /var/www/html/zabbix_agentd.conf /etc/zabbix
  cp /var/www/html/zabbix_agent2.conf /etc/zabbix
  mkdir -m u=rwx,g=rwx,o= -p /var/lib/zabbix
  chown zabbix:zabbix /var/lib/zabbix
  EOF
   SHELL
end
