FROM ubuntu:trusty

ENV JAVA_HOME /usr/lib/jvm/java-openjdk 

# Installs jdk, curl, SDKMAN and grails
RUN apt-get update -y && \
    apt-get install -y curl unzip && \
    apt-get install zip && \
    apt-get install -y openjdk-7-jre && \
    curl -s "https://get.sdkman.io" | bash && \
    sdk install grails 3.2.4 && \
    apt-get autoremove -y && \
    apt-get clean
    
CMD ["java", "-version"]
ADD gvm.config /.gvm/etc/config
ADD bin/ /usr/local/bin/
