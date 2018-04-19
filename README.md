# WebUp
---
Example for familiarizing you with development tools for deploying a web server

### Requirements
1. Oracle VirtulBox https://www.virtualbox.org
1. Hashicorp Vagrant https://www.vagrantup.com/
1. Git https://git-scm.com/

### The resources that were used in the development:
---
1.  https://www.vagrantup.com/ - official site Vagrant
1. https://hub.docker.com/_/mysql/ - official repository MYSQL 
1. https://hub.docker.com/_/php/ - official reopsitory PHP
1. https://getcomposer.org/ - official documentations Composer for PHP
1. https://docs.docker.com/ - official documentations for Docker
---
# Usage
Development environment use current folder as source for application.

# Project structure
```
.
├── cont-conf.sh (small script to build docker image)
├── Dockerfile
├── mysql-root (credentials) *
├── provision-script.sh (script to build a project)
├── rmkr.sql(database table) **
└── Vagrantfile
```
To launch development environment use next command:

`$ vagrant up`

After launching virtual machine demo application will be accessible by url: http://localhost:8080


`* mysql-root` - contains user data and is filled by request...

`** table data` - supplied separately
