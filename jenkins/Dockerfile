FROM jenkins

# Install Docker
USER root
RUN apt-get update
# RUN apt-get purge "lxc-docker*"
RUN apt-get purge "docker.io*"
RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
COPY docker.list /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get install -y docker-engine

# Install kubectl
ENV KUBERNETES_VERSION 1.4.3
RUN wget -q -O /opt/kubernetes.tar.gz https://github.com/kubernetes/kubernetes/releases/download/v${KUBERNETES_VERSION}/kubernetes.tar.gz
WORKDIR /usr/local/bin
RUN tar -xvzf /opt/kubernetes.tar.gz kubernetes/platforms/linux/386/kubectl --strip-components=4
USER jenkins

# Install Plugins
ADD plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# Pre defined projects and docker user
WORKDIR /var/jenkins_home/
# ADD ./jobs/myproject/config.xml jobs/myproject/config.xml
# ADD ./users/docker/config.xml users/docker/config.xml
# USER root
# RUN chown -R jenkins:jenkins /var/jenkins_home
USER jenkins
