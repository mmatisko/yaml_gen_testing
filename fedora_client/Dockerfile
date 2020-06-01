FROM fedora:latest

RUN dnf install -y git
RUN dnf install -y python3 python3-pip
RUN dnf install -y ansible
RUN dnf install -y expect

RUN dnf install -y dnf-plugins-core
RUN dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
RUN dnf install -y docker-ce docker-ce-cli containerd.io
ADD requirements.txt /home/requirements.txt

RUN pip3 install --user --upgrade pip && \
    pip3 install --user --no-cache-dir -r /home/requirements.txt

RUN echo "root:password" | chpasswd

ADD start.sh /home/start.sh

RUN mkdir /home/program/
WORKDIR /home/program/

RUN git clone https://github.com/mmatisko/yaml_generator.git .

ENTRYPOINT ["/bin/bash"]
CMD ["/home/start.sh"]
