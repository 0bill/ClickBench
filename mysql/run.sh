#!/bin/bash

TRIES=3

cat queries.sql | while read query; do
    sync
    echo 3 | tee /proc/sys/vm/drop_caches
    echo "$(date +%s)  $1 droped"

    for i in $(seq 1 $TRIES); do
        echo "$(date +%s)  $1 test ${i}"
        #sudo mysql -h localhost -P 3333 -u root -psecret mysqlslap -vvv -e "${query}"
        winpty docker run -it mysql --rm mysql -h localhost -P 3333 -u root -psecret mysqlslap -vvv -e "SELECT * FROM t1 WHERE charcol1 LIKE '%ag%' ORDER BY intcol2 LIMIT 1;" 2>&1
    done;
done;
