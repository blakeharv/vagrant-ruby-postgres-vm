# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "MyPreciseBox"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :hostonly, "192.168.5.10"
  
  # Set the share folder for your project.
  #
  # 'code' = Set the shared folder name in the VM.
  # '/home/vagrant/code' = Set the shared folder path in the VM.
  # '.' = Set the project folder you want to share on your local machine relative to the VM repo.
  #       I usually do '../path-to-my-project-repo' to keep my VM and project code separate.
  #
  # You can configure multiple shares like this. Great for working on local gem versions.
  #
  config.vm.share_folder('code', '/home/vagrant/code', '.', create: true, nfs: true)
  
  # Increases memory allocated for VM. Uncomment and modify memory and cpus
  #config.vm.customize ["modifyvm", :id, "--memory", 4096, "--cpus", 2]

  config.ssh.forward_agent = true

  # Forward ports for Rails (3000) and Postgres (5432)
  config.vm.forward_port 3000, 3000
  config.vm.forward_port 5432, 5432

  # Add additional ports as needed
  # Unicorn:
  # config.vm.forward_port 8080, 8080
  # Jasmine:
  # config.vm.forward_port 1337, 1337

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe('timezone')
    chef.add_recipe('zsh')
    chef.add_recipe('database')
    chef.add_recipe('postgresql')
    chef.json = {
      :postgresql => {
        :version  => "9.1",
        :password => { :postgres => "password"}
      }
    }
  end
end
