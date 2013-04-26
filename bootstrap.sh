#!/usr/bin/env bash

sed -ie 's/us\.archive\.ubuntu\.com/mirror\.bit\.edu\.cn/' /etc/apt/sources.list
sed -ie 's/security\.ubuntu\.com/mirror\.bit\.edu\.cn/' /etc/apt/sources.list

aptitude update
# aptitude upgrade -y
# find packages here: http://packages.ubuntu.com/
aptitude install -y bash curl git git-core openssl build-essential zip sqlite3 vim libtool libxml2-dev libyaml-dev libsqlite3-dev libxslt-dev libffi-dev libgdbm-dev libncurses5-dev libpq-dev autoconf automake bison pkg-config

su -c 'bash /vagrant/bootstrap-vagrant.sh' vagrant