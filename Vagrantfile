Vagrant.configure("2") do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "1024"]
  end

#  if ENV["OS"].to_s.include? "Windows" then
#    nfsd = false
#  else
#    nfsd = true
#  end

   config.vm.network "private_network", ip: "33.33.33.33"
   config.vm.network "forwarded_port", guest: 80, host: 80
#    config.vm.forward_port 8080, 8080
#    config.vm.forward_port 3306, 3306
#    config.vm.forward_port 5432, 5432
    config.vm.synced_folder ".", "/vagrant" #, nfs: true
#    config.vm.synced_folder "./public/www", "/srv/dev_dev/current/public" #, nfs: true

   config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks", "environments", "applications", "roles"]
    #chef.roles_path = "roleis"
    #chef.data_bags_path = "data_bags"
    chef.log_level = :debug # :info
    # install make & mc, apt
    #chef.add_recipe "platform_packages::data_bag"
    #chef.add_recipe "apt"
    # lamp/nginx & drupal
    chef.add_recipe "env_development"
    #chef.json.merge!({
    #    :doc_root => '/vagrant/public',
  	#  })
  end
end

