FROM python:3.11

## isntalar SSH Client

RUN apt-get update && apt-get install -y openssh-client

#set enviaroment variable
ENV PYTHONUNBUFFERED 1

#set work directory
WORKDIR /app

#Copy requirements.txt file
COPY requirements.txt /app/requirements.txt

# install dependencies
RUN pip install -r requirements.txt

#Copy the aplicaction to the work directory
COPY . /app/


#start the SSH tunner
CMD python manage.py runserver 0.0.0.0:8000

