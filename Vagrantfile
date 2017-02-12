# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu1404/puppet"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path    = "puppet/manifests"
    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "site.pp"
  end

  config.vm.define :pgsql1 do |pgsql1_config|
    pgsql1_config.vm.hostname = "pgsql-1.local"
    pgsql1_config.vm.network :private_network, ip: "192.168.33.101"
  end

  config.vm.define :barman do |barman_config|
    barman_config.vm.hostname = "barman.local"
    barman_config.vm.network :private_network, ip: "192.168.33.102"

  end

end
