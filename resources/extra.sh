#!/bin/bash
set -e
set -x

echo "Kernel extras for ${KERNEL_VERSION}"

#DIR=/lib/modules/${KERNEL_VERSION}/build
STAMP=/lib/modules/${KERNEL_VERSION}/.extras-${EXTRA_VERSION}-done

if [ -e $STAMP ]; then
    echo Kernel ${EXTRA_VERSION} extras for ${KERNEL_VERSION} already installed. Delete $STAMP to reinstall
    exit 0
fi

cat /extras-${EXTRA_VERSION}.tar.gz | gzip -dc | tar xf - -C /
if [ "${KERNEL_VERSION}" == "$(uname -r)" ]; then
    depmod -a
fi
touch $STAMP

echo Kernel ${EXTRA_VERSION} extras for ${KERNEL_VERSION} installed. Delete $STAMP to reinstall
