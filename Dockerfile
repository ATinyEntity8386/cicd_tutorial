FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"

# Install required packages
RUN apt update -y && \
    apt install -y python3-pip python3-venv python3-dev build-essential

# Create working directory
WORKDIR /flask_app

# Copy app code
ADD . /flask_app

# Create virtual environment and install dependencies
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install -r requirements.txt

# Set virtual environment as default Python and pip
ENV PATH="/opt/venv/bin:$PATH"

# Run the app
ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]
