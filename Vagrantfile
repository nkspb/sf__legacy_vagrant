Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.box_version = "20220726.0.0"

    config.vm.define "psql84-vm" do |psql|
        psql.vm.hostname = "psql84-vm"
        psql.vm.network "private_network", ip: "192.168.0.10"

        psql.vm.provider :virtualbox do |vb|
            vb.name = "psql84-vm"
            vb.gui = false
            vb.memory = "1024"
        end
    end

    config.vm.provision "shell", inline: <<-SHELL
        apt update && apt -y upgrade
        wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
        sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
        apt update 
        DEBIAN_FRONTEND=noninteractive apt install -y ca-certificates postgresql-8.4
    SHELL

    config.vm.provision "shell", path: "create_psql_db.sh"
end