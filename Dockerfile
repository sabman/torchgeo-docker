FROM python:3.8

RUN apt update && apt install -y \
  libgdal-dev \
  libspatialindex-dev \
  python3-rtree \
  git

RUN pip install torchgeo

WORKDIR /opt
# RUN git clone https://github.com/microsoft/torchgeo.git
COPY ./getting_started.py /opt
# RUN python3 getting_started.py
# RUN echo "worked!"
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
