FROM rethinkdb:2

ADD entrypoint.sh /bin/
ADD rethinkdb-probe /bin/

HEALTHCHECK --interval=20s --timeout=10s --retries=3 \
    CMD /bin/rethinkdb-probe

ENTRYPOINT ["/bin/entrypoint.sh"]
CMD ["default"]
