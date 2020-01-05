#install python
sudo ufw allow "OpenSSH"
sudo ufw enable
sudo apt-get update
sudo apt-get install -y python
sudo apt-get install -y python-pip

#install cassandra
echo "deb http://www.apache.org/dist/cassandra/debian 22x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
echo "deb-src http://www.apache.org/dist/cassandra/debian 22x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
sudo apt-get update
gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D
gpg --export --armor F758CE318D77295D | sudo apt-key add -
gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00
gpg --export --armor 2B5C1B00 | sudo apt-key add -
gpg --keyserver pgp.mit.edu --recv-keys 0353B12C
gpg --export --armor 0353B12C | sudo apt-key add -
sudo apt-get update
sudo apt-get install cassandra -y
sudo service cassandra start

#install apache
sudo apt-get update
sudo apt-get install -y apache2 libapache2-mod-wsgi
sudo a2enmod wsgi 
sudo ufw allow "Apache Full"
sudo apt-get install -y curl


#install Mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl enable mongod
sudo systemctl restart mongod
sudo ufw allow 27017

#install java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt install openjdk-8-jre -y
java -version

#install cassandra
echo "deb http://www.apache.org/dist/cassandra/debian 22x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
echo "deb-src http://www.apache.org/dist/cassandra/debian 22x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
sudo apt-get update
gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D
gpg --export --armor F758CE318D77295D | sudo apt-key add -
gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00
gpg --export --armor 2B5C1B00 | sudo apt-key add -
gpg --keyserver pgp.mit.edu --recv-keys 0353B12C
gpg --export --armor 0353B12C | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y cassandra
sudo service cassandra start


#install Flask 
sudo python -m pip install flask
sudo python -m pip install pymongo
sudo python -m pip install flask_cors
sudo python -m pip install flask_mail
sudo python -m pip install cassandra-driver
sudo python -m pip install uwsgi

#install sendmail
sudo apt-get install -y sendmail

#install Cache
sudo ufw allow 11211
sudo apt-get update
sudo apt-get install -y memcached



sudo python -m pip install python-memcached
sudo nano /etc/memcached.conf


sudo systemctl restart memcached
sudo netstat -ntlp
python





# # def connectM():
# import memcache
# cash = memcache.Client(['130.245.171.132:11211'])
# cash.set('key', 'jfsdf')
# print cash.get('key')

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update
sudo apt-get install -y elasticsearch
sudo python -m pip  install elasticsearch
sudo ufw allow 9200 



sudo nano /etc/elasticsearch/elasticsearch.yml

sudo apt-get install golang-go -y
scp -C -i ~/.ssh/key.pem -r build/* ubuntu@130.245.170.57:/home/ubuntu/build

sudo systemctl enable elasticsearch
sudo systemctl restart elasticsearch
curl -X GET "localhost:9200"

sudo nano .bashrc
export PATH="/home/ubuntu/build/linux-amd64:$PATH"
source ~/.bashrc
monstache -f config.toml -worker P &  monstache -f config.toml -worker E & monstache -f config.toml -worker N

input {
	mongodb {
		uri => "mongodb://localhost:27017/stack"
		database  => "stack"
		placeholder_db_dir => "/home/ubuntu/mongoDATA"
		placeholder_db_name => "ElasticQuestion.db"
		collection => "question"
	}
}



output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => "ElasticQuestion"
  }
}




filter {
	mutate {
		remove_field => [ "_id" ]
	}
}



# 
rs.initiate() 
rs.conf()
rs.status()