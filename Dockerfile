FROM centos:7
MAINTAINER sanjusss <sanjusss@qq.com>

RUN yum update -y \
    && yum install -y wget \
    && mkdir /download \
    && cd /download \
    && wget http://www.aishub.net/downloads/aisdispatcher_linux-1.2_glibc-2.15.tar.gz \
    && tar -xzf aisdispatcher_linux-1.2_glibc-2.15.tar.gz \
    && mkdir /app \
    && mv /download/aisdispatcher_linux-1.2_glibc-2.15/aisdispatcher-x86_64 /app/aisdispatcher \
    && rm -rf /download \
    && yum remove -y wget \
    && yum autoremove -y

WORKDIR /app
ENTRYPOINT ["/app/aisdispatcher"]