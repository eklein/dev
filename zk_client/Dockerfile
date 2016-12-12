FROM zookeeper

ENV CLIENT_JVMFLAGS='-Djava.security.auth.login.config=/etc/zookeeper/authclient'
COPY files/zk_auth_client.conf /etc/zookeeper/authclient

CMD ["zkCli.sh", "-server", "zookeeper"]
