Vagrant.configure("2") do |config|
    config.vm.box = "debian/bullseye64"
    config.vm.define "debian12"
  
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
  
    config.vm.provision "shell", inline: <<-SHELL
     # Personnalisez votre machine Debian 12 ici
     # install git
     apt-get update
     apt-get install -y git
     # Ajoutez votre dépôt GitHub
     git remote add <https://github.com/lido936s/vagrant_debian12_master.git> /var/www/html
    SHELL
  end