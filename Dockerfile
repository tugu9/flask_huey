FROM python:3.8-alpine 
WORKDIR /app/flask

RUN apk --update --no-cache add python3-dev libffi-dev gcc musl-dev make libevent-dev build-base &&\
    apk add --no-cache --upgrade bash

RUN pip install huey &&\
    pip install redis &&\
    pip install gevent &&\
    pip install Flask

COPY . /app 

RUN chmod +x run_webapp.sh
RUN chmod +x run_huey.sh
RUN chmod +x startup.sh

# CMD ["./run_webapp.sh"]
CMD ["./startup.sh"]

# CMD ["python", "flask/main.py"]
# CMD ["ls"]
# CMD ["./run_huey.sh"]
# CMD ["python", "huey/bin/huey_consumer.py", "main.huey", "-w2"]

# RUN /run_huey.sh