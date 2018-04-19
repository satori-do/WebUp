# WebUp

A task for familiarizing you with development tools for deploying a web server

# Requirements
Oracle VirtulBox https://www.virtualbox.org
Hashicorp Vagrant https://www.vagrantup.com/
Git https://git-scm.com/

# The resources that were used in the development:
https://www.vagrantup.com/ - official site Vagrant
https://hub.docker.com/_/mysql/ - official repository MYSQL
https://hub.docker.com/_/php/ - official reopsitory PHP
https://getcomposer.org/ - official documentations Composer for PHP
https://docs.docker.com/ - official documentations for Docker

# Usage
Development environment use current folder as source for application.

# Project structure
.
├── cont-conf.sh (small script to build docker image)
├── Dockerfile
├── mysql-root (credentials) *
├── provision-script.sh (script to build a project)
├── rmkr.sql(database table) **
└── Vagrantfile

To launch development environment use next command:

`$ vagrant up`

After launching virtual machine demo application will be accessible by url: http://localhost:8080


* mysql-root - contains user data and is filled by request...
** table data - supplied separately
