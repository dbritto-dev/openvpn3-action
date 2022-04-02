FROM ubuntu:focal

COPY entrypoint.sh /entrypoint.sh
COPY pre-entrypoint.sh /pre-entrypoint.sh
COPY entrypoint.sh /entrypoint.sh
COPY post-entrypoint.sh /post-entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
