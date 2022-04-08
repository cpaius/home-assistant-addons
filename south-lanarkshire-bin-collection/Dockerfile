ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache python3 py3-pip

# Copy data for add-on
RUN mkdir -p /collections
COPY scripts/run.sh /
COPY scripts/python/south_lanarkshire_council.py /collections/
COPY scripts/python/requirements.txt /collections/
COPY scripts/execute-get-bin-collections.sh /collections/
COPY scripts/env.sh /collections/

RUN chmod a+x /run.sh
RUN chmod a+x /collections/env.sh
RUN chmod a+x /collections/execute-get-bin-collections.sh

COPY scripts/run-periodic.sh /etc/periodic/15min/collections
RUN chmod a+x /etc/periodic/15min/collections

CMD [ "/run.sh" ]
