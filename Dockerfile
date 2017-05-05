FROM centos:6

RUN yum install -y httpd \
    && rm -f /var/www/html/index.html \
    && echo '<?php phpinfo();' > /var/www/html/index.php \
    && yum install -y gcc make libXpm.so.4 libt1.so.5 autoconf automake gd \
    && yum install -y openssl openssl-devel readline readline-devel \
    && yum install -y openssl098e compat-readline5 compat-openldap \
    && yum install -y libxslt \
    && yum install -y mysql-devel \
    && yum install -y php \
    && yum remove -y gcc make autoconf automake \
    && yum clean all \
    && find /var/log -type f -print0 | xargs -0 rm -rf /tmp/*
    
CMD [ "/usr/sbin/httpd", "-DFOREGROUND" ]

EXPOSE 80
