FROM nginx:alpine
USER root
COPY ./build /usr/share/nginx/html


