FROM fedora:latest

RUN dnf install -y make nano iputils
RUN dnf install -y openssh-clients git
RUN dnf install -y sudo procps tree
RUN dnf install -y python3 python3-pip
RUN dnf install -y ansible
RUN dnf install -y expect

RUN dnf install -y dnf-plugins-core
RUN dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
RUN dnf install -y docker-ce docker-ce-cli containerd.io
#RUN dnf install -y wget
#RUN dnf install -y grubby
#RUN grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
#RUN wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /usr/bin/systemctl
#RUN chmod +x /usr/bin/
#RUN ln -s /usr/bin/python3 /usr/bin/python
#RUN ls /usr/bin | grep python
#RUN sed 's/python/python3/g' /usr/bin/systemctl
#RUN /home/systemctl start docker

ADD requirements.txt /home/requirements.txt

RUN pip3 install --user --upgrade pip && \
    pip3 install --user --no-cache-dir -r /home/requirements.txt

RUN echo "root:password" | chpasswd
#RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
#RUN useradd ssh-user -G wheel
#RUN echo "ssh-user:password" | chpasswd

# ARG program_folder=/home/program

# ADD start.sh /home/start.sh
# ADD program ${program_folder}
# RUN mkdir --parents ${program_folder}/testing/
# RUN mkdir --parents ${program_folder}/testing_output/
# RUN cp -rf ${program_folder}/include/lamp_simple_centos8/ ${program_folder}/testing/

# ENTRYPOINT ["/home/start.sh"]

#CMD ["/usr/bin/ls", "-Al", "/root/program/"]
#CMD ["/usr/bin/tree", "/root/program/"]

ADD start.sh /home/start.sh

RUN mkdir /home/program/
WORKDIR /home/program/

RUN echo ahoj
RUN git clone https://github.com/mmatisko/yaml_generator.git .
#RUN git checkout 2cd7ba
#ADD add_hosts.yml /home/program/include/template/lamp_simple_centos8/add_hosts.yml

ENTRYPOINT ["/bin/bash"]
CMD ["/home/start.sh"]
