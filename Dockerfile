FROM sebp/sonar-runner:latest
USER root 
RUN useradd  go
RUN chown go.go /data
