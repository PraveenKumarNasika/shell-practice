#!/bin/bash

satrt_date=$(date +%s)

sleep 10

end_date=$(date +%s)

Total_Time=$(($end_date-$start_date))

echo "script execution time is $Total_Time"

