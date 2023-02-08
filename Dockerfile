FROM python:3.10.6

COPY . /app

WORKDIR /app

env FLASK_APP=flaskr

env FLASK_ENV=development


RUN pip install -r requirements.txt

EXPOSE 5000


CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
