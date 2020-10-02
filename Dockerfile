FROM nginx:1.19.2
MAINTAINER Iovets Mykola
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "./entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]