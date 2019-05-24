FROM alpine:3.5 AS build
RUN apk update && \
    apk add --update alpine-sdk
RUN mkdir /app
WORKDIR /app
COPY hello.c /app
RUN mkdir bin
RUN gcc -Wall hello.c -o bin/hw

FROM alpine:3.5
COPY --from=build /app/bin/hw /app/hw
CMD /app/hw
