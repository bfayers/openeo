FROM python:3.13.5-slim-bookworm

RUN apt-get update --allow-unauthenticated --allow-insecure-repositories
RUN apt-get install -y --allow-unauthenticated build-essential
RUN apt-get install -y --allow-unauthenticated libffi-dev

RUN pip install jinja2 pyserial websockets jsonschema==4.17.3 jinja2 psutil spidev RPi.GPIO

WORKDIR /app

COPY . /app

ENV environment=docker
CMD ["python", "/app/openeo.py"]
