#!/bin/bash
sudo apt update -y
sudo apt install sshpass -y
colors=(red green blue)
for i in {0..2}
do
j=$(($i + 4))
ip="10.0.2.$j"
sshpass -p "uux&K795k7969" \
ssh -o StrictHostKeyChecking=no ArGj@$ip bash -c  \
"'export VAR=$i
printenv | grep VAR
echo "Setting up webserver-0$i VM"
sudo apt install apache2 -y
sudo chmod -R -v 777 /var/www/
sudo curl "https://raw.githubusercontent.com/arbergjyla/Azure-Load-Balancer/main/sample.html" > /var/www/html/index.html
sed -i "s/PAGECOLOR/${colors[$i]}/g" /var/www/html/index.html
exit
'"
done
