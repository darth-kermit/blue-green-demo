FROM alpine:latest
ENV REDIS_ADDR test-redis-001.1uamxk.0001.use2.cache.amazonaws.com
COPY . /app
CMD pip install redis bottle gunicorn
CMD python ./app/th3-server.py