FROM ubuntu:16.04

# COPY sources.list /etc/apt/sources.list
# RUN apt-get install -y apt-transport-https
COPY test.sh /root/docker_entrypoint.sh
RUN chmod 755 /root/docker_entrypoint.sh
WORKDIR /root
VOLUME ["/frida_out"]
ENTRYPOINT ["/root/docker_entrypoint.sh"]
