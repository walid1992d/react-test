FROM ubuntu:latest

USER root

RUN apt-get update
RUN apt-get install -y nginx 

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

ADD ./build /usr/share/nginx/html/
ADD ./build /var/www/html/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf


# Set the default command to execute
# when creating a new container
CMD service nginx start
