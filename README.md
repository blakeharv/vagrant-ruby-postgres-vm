Aweomse Ubuntu VM with Postgres 9.1, Ruby 2.0, and ZSH
======================================================

Don't mess around with wonky local development setups for Rails. Use a VM to streamline your workflow!

## Features
- Use Postgres for your local DB. Great for deploying to Heroku
- Sets you up with a fresh development database ready for Rails
- Sets up RVM, Bundler, and Ruby-2.0.0
- Configures zsh + vcprompt (displays git branch info) for a better console experience
- Use a shared folder to keep your codebase repo separate from the VM repo
- NFS folder sharing helps keep your tests fast
- Configuration options to speed up your VM

## Setup
1. Download Vagrant: http://www.vagrantup.com/
2. Download VirtualBox: https://www.virtualbox.org/wiki/Downloads
3. Install them!
4. Clone this Repo `$ git clone git@github.com:blakeharv/vagrant-ruby-postgres-vm.git`
5. From the cloned repo `$ vagrant up`
6. Log into the VM `$ vagrant ssh`

The default Postgres settings will configure 1 user and database. You can use the following settings in your Rails database.yml (See the customization settings below for configuring your databases and users)
```yml
development:
  adapter: postgresql
  encoding: latin1
  database: development
  pool: 5
  username: vagrant
  password: password
```


## Customization
The following places can be customized to fit your individual needs:  
- Add additional Ubuntu packages: [bootstrap.sh#L9](https://github.com/blakeharv/vagrant-ruby-postgres-vm/blob/master/bootstrap.sh#L9)
- Set your project folder: [Vagrantfile#L19](https://github.com/blakeharv/vagrant-ruby-postgres-vm/blob/master/Vagrantfile#L19)
- Add ports: [Vagrantfile#L30](https://github.com/blakeharv/vagrant-ruby-postgres-vm/blob/master/Vagrantfile#L30)
- Set your timezone: [/cookbooks/timezone/recipes/default.rb](https://github.com/blakeharv/vagrant-ruby-postgres-vm/blob/master/cookbooks/timezone/recipes/default.rb)
- Set your Postgres users and databases: [/cookbooks/postgresql/recipes/setup.rb#L20-L27](https://github.com/blakeharv/vagrant-ruby-postgres-vm/blob/master/cookbooks/postgresql/recipes/setup.rb#L20-L27)
- Speed up your VM: [Vagrantfile#L22](https://github.com/blakeharv/vagrant-ruby-postgres-vm/blob/master/Vagrantfile#L22)

## Credits / Inspiration
Vagrant Ruby-2.0 Box: [Richard Dong](https://github.com/richarddong) | https://github.com/richarddong/vagrant-ruby-rvm  
Chef & Cookbooks: [Opscode](https://github.com/opscode) | https://github.com/opscode-cookbooks/
