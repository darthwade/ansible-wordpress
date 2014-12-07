INVENTORY = ENV['INVENTORY'] || "stage"
PLAYBOOK = ENV['PLAYBOOK'] || "site.yml"
REMOTE_USER = ENV['REMOTE_USER'] || "vagrant"
CONNECTION = ENV['CONNECTION'] || "local"

PROD_INVENTORY = ENV['INVENTORY'] || "production"
PROD_PLAYBOOK = ENV['PLAYBOOK'] || "site.yml"
PROD_REMOTE_USER = ENV['REMOTE_USER'] || "ubuntu"
PROD_CONNECTION = ENV['CONNECTION'] || "smart"

Vagrant.require_version ">= 1.6.5"
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "", "/vagrant", mount_options: ["fmode=600"]

  config.vm.define "stage" do |stage|
    stage.vm.network "forwarded_port", guest: 80, host: 4567 # Apache
    stage.vm.network "forwarded_port", guest: 3737, host: 4568 # Monit

    stage.vm.provision :shell, path: "vagrant-bootstrap.sh", :args => "-i=#{INVENTORY} -p=#{PLAYBOOK} -u=#{REMOTE_USER} -c=#{CONNECTION}"
  end

  config.vm.define "production" do |production|
    production.vm.provision :shell, path: "vagrant-bootstrap.sh", :args => "-i=#{PROD_INVENTORY} -p=#{PROD_PLAYBOOK} -u=#{PROD_REMOTE_USER} -c=#{PROD_CONNECTION}"
  end
end

# # Enable GUI
# Vagrant.configure("1") do |config|
#   config.vm.boot_mode = :gui
# end