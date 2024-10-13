FROM ubuntu:22.04
WORKDIR /app
COPY . ./
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install django
ARG SUPERUSER_USERNAME
ARG SUPERUSER_EMAIL
ARG SUPERUSER_PASSWORD

RUN python3 manage.py makemigrations && \
    python3 manage.py migrate

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

docker build --build-arg SUPERUSER_USERNAME=abi --build-arg SUPERUSER_EMAIL=abi@example.com  --build-arg SUPERUSER_PASSWORD=123 -t myimg .

~                                                            
