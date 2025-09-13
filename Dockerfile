FROM quay.io/centos/centos:stream9



# Remove default welcome page
RUN rm -f /var/www/html/*

# Copy your site files
COPY ./var/www/html/

# Set correct permissions
RUN chown -R apache:apache /var/www/html && \
    chmod -R 755 /var/www/html

# Expose port
EXPOSE 80

# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
