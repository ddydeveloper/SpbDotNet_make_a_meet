FROM microsoft/mssql-server-linux

RUN mkdir -p /usr/config
COPY ./entrypoint.sh /usr/config
COPY ./setup.sql /usr/config

RUN chmod +x /usr/config/entrypoint.sh