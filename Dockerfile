# Use Nginx as base image
FROM quay.io/centos/centos:stream9

# Remove default nginx website
RUN rm -rf /var/www/html/*

# Copy your website files to nginx html directory
COPY . /var/www/html/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
