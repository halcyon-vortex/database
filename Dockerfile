FROM postgres:9.4.3
ENV DB_NAME database
ENV DB_USER admin
ENV DB_PASS password

RUN mkdir -p /tmp/psql_data/
COPY tmp/december_v3_2015_02_08 /tmp/psql_data/

#VOLUME ["/tmp"]

ADD setupRemoteConnections.sh /docker-entrypoint-initdb.d/setupRemoteConnections.sh
RUN chmod 755 /docker-entrypoint-initdb.d/setupRemoteConnections.sh
ADD setup-database.sh /docker-entrypoint-initdb.d/
RUN chmod 755 /docker-entrypoint-initdb.d/setup-database.sh

#CMD bash psql -U postgres test-db < /tmp/psql_data/december_v3_2015_02_08
