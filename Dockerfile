FROM neubiaswg5/neubias-base

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update -y && \
    apt-get install -y software-properties-common && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y --force-yes oracle-java8-installer && \
    apt-get install -y wget unzip && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    rm -rf /var/lib/apt/lists/*

# Install Icy.
RUN mkdir -p /icy && \
    cd /icy && \
    wget -O icy.zip http://www.icy.bioimageanalysis.org/downloadIcy/icy_1.9.5.2b.zip && \
    unzip icy.zip && \
    rm -rf icy.zip
      
#ADD icy_patch.jar /icy/icy.jar

# Add icy to the PATH
ENV PATH $PATH:/icy

RUN mkdir -p /icy/data/in && \
    mkdir -p /icy/protocols
