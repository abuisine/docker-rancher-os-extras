#!/bin/bash
set -eo pipefail

echo "Kernel ${EXTRA} extra for ${KERNEL_VERSION}"

#DIR=/lib/modules/${KERNEL_VERSION}/build
STAMP=/lib/modules/${KERNEL_VERSION}/.extras-${KERNEL_VERSION}-${EXTRA}-done

if [ -e $STAMP ]; then
    echo "Kernel ${EXTRA} extras for ${KERNEL_VERSION} already installed. Delete $STAMP to reinstall"
    exit 0
fi

cat /extras-${KERNEL_VERSION}-${EXTRA}.tgz | gzip -dc | tar xf - -C /
if [ "${KERNEL_VERSION}" == "$(uname -r)" ]; then
    depmod -a
fi
touch $STAMP

echo "Kernel ${EXTRA} extras for ${KERNEL_VERSION} installed. Delete $STAMP to reinstall"
