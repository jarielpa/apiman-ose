FROM jboss/wildfly:10.0.0.Final

ENV APIMAN_VERSION 1.2.7.Final

RUN cd $HOME/wildfly \
 && curl http://downloads.jboss.org/apiman/$APIMAN_VERSION/apiman-distro-wildfly10-$APIMAN_VERSION-overlay.zip | bsdtar -xvf-

RUN $JBOSS_HOME/bin/add-user.sh admin admin --silent
VOLUME /opt/jboss/wildfly/standalone/data

ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone-apiman.xml"]
