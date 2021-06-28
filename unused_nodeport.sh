####### unused port in nodeport service ###########

!/bin/bash
IFS=$'\n'
var=$(kubectl describe service -A| grep "NodePort\:" | awk -F'/' '{print $1}' | awk '{print $3}' | tr -d ' ')
for range in {30000..32767}
do

       var=$(kubectl describe service -A| grep "NodePort\:" | awk -F'/' '{print $1}' | awk '{print $3}' | tr -d ' ')

var1=$(echo $var | grep $range)
if [ -z "$var1" ]
then
      echo "port $range is unused port" >> result.txt
else
      echo "Port $range is used port" >> result.txt
fi
done