FROM alpine:3.6
RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories

RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && \
    apk update && \
    apk add --no-cache --virtual .build-deps && \
    apk add make bash less groff curl python py-pip && \
    pip install awscli && \
    apk --purge -v del py-pip && \
    rm -rf /var/cache/apk/*


ADD src /usr/local/bin
ARG JAR_FILE=docker-microservices-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} docker-microservices.jar
CMD ["chmod", "+x", "/usr/local/bin/run.sh"]
ENTRYPOINT ["/usr/local/bin/run.sh"]