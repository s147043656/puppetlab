FROM nimmis/java:oracle-8-jdk

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install adduser \
    curl \
    lsb-base \
    procps \
    zlib1g \
    gzip \
    python \
    python-support \
    sysstat \
    mc \
    ntp bash tree && \
    rm -rf /var/lib/apt/lists/*

ADD apache-cassandra-bin.tar.gz /opt

ENV CASSANDRA_HOME /opt/cassandra

RUN ln -s /opt/apache-cassandra-bin $CASSANDRA_HOME

# keep data here
VOLUME /data

# and logs here
VOLUME /logs

VOLUME /opt/cassandra

# starting node using custom entrypoint that configures paths, interfaces, etc.
COPY scripts/cassandra-entrypoint /usr/local/bin/
RUN chmod +x /usr/local/bin/cassandra-entrypoint
ENTRYPOINT ["/usr/local/bin/cassandra-entrypoint"]

# Running any other DSE/C* command should be done on behalf dse user
# Perform that using a generic command laucher
COPY scripts/cassandra-cmd-launcher /usr/local/bin/
RUN chmod +x /usr/local/bin/cassandra-cmd-launcher

# link dse commands to the launcher
RUN for cmd in cqlsh nodetool cassandra-stress; do \
        ln -sf /usr/local/bin/cassandra-cmd-launcher /usr/local/bin/$cmd ; \
    done

# Cassandra
EXPOSE 7000 9042 9160
