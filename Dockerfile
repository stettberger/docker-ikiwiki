FROM phusion/baseimage
MAINTAINER Jochen Roessner <jochen@zerties.org>

# Install base packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-gd \
        php5-curl \
        php-pear \
        php-apc && \
    apt-get clean && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
 
RUN apt-get -yq install exim4-daemon-light && apt-get clean

ENV ALLOW_OVERRIDE **False**

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

ADD eximsmarthost.sh /etc/service/exim/run
ADD apache.sh /etc/service/apache2/run

EXPOSE 80
WORKDIR /app
