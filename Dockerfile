FROM jenkins

USER root
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/* \
      && apt-get update \
      && apt-get install -y build-essential \
      && apt-get install -y nodejs

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
 
USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

