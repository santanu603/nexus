# Use Nginx as base image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /var/www/html/*

# Copy your website files to nginx html directory
COPY . /var/www/html/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
