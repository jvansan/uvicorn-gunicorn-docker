FROM continuumio/miniconda3

LABEL maintainer="jvansan <jeffreyavansanten@gmail.com>"

ENV PYTHONVENV=app

RUN conda update -n base conda
RUN conda create -n $PYTHONVENV python=3.7
RUN conda install -n $PYTHONVENV -c conda-forge uvicorn gunicorn

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./app /app
WORKDIR /app/

ENV PYTHONPATH=/app

EXPOSE 80

# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Uvicorn
CMD ["/start.sh"]
