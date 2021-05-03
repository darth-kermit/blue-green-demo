FROM python:3.8
COPY ./app /app
WORKDIR /app/
EXPOSE 8080
RUN pip install redis bottle gunicorn
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]