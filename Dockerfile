#getting base image python
FROM python:stretch

LABEL maintainer='Maissoun'
LABEL date='2020-02-04'
LABEL description='Image to build the flask app'

# set work directory
COPY . /app
WORKDIR /app

# Upgrade pip and install dependencies
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]