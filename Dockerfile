FROM python:3.8-slim

WORKDIR /luigi

COPY . /luigi

RUN apt-get update -y && \
    apt-get install -y build-essential libpq-dev python3-dev python-dev && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install -r /luigi/requirements.txt

RUN chmod +x /luigi/entrypoint.sh

ENTRYPOINT [ "/luigi/entrypoint.sh" ]
