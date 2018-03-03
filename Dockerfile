FROM debien

#MAINTAINER  (me) <alaouirizqhicham@gmail.com>

WORKDIR /opt

# Copy the database schema to the /data directory
ADD files/run_db files/init_db files/epcis_schema.sql files/cmd.sql /opt/

# init_db will create the default
# database from epcis_schema.sql, then
# stop mysqld, and finally copy the /var/lib/mysql directory
# to default_mysql_db.tar.gz
RUN /opt/init_db



# run_db starts mysqld, but first it checks
# to see if the /var/lib/mysql directory is empty, if
# it is it is seeded with default_mysql_db.tar.gz before
# the mysql is fired up

ENTRYPOINT "/opt/run_db"

