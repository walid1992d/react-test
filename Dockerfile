FROM nginx:alpine
RUN chmod 700  /usr/share/nginx/html
COPY ./build /usr/share/nginx/html


