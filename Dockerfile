FROM phusion/baseimage
MAINTAINER Christian Dietrich <stettberger@dokucode.de>

ENV IKIWIKI_UID 1002
ENV IKIWIKI_GID 1002
ENV IKIWIKI_HOME /home/ikiwiki
ENV IKIWIKI_NAME Dokucode
ENV IKIWIKI_ADMIN_EMAIL stettberger@dokucode.de
ENV IKIWIKI_ADMIN_USER stettberger
ENV IKIWIKI_URL http://blog.dokucode.de
ENV IKIWIKI_ACCOUNT_CREATION_PASSWORD foobar23

# Add ejabberd user and group
RUN deluser www-data && addgroup www-data --gid $IKIWIKI_GID && useradd -r -m \
       -g www-data \
       --uid $IKIWIKI_UID \
       -d $IKIWIKI_HOME \
       -s /usr/sbin/nologin \
       www-data


# Install base packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        curl \
        apache2 \
        python  \
        python-jinja2  \
        libtext-multimarkdown-perl \
        libtext-bibtex-perl \
        libsearch-xapian-perl \
        imagemagick \
        libgraphics-magick-perl \
        libhighlight-perl \
        highlight \
        perlmagick \
        inotify-tools \
        ikiwiki && \
    apt-get clean


RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install exim4-daemon-light && apt-get clean

ENV ALLOW_OVERRIDE **False**

RUN mkdir /var/lock/apache2 && mkdir /var/run/apache2

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html \
    && chown www-data:www-data /app -R

# Run an apache and an exim
ADD eximsmarthost.sh /etc/service/exim/run
ADD apache.sh /etc/service/apache2/run
ADD inotify.sh /etc/service/inotify/run

ADD ./conf ${IKIWIKI_HOME}/conf
ADD ./scripts ${IKIWIKI_HOME}/scripts
ADD ./dot-ikiwiki ${IKIWIKI_HOME}/.ikiwiki

# Setup Script
ADD ./setup.sh /etc/my_init.d/ikiwiki

# Enable CGI Scripts
RUN a2enmod cgi && \
    echo 'AddHandler cgi-script .cgi\n' >> /etc/apache2/apache2.conf && \
    echo 'ScriptAlias /ikiwiki.cgi /app/cgi-bin/ikiwiki.cgi\n' >> /etc/apache2/apache2.conf && \
    echo '<Directory /app/cgi-bin/>\n\
            Options Indexes MultiViews ExecCGI\n\
            AllowOverride None\n\
            Require all granted\n\
          </Directory>\n' >> /etc/apache2/apache2.conf

EXPOSE 80

VOLUME ["/home/ikiwiki/www.git", "/home/ikiwiki/www.db", "/app/files"]
WORKDIR /home/ikiwiki
