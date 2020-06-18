FROM nginx:alpine
COPY ["mime.types", "/etc/nginx/mime.types" ]

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]