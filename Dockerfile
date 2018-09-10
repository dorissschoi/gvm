FROM ubuntu:trusty

ENV JAVA_HOME /usr/lib/jvm/java-openjdk 

# Installs jdk, curl, SDKMAN and grails
RUN apt-get install -y software-properties-common  && \
    add-apt-repository ppa:openjdk-r/ppa -y && \
    apt-get update -y && \
    apt-get install -y curl unzip && \
    apt-get install -y curl zip && \
    apt-get install -y openjdk-8-jdk && \ 
    curl -s "https://get.sdkman.io" | bash && \
    sdk install grails 3.2.4 && \
    apt-get autoremove -y && \
    apt-get clean

    
#    curl -s "https://get.sdkman.io" | bash && \
#    sdk install grails 3.2.4 && \

