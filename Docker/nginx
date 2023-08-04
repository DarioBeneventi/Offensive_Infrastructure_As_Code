# file: ~/nginx/Dockerfile
# Base img with scripts to configure Nginx & Let's Encrypt
FROM staticfloat/nginx-certbot

# Nginx template config
COPY *.conf /etc/nginx/conf.d/

# Copy HTML web pages
COPY --chown=www-data html/* /var/www/html/

# Script to replace __DOMAIN__ with ENV domain value & Same for the IP
COPY init.sh /scripts/

ENV DOMAIN="www.mysecretphishingdomainhere.com"
ENV C2IP="0.0.0.0"
ENV CERTBOT_EMAIL="notmalicious@protonmail.com"

CMD ["/bin/bash", "/scripts/init.sh"]