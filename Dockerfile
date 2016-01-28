FROM java:openjdk-8u45-jre
MAINTAINER Marvin.Zhang 

ENV SONAR_RUNNER_VERSION 2.4
ENV SONAR_RUNNER_HOME /opt/sonar-runner-${SONAR_RUNNER_VERSION}
ENV SONAR_RUNNER_PACKAGE sonar-runner-dist-${SONAR_RUNNER_VERSION}.zip
ENV HOME ${SONAR_RUNNER_HOME}

WORKDIR /opt

RUN wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/${SONAR_RUNNER_VERSION}/${SONAR_RUNNER_PACKAGE} \
 && unzip sonar-runner-dist-${SONAR_RUNNER_VERSION}.zip \
 && rm ${SONAR_RUNNER_PACKAGE}

RUN groupadd -r go \
 && useradd -r -s /usr/sbin/nologin -d ${SONAR_RUNNER_HOME} -c "Sonar service user" -g go go \
 && chown -R go:go ${SONAR_RUNNER_HOME} \
 && mkdir -p /data \
 && chown -R go /data

USER go 
WORKDIR /data

VOLUME /data

ENTRYPOINT ${SONAR_RUNNER_HOME}/bin/sonar-runner
