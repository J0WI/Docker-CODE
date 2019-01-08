FROM ubuntu:16.04

# Environment variables
ENV domain localhost
ENV LC_CTYPE en_US.UTF-8

# Setup scripts for LibreOffice Online
COPY /scripts/*.sh /
RUN /install-libreoffice.sh

# Entry point
ENTRYPOINT ["/start-libreoffice.sh"]

EXPOSE 9980

CMD ["/start-libreoffice.sh"]
