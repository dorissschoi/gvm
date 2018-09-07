FROM ubuntu:trusty

ENV JAVA_HOME /usr/lib/jvm/java-openjdk 

# Installs jdk, curl, SDKMAN and grails
RUN apt-get update -y && \
    apt-get install -y curl unzip && \
    apt-get install zip && \
    apt-get install software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install openjdk-8-jdk && \
    curl -s "https://get.sdkman.io" | bash && \
    sdk install grails 3.2.4 && \
    apt-get autoremove -y && \
    apt-get clean
    
#apt-get install -y openjdk-8-jre && \
