FROM alpine:latest
MAINTAINER Dominic Cullen <dominic.cullen@pleo.io>

RUN apk add --update curl coreutils  && rm -rf /var/cache/apk/*

RUN adduser -D -s /bin/sh pleo
USER pleo
COPY --chown=pleo entrypoint.sh /home/pleo
RUN chmod 755 /home/pleo/entrypoint.sh
WORKDIR /home/pleo

# Set Datadog version to the Git commit SHA.
ARG github_sha
ENV DD_VERSION ${github_sha}

ENTRYPOINT ["./entrypoint.sh"]
CMD ["curl"]