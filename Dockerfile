FROM python:3.8

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN python -m pip install --upgrade pip\
    && pip install Flask uWSGI requests redis

WORKDIR /app
COPY app /app
COPY run.sh /

EXPOSE 9090 9191

USER uwsgi

# CMD [ "uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/zero.py", "--callable", "app", "--stats", "0.0.0.0:9191", "--stats-http" ]
CMD [ "/run.sh" ]
