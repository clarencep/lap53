FROM centos:6

RUN yum install -y httpd \
    && rm -f /var/www/html/index.html \
    && echo '<?php phpinfo();' > /var/www/html/index.php

RUN yum install -y gcc make libXpm.so.4 libt1.so.5 autoconf automake gd
RUN yum install -y openssl openssl-devel readline readline-devel 
RUN yum install -y openssl098e compat-readline5 compat-openldap
RUN yum install -y libxslt
RUN yum install -y mysql-devel
RUN yum install -y php

RUN yum clean all
RUN rm -rf /tmp/*

CMD [ "/usr/sbin/httpd", "-DFOREGROUND" ]

EXPOSE 80
