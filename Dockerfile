FROM ubuntu:focal

COPY pre-entrypoint.sh /bin/pre-entrypoint.sh
COPY entrypoint.sh /entrypoint.sh
COPY post-entrypoint.sh /bin/post-entrypoint.sh

RUN chmod +x /bin/pre-entrypoint.sh
RUN chmod +x entrypoint.sh
RUN chmod +x /bin/post-entrypoint.sh
RUN echo $PATH

ENTRYPOINT ["/entrypoint.sh"]
