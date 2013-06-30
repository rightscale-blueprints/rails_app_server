Vagrant::Config.run do |config|

  # name of vagrant box
  config.vm.box = 'rails_app_server'

  # chef version
  chef_version = '10.26.0'
  
  # unicorn host
  config.vm.forward_port 8080, 8080
  
  # httpd host
  config.vm.forward_port 80, 8081

  # workaround to make unicorn in path
  config.vm.provision :shell, :inline => 'ln -fsv /opt/vagrant_ruby/bin/unicorn /usr/bin/unicorn'
  
  # upgrade system chef to desired version (if needed)
  config.vm.provision :shell, :inline => "gem list | grep -e #{chef_version}.*chef -e chef.*#{chef_version} || gem install chef -v #{chef_version} --no-rdoc --no-ri"
  
  # chef-solo provisioning
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.json.merge!(JSON.parse(File.read('node.json')))
    chef.run_list = JSON.parse(File.read('node.json'))['run_list']
    #chef.run_list = []
    chef.log_level = :debug
  end

end