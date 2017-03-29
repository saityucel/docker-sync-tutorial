#/usr/bin/env bash

docker-sync start -d --no-logd

rm -rf app/vendor

t1=$(date +%s)
docker-compose -f docker-compose.yml run --rm app install
t2=$(date +%s)

rm -rf app/vendor

t3=$(date +%s)
docker-compose -f docker-compose-mac.yml run --rm app install
t4=$(date +%s)

duration1=$((t2-t1))
duration2=$((t4-t3))

echo "Execution time of Docker for Mac without docker-sync: $duration1 seconds."
echo "Execution time of Docker for Mac with docker-sync: $duration2 seconds."

docker-sync stop

