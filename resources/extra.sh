#!/bin/bash
set -e
set -x

echo "Kernel extras for ${KERNEL_VERSION}"

#DIR=/lib/modules/${KERNEL_VERSION}/build
STAMP=/lib/modules/${KERNEL_VERSION}/.extras-${EXTRA_TAG}-done

if [ -e $STAMP ]; then
    echo Kernel ${EXTRA_TAG} extras for ${KERNEL_VERSION} already installed. Delete $STAMP to reinstall
    exit 0
fi

cat /extras-${EXTRA_TAG}.tar.gz | gzip -dc | tar xf - -C /
if [ "${KERNEL_VERSION}" == "$(uname -r)" ]; then
    depmod -a
fi
touch $STAMP

echo Kernel ${EXTRA_TAG} extras for ${KERNEL_VERSION} installed. Delete $STAMP to reinstall
