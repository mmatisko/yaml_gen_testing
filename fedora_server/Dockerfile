FROM fedora:latest

RUN dnf install -y make nano iputils
#RUN dnf install -y openssh-server
RUN dnf install -y supervisor
RUN dnf install -y sudo procps
RUN dnf install -y iptables firewalld 
RUN dnf install -y iproute
RUN dnf clean all -y
#RUN dnf install -y chrony firewalld

#RUN mkdir -p /var/run/sshd
#RUN mkdir -p /var/run/supervisord
#RUN echo "root:password" | chpasswd
#RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
#RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
#RUN sed -i 's|#PermitRootLogin prohibit-password|PermitRootLogin yes|g' /etc/ssh/sshd_config
#RUN useradd ssh-user -G wheel
#RUN echo "ssh-user:password" | chpasswd
ADD supervisord.conf /etc/supervisord.conf

#EXPOSE 22
#ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
#ENTRYPOINT ["/bin/bash"]
#ENTRYPOINT ["/usr/lib/systemd/systemd"]

RUN dnf install -y systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);
RUN rm -rf /lib/systemd/system/multi-user.target.wants/;
RUN rm -rf /etc/systemd/system/.wants/;
RUN rm -rf /lib/systemd/system/local-fs.target.wants/;
RUN rm -rf /lib/systemd/system/sockets.target.wants/udev;
RUN rm -rf /lib/systemd/system/sockets.target.wants/initctl;
RUN rm -rf /lib/systemd/system/basic.target.wants/;
RUN rm -rf /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ “/sys/fs/cgroup” ]

#RUN dnf clean all -y

CMD ["/usr/sbin/init"]
