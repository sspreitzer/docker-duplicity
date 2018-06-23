FROM centos:7

RUN yum install -y epel-release && \
    yum install -y duplicity duply && \
    yum erase -y epel-release && \
    yum clean all && \
    rm -rf /var/cache/yum

VOLUME /var/lib/backup-src /var/lib/backup-dest

CMD duplicity incr --no-encryption /var/lib/backup-src file:///var/lib/backup-dest
