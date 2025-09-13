# Use CentOS Stream 9 as the base image
FROM quay.io/centos/centos:stream9



# Copy custom website files (optional)
# Replace ./html with your local folder containing index.html
COPY ./html/ /var/www/html/

# Expose Apache default port
EXPOSE 80

# Run Apache in foreground (required for container)
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
