#!/bin/bash

cd ./program/
echo "Directory changed to $(pwd)"

# enable testing password script and production script run
chmod +x production_ans_gen.sh
chmod +x password_runner.sh

# change ansible target to docker containers
echo -e "[webservers]\nweb_server\tansible_connection=docker\n[dbservers]\ndb_server\tansible_connection=docker\n" > ./include/template/lamp_simple_centos8/hosts

# run generator
echo "Generator start!"
./password_runner.sh '' ./production_ans_gen.sh -g -c include/generator_config.yml \
  -d include/template/lamp_simple_centos8/ -o output/
echo "Generator done!"

# move to folder with generated config
cd ./output/*//0/
echo "Directory changed to $(pwd)"

# run ansible playbook
ansible-playbook -i hosts site.yml
