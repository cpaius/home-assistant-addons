ARG BUILD_FROM
FROM $BUILD_FROM

# Copy data for add-on
COPY scripts/run.sh /
RUN chmod a+x /scripts/run.sh

CMD [ "/scripts/run.sh" ]