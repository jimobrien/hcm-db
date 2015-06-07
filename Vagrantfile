VAGRANTFILE_API_VERSION = "2"

domain = "hcm.ly"

settings = {
  :hostname => "hcmdb",
  :box => "ubuntu/trusty64",
  :ip => "192.168.50.18"
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = settings[:box]
  config.vm.host_name = "#{settings[:hostname]}.#{domain}"
  config.vm.box = "#{settings[:box]}"
  config.vm.network :forwarded_port, guest: 5432, host: 15432
  config.vm.network "private_network", ip: settings[:ip]

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.options = '--verbose --trace'
  end

end
