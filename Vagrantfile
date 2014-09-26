# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.puppet_install.puppet_version = :latest

  hostname = 'agilevale'

  config.vm.box = 'trusty64'
  config.vm.host_name = hostname + '.jzon.me'
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      'modifyvm', :id,
      '--name', hostname,
      '--memory', '2048'
    ]
  end

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/jzon'
    override.ssh.username = 'vagrant'

    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    override.vm.hostname = hostname

    provider.token = '09226d312d7d52bf91190156004a2fcb00b1699788df51b17d083ca63be40f33'
    provider.image = 'Ubuntu 14.04 x64'
    provider.region = 'nyc2'
    provider.size = '512mb'
    provider.setup = 'true'
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'puppet/modules'
    puppet.options = "--hiera_config /vagrant/hiera.yaml --manifestdir /vagrant/puppet/manifests --modulepath /vagrant/puppet/modules"
  end

end
