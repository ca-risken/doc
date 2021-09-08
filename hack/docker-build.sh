#! /bin/sh
if [ "${IMAGE_TAG}" = "" ]; then
  IMAGE_TAG=latest
fi
if [ "${IMAGE_PREFIX}" = "" ]; then
  IMAGE_PREFIX=default_prefix
fi
docker build ${BUILD_OPT} --build-arg GITHUB_USER=${GITHUB_USER} --build-arg GITHUB_TOKEN=${GITHUB_TOKEN} -t ${IMAGE_PREFIX}/${TARGET}:${IMAGE_TAG} .