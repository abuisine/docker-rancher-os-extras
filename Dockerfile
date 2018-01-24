FROM alpine
ARG KERNEL_VERSION=4.9.45-rancher
ARG EXTRA=gpu

ENV KERNEL_VERSION=${KERNEL_VERSION} EXTRA=${EXTRA}
LABEL maintainer="Alexandre Buisine <alexandrejabuisine@gmail.com>" version="${KERNEL_VERSION}-${EXTRA}-1"

RUN apk add --no-cache bash

COPY resources/extra.sh /usr/local/bin/extra.sh
COPY resources/extras-${KERNEL_VERSION}-${EXTRA}.tgz /

RUN chmod +x /usr/local/bin/extra.sh

CMD [ "extra.sh" ]