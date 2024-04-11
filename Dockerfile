FROM alpine:3.19
run apk update && apk add --no-cache wget bash
ADD bash.sh . 
entrypoint ["bash","bash.sh"]
