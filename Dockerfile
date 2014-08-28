FROM ubuntu:14.04
MAINTAINER SungKwang Song <saltfactory@gmail.com>

# install Oracle Java 7
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

# install wget and unzip
RUN apt-get install -y wget unzip

# add yobi user
RUN useradd -m -d /home/yobi -s /bin/bash -U yobi

# mount start shell
ADD start-yobi.sh /home/yobi/start-yobi.sh
RUN chmod 0755 /home/yobi/start-yobi.sh

# change owner with yobi
#USER yobi

# download play-2.1.0 and add PATH
RUN cd /home/yobi; wget http://downloads.typesafe.com/play/2.1.0/play-2.1.0.zip
RUN cd /home/yobi; unzip play-2.1.0.zip
ENV PATH $PATH:/home/yobi/play-2.1.0

# add volume from client disk yobi
VOLUME ["/home/yobi/yobi"]

# setting working directory
WORKDIR /home/yobi

# forwarding port number
EXPOSE 9000

# run docker command
CMD ["bash", "/home/yobi/start-yobi.sh"]
