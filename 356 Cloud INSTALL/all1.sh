#install python
sudo ufw allow "OpenSSH"
sudo ufw enable
sudo apt-get update
sudo apt-get install golang-go -y

sudo apt-get update
sudo apt-get install -y python
sudo apt-get install -y python-pip
sudo apt-get install -y sendmail

#install apache

sudo apt-get update
sudo apt-get install -y apache2 libapache2-mod-wsgi
sudo a2enmod wsgi 
sudo ufw allow "Apache Full"
sudo apt-get install -y curl


#install java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt install openjdk-8-jre -y
java -version


#install Flask 
sudo python -m pip install flask
sudo python -m pip install pymongo
sudo python -m pip install flask_cors


sudo python -m pip install flask_mail
sudo python -m pip  install elasticsearch

sudo python -m pip install cassandra-driver

#Install elastic 
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update
sudo apt-get install -y elasticsearch

sudo ufw allow 9200 

sudo nano /etc/elasticsearch/elasticsearch.yml


sudo systemctl enable elasticsearch
sudo systemctl restart elasticsearch
curl -X GET "localhost:9200"


###############################Remove and INstall elastic search
sudo apt-get --purge autoremove elasticsearch -y
sudo rm -rf /var/lib/elasticsearch/
sudo rm -rf /etc/elasticsearch

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
sudo apt-get update && sudo apt-get install elasticsearch=2.4.6 -y


sudo nano /etc/elasticsearch/elasticsearch.yml
sudo systemctl enable elasticsearch
sudo systemctl restart elasticsearch
curl -X GET "localhost:9200"


#########################################################

sudo nano .bashrc
export PATH="/home/ubuntu/build/linux-amd64:$PATH"
source ~/.bashrc
##########################################################

#cd ~ ; sudo mkdir build; sudo chmod 777 build; 

sudo rm config.toml
sudo rm -rf build/*; 
exit
cd desktop; scp -C -i ~/.ssh/kkey.pem -r build2/* ubuntu@130.245.170.76:/home/ubuntu/build

sudo mv ~/build/config.toml .
########################################################################################################
sudo nano /lib/systemd/system/monstache.service

########################################

[Unit]
Description=monstache sync service

[Service]
Type=notify
ExecStart=/home/ubuntu/build/linux-amd64/monstache -f /home/ubuntu/config.toml
WatchdogSec=30s
Restart=always

[Install]
WantedBy=multi-user.target


###########################################
sudo systemctl daemon-reload
sudo systemctl enable monstache.service
sudo systemctl restart monstache.service




monstache -f config.toml -worker c &  monstache -f config.toml -worker e & monstache -f config.toml -worker d



sudo mkdir -p /var/www/FlaskApp



start_rpc: true
broadcast_rpc_address: 1.2.3.4
rpc_address: 0.0.0.0


cqlsh
CREATE KEYSPACE IF NOT EXISTS hw5 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1' };
CREATE TABLE IF NOT EXISTS hw5.imgs (fileID text PRIMARY KEY, content blob, filetype text, username text);


select count(*) from hw5.imgs;
use hw5;
drop table imgs;




sudo nano /lib/systemd/system/monstache.service