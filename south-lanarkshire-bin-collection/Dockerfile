ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache python3 py3-pip

# Copy data for add-on
COPY scripts/run.sh /collections/
COPY scripts/python/south_lanarkshire_council.py /collections/
COPY scripts/python/requirements.txt /collections/
COPY scripts/execute-get-bin-collections.sh /collections/
COPY scripts/env.sh /collections/

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
ENTRYPOINT ["tail", "-f", "/dev/null"]