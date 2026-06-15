# Anxiety Garden — static site served by nginx (Coolify: build pack = Dockerfile)
FROM nginx:1.27-alpine
COPY default.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html
EXPOSE 80
