#!/bin/bash

for i in `seq 5`
do
        {
          echo " $(date +%s) start ${i}"
               ./run.sh ${i}
        }&              #The middle section is directly executed in the background

done
wait                    #After all the tasks put in the background are completed, the
echo "END"
