FROM centos:7
MAINTAINER minyk

ENV LOGGEN_COUNTER_IN_MIN 1000
ENV LOGGEN_DELAY_IN_SEC 100

RUN yum install -y git && mkdir -p /opt/data

WORKDIR /opt

RUN git clone https://github.com/minyk/LogGen.git

WORKDIR /opt/LogGen
COPY loggen.sh /opt/LogGen/loggen.sh
RUN chmod a+x /opt/LogGen/loggen.sh

VOLUME ["/opt/data"]

ENTRYPOINT ["/opt/LogGen/loggen.sh"]
