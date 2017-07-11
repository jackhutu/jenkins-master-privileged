FROM jenkins

USER root
RUN apt-get update \
  && apt-get install libltdl7 \
  && apt-get install -y sudo \
  && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
RUN sudo chown -R 1000:1000 /var/run/docker.sock \
  && sudo chown -R 1000:1000 /var/jenkins_home
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
