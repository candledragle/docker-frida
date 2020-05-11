FROM gcc:10

COPY entrypoint.sh /root/docker_entrypoint.sh
RUN chmod 755 /root/docker_entrypoint.sh
VOLUME [${PWD}/frida_out,"/root/frida_out"]
ENTRYPOINT ["/root/docker_entrypoint.sh"]
