FROM jenkins

USER root
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update \
      && apt-get install -y sudo build-essential nodejs \
      && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
 
USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

