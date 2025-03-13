FROM rethinkdb:2.4.4-bookworm-slim

COPY entrypoint.sh /bin/
COPY rethinkdb-probe /bin/

HEALTHCHECK --interval=20s --timeout=10s --retries=3 \
    CMD /bin/rethinkdb-probe

ENTRYPOINT ["/bin/entrypoint.sh"]
CMD ["default"]
