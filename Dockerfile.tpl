FROM %DOCKER_REGISTRY%docker-library-alpine

MAINTAINER Serge Fomin <serge.fo@gmail.com>

ENV SOLR_CORE_NAME changeme

RUN apk update \
  && apk add \
    python \
    py-pip \
  && pip install --upgrade pip \
  && rm -rf /tmp/* /var/cache/apk/*

RUN pip install mongo-connector

CMD mongo-connector \
  -m localhost:27017 \
  -t http://localhost:8983/solr/$SOLR_CORE_NAME \
  -d solr_doc_manager
