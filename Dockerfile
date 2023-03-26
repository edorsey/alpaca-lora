ARG TZ=America/Chicago

FROM nvidia/cuda:12.0.1-cudnn8-devel-ubuntu20.04

ENV TZ=${TZ}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y build-essential python3 python3-pip git


WORKDIR /app

COPY . .

RUN pip install -r requirements.txt
