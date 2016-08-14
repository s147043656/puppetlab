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
    ntp bash tree && \
    rm -rf /var/lib/apt/lists/*

# grab gosu for easy step-down from root
RUN curl -o /bin/gosu -SkL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
    && chmod +x /bin/gosu

ADD apache-cassandra-bin.tar.gz /opt

ENV CASSANDRA_HOME /opt/cassandra

RUN ln -s /opt/apache-cassandra-bin $CASSANDRA_HOME

# keep data here
VOLUME /data

# and logs here
VOLUME /logs

VOLUME /opt/cassandra

# create a dedicated user for running DSE node
RUN groupadd -g 1337 cassandra && \
    useradd -u 1337 -g cassandra -s /bin/bash -d $CASSANDRA_HOME cassandra && \
    chown -R cassandra:cassandra /opt/cassandra*

# starting node using custom entrypoint that configures paths, interfaces, etc.
COPY scripts/cassandra-entrypoint /usr/local/bin/
RUN chmod +x /usr/local/bin/cassandra-entrypoint
ENTRYPOINT ["/usr/local/bin/cassandra-entrypoint"]

# Running any other DSE/C* command should be done on behalf dse user
# Perform that using a generic command laucher
COPY scripts/cassandra-cmd-launcher /usr/local/bin/
RUN chmod +x /usr/local/bin/cassandra-cmd-launcher

# link dse commands to the launcher
RUN for cmd in cqlsh dsetool nodetool dse cassandra-stress; do \
        ln -sf /usr/local/bin/cassandra-cmd-launcher /usr/local/bin/$cmd ; \
    done

# Cassandra
EXPOSE 7000 9042 9160
