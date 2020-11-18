FROM registry.access.redhat.com/ubi8/nginx-118

# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
USER 0
ADD ./build /tmp/src/
ADD nginx.conf "${NGINX_CONF_PATH}"
RUN mkdir logs
RUN chown -R 1001:0 logs
RUN touch logs/ssl_error_log
RUN chown -R 1001:0 /tmp/src
USER 1001

# Let the assemble script to install the dependencies
RUN /usr/libexec/s2i/assemble

# Run script uses standard ways to run the application
CMD /usr/libexec/s2i/run