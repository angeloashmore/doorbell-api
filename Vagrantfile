# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "doorbell-api" do |instance|
    instance.vm.hostname = "doorbell-api"

    instance.vm.network :private_network, ip: "172.16.16.16"
    instance.vm.network :forwarded_port, guest: 5000, host: 5000

    instance.ssh.forward_agent = true

    instance.vm.provision :ansible do |ansible|
      ansible.verbose = "vvvv"
      ansible.playbook = "playbook.yml"
      ansible.limit = "all"
    end
  end
end
