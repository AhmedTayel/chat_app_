#! /bin/sh

# Wait for MySQL
until nc -z -v -w30 $DB_HOST $DB_PORT; do
 echo 'loading sql'
 sleep 1
done
echo "loading sql done"


until nc -vz $ELASTICSEARCH_HOST 9200; do
echo 'loading elasticsearch'
  sleep 1
done
echo "elasticsearch loaded"