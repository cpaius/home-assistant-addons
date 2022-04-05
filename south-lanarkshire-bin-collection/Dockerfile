ARG BUILD_FROM
FROM $BUILD_FROM

# Copy data for add-on
COPY scripts/run.sh /
COPY scripts/python/south_lanarkshire_council.py /
COPY scripts/python/requirements.txt /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]