FROM jenkins:2.60.1

USER root
RUN apt-get update \
  && apt-get install libltdl7 \
  && apt-get install -y sudo \
  && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
