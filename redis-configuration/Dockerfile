FROM redis
COPY redis.conf /usr/local/etc/redis/redis.conf
EXPOSE 6666

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf", "--port", "6666" ]
