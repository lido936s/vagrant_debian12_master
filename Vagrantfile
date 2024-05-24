Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.define "debian12"
  config.vm.network "private_network", ip: "private address"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
    vb.name = "debian12"
    vb.customize ["modifyvm", :id, "--groups", "/Vagrant"]
  end

  config.vm.provision "shell", inline: <<-SHELL
  ssh-keygen -t rsa -b 4096
  scp ~/.ssh/id_rsa.pub username@private adress:/home/utilisateur/.ssh/authorized_keys
  ssh -i ~/.ssh/id_rsa username@private address << EOF
  # Configure SSH
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

    # Restart SSH service
    service ssh restart
   SHELL
end
