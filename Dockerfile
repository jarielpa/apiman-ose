FROM apiman/on-wildfly10:1.2.7.Final
RUN $JBOSS_HOME/bin/add-user.sh admin admin --silent
VOLUME /opt/jboss/wildfly/standalone/data
#EXPOSE 8787
ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone-apiman.xml"]
