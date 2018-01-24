#!/bin/bash

KERNEL_VERSIONS="4.9.45-rancher 4.9.75-rancher"
EXTRAS="gpu nvidia-375.66"

for KERNEL_VERSION in ${KERNEL_VERSIONS}
do
	for EXTRA in ${EXTRAS}
	do
		docker build --build-arg KERNEL_VERSION=${KERNEL_VERSION} --build-arg EXTRA=${EXTRA} -t abuisine/rancher-os-extras:${KERNEL_VERSION}-${EXTRA} .
		docker push abuisine/rancher-os-extras:${KERNEL_VERSION}-${EXTRA}
	done
done
