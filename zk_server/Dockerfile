FROM zookeeper:3.4.9

ENV ZK_VERSION 3.4.9
ENV SERVER_JVMFLAGS -Djava.security.auth.login.config=${ZOO_CONF_DIR}/jaas.conf
ENV ZOO_SERVERS authProvider.1=org.apache.zookeeper.server.auth.SASLAuthenticationProvider

COPY files/auth ${ZOO_CONF_DIR}/jaas.conf
