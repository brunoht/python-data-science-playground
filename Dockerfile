FROM python:3.8

ADD . /app

WORKDIR /app

EXPOSE 5000

CMD pip install -r requirements.txt && python app.py