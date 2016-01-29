FROM sebp/sonar-runner 
MAINTAINER Marvin.Zhang 

ADD ./sonar-runner.sh ${SONAR_RUNNER_HOME}/bin/sonar-runner.sh
USER root
RUN chmod u+x ${SONAR_RUNNER_HOME}/bin/sonar-runner.sh
ENTRYPOINT ${SONAR_RUNNER_HOME}/bin/sonar-runner.sh
