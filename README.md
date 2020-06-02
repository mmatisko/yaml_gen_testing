# Testing environment for Yaml generator

Developed & tested with Fedora 31 & ansible 2.9.x & docker 19.03.x.

#### REQUIREMENTS
* dnf/yum package manager-based (virtual) operating system, e.g. fedora, centos
* installed docker with engine version 19.00+
* installed docker-compose
* user located in group wheel (for sudo purposes)

#### BEFORE STARTED
Docker supports only cgroup v1 for now, so we need to revert default version 2 with following commands:
```
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
reboot
```

#### GETTING STARTED
Enter to testing root directory (with file docker-compose.yml and folder fedora_client and fedora_server) and run following commands to create necessary containers and start them:
```
sudo docker-compose up --build 
```

Then open browser and type http://localhost/index.php to see deployed app using database.

After simulation you have to remove content of directory program/output/.

#### TROUBLESHOOTING
In case of issues, please quit docker-compose(1), restart docker daemon on host(2) and start docker-compose again(3) with following commands:
```
sudo docker-compose down  
sudo systemctl restart docker 
sudo docker-compose up --build  
```
