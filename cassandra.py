import os
import sys
sys.path.append('/usr/local/lib/python2.7/dist-packages/')
sys.path.append('/usr/local/lib/python2.7/site-packages/')

arr =[  'sudo add-apt-repository ppa:webupd8team/java',
        'sudo apt-get update',
        'sudo apt-get install -y oracle-java8-set-default',
        'java -version',

        
        'echo "deb http://www.apache.org/dist/cassandra/debian 22x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list',
        'echo "deb-src http://www.apache.org/dist/cassandra/debian 22x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list',
        'sudo apt-get update',
        'gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D',
        'gpg --export --armor F758CE318D77295D | sudo apt-key add -',
        'gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00',
        'gpg --export --armor 2B5C1B00 | sudo apt-key add -',
        'gpg --keyserver pgp.mit.edu --recv-keys 0353B12C',
        'gpg --export --armor 0353B12C | sudo apt-key add -',
        'sudo apt-get update',
        'sudo apt-get install -y cassandra',
        'sudo service cassandra status'
#sudo nano +60 /etc/init.d/cassandra
    ]   

for i in arr:
    os.system(i)
    #sudo systemctl restart apache2i