FROM alpine:3.19
run apk update && apk add --no-cache wget bash skopeo
ADD best403unlocker . 
entrypoint ["bash","best403unlocker"]
