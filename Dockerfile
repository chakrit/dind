FROM gliderlabs/alpine
RUN apk add --update docker
CMD ["docker"]

