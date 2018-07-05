FROM neubiaswg5/neubias-base

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get update -y && apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update -y && \
    apt-get install -y oracle-java8-installer wget unzip && \
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
