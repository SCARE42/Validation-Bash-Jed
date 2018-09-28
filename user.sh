#!/bin/bash

echo 'install package'
sudo apt update
sudo apt install apache2 php7.0 -y
rm index.html
 echo 'done'


