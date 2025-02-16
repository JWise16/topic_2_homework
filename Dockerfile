FROM ubuntu:latest

MAINTAINER Your Name "jwise25@cmc.edu"

# Update and install Python 3, pip, and venv package
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3.12-venv

WORKDIR /flask_web

# Create a virtual environment
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Copy and install requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of your application code
COPY flask_web/ .

CMD [ "python3", "app.py" ]
