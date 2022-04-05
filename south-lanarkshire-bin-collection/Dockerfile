ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache python3 py3-pip

# Copy data for add-on
COPY scripts/run.sh /
COPY scripts/python/south_lanarkshire_council.py /
COPY scripts/python/requirements.txt /
COPY scripts/execute-get-bin-collections.sh /
COPY scripts/env.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]