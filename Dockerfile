FROM ubuntu:trusty

ENV JAVA_HOME /usr/lib/jvm/java-openjdk 

# Installs jdk, curl and GVM
RUN apt-get update -y && \
    apt-get install -y curl unzip && \
    curl -s get.gvmtool.net | bash && \
    apt-get autoremove -y && \
    apt-get install -y openjdk-7-jre && \
    apt-get install zip && \
    apt-get clean
    
CMD ["java", "-version"]
ADD gvm.config /.gvm/etc/config
ADD bin/ /usr/local/bin/
