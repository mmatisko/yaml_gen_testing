#!/bin/bash
#systemctl start docker

cd ./program/
echo "Directory changed to $(pwd)"

# enable testing password script and production script run
chmod +x production_ans_gen.sh
chmod +x password_runner.sh

# change ansible target to docker containers
#echo -e "[webservers]\nweb_server\n[dbservers]\ndb_server\n[webservers:vars]\nansible_connection=docker\n[dbservers:vars]\nansible_connection=docker\n" > ./include/template/lamp_simple_centos8/hosts
echo -e "[webservers]\nweb_server\tansible_connection=docker\n[dbservers]\ndb_server\tansible_connection=docker\n" > ./include/template/lamp_simple_centos8/hosts
#cat ./include/template/lamp_simple_centos8/hosts

#ls -Al include/template/lamp_simple_centos8/

# run generator
echo "Generator start!"
./password_runner.sh '' ./production_ans_gen.sh -G -c include/generator_config.yml \
  -d include/template/lamp_simple_centos8/ -o output/
echo "Generator done!"

# move to folder with generated config
ls ./output/
cd ./output/*//0/
echo "Directory changed to $(pwd)"

# read target hosts file
cat ./hosts

# add task which add testing containers to hosts
#touch add_hosts.yml
#echo -e "- name: add webserver container to hosts\n  add_host: \n    name: web_server\n    ansible_connection: docker\n\n- name: add dbserver\ncontainer to hosts\n  add_host: \n     name: db_server\n     ansible_connection: docker\n\n- include: site.yml" > add_hosts.yml
ls -Al

# run ansible playbook
ansible-playbook -i hosts site.yml
#ansible-playbook add_hosts.yml
