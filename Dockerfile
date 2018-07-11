FROM neubiaswg5/neubias-base

# Java is installed in neubiaswg5/neubias-base.

# Install Icy.
RUN apt-get update && apt-get install -y unzip wget && \
    mkdir -p /icy && \
    cd /icy && \
    wget -O icy.zip http://www.icy.bioimageanalysis.org/downloadIcy/icy_1.9.5.2b.zip && \
    unzip icy.zip && \
    rm -rf icy.zip
      
#ADD icy_patch.jar /icy/icy.jar

# Add icy to the PATH
ENV PATH $PATH:/icy

RUN mkdir -p /icy/data/in && \
    mkdir -p /icy/protocols
