FROM php:7.4-apache
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install zip -y
RUN apt-get install -y libicu-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-install mysqli pdo pdo_mysql intl
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install ctype
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install json
#RUN docker-php-ext-install mbstring
RUN docker-php-ext-install tokenizer
RUN apt-get update \
    && apt-get install -y \
    libxml2-dev \
    libxslt-dev \
    && docker-php-ext-install -j$(nproc) \
    dom \
    xmlrpc \
    xsl
RUN apt-get update \
    && apt-get install -y \
    openssl \
    git \
    gnupg2
COPY src/ /var/www/html/
RUN apt-get update -y
RUN apt-get install git -y
WORKDIR /var/www/html/DVWA
RUN git clone https://github.com/digininja/DVWA.git .
RUN cp /var/www/html/config.inc.php /var/www/html/DVWA/config/config.inc.php
#ENTRYPOINT ["/bin/bash","/var/www/html/entrypoint.sh"]
