# Testing environment for Yaml generator

#### REQUIREMENTS
* dnf/yum package manager-based (virtual) operating system, e.g. fedora, centos
* installed docker with engine version 19.00+
* user located in group wheel (for sudo purposes)

#### GETTING STARTED
Enter to testing root directory (with file docker-compose.yml and folder fedora_client and fedora_server) and run following commands to create necessary containers and start them:
* sudo docker-compose up --build 

Then open browser and type http://localhost/index.php to see deployed app using database.

After simulation you need to remove content of directory program/output/.

#### TROUBLESHOOTING
In case of issues, please quit docker-compose(1), restart docker daemon on host(2) and start docker-compose again(3) with following commands:
1. sudo docker-compose down
2. sudo systemctl restart docker
3. sudo docker-compose up --build
