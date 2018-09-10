FROM ubuntu:trusty

ENV JAVA_HOME /usr/lib/jvm/java-openjdk 
ENV GRAILS_VERSION 3.2.8
WORKDIR /usr/lib/jvm

# Remarks: install update then software-properties-common 
# Download Install openjdk, grails
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa -y && \
    apt-get update -y && \
    apt-get install -y curl unzip && \
    apt-get install -y curl wget && \
    apt-get install -y openjdk-8-jdk && \ 
    wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails && \
    apt-get autoremove -y && \
    apt-get clean

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH

# Create App Directory
RUN mkdir /app

# Set Workdir
WORKDIR /app

# Set Default Behavior
ENTRYPOINT ["grails"]
