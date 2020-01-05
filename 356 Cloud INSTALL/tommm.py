
mongo-url = "mongodb://130.245.168.89:27017"
elasticsearch-urls = ["http://localhost:9200" ]


namespace-regex = '^stack\.question$'
direct-read-namespaces = ["stack.question"]

dropped-collections = true
dropped-databases = true
workers = ["c", "d", "e"]
replay = false
change-stream-namespaces = ["stack.question"]

# resume processing from a timestamp saved in a previous run
resume = true
# do not validate that progress timestamps have been saved
resume-write-unsafe = false
# override the name under which resume state is saved
resume-name = "default"

# file-highlighting = true
# index GridFS files inserted into the following collections
# file-namespaces = ["users.fs.files"]
# print detailed information including request traces
# verbose = true
# enable clustering mode
cluster-name = 'StackOverflow'
# do not exit after full-sync, rather continue tailing the oplog
exit-after-direct-reads = false

[[mapping]]
namespace = "stack.question"
index = "question"
type = "place"




curl -XPOST "http://localhost:9200/dataintelindex" -d "{  
   "mappings":{  
      "question":{  
         "info":{  
            "type":"question_info"
         },
         "properties":{ 
           "body":{  
               "type":"string"
            }, 
            "title":{  
               "type":"string"
            }
         }
      }
   }
}"

monstache -f config.toml -worker t &  monstache -f config.toml -worker a & monstache -f config.toml -worker A






# mongo-url = "mongodb://127.0.0.1:27017/"
# elasticsearch-urls = ["http://localhost:9200"]

# direct-read-namespaces = [ "stack.question" ]

# gzip = true
# stats = true
# index-stats = true

# elasticsearch-max-conns = 4
# elasticsearch-max-seconds = 5
# elasticsearch-max-bytes = 8000000 

# dropped-collections = false
# dropped-databases = false

# resume = true
# resume-write-unsafe = true
# resume-name = "default"
# index-files = false
# file-highlighting = false
# verbose = true
# exit-after-direct-reads = false

# index-as-update=true
# index-oplog-time=true








# gzip = true
# stats = true
# index-stats = true
# mongo-url = "mongodb://localhost:27017"
# #mongo-pem-file = "/path/to/mongoCert.pem"
# #mongo-validate-pem-file = false
# elasticsearch-urls = ["http://localhost:9200"]
# #elasticsearch-user = ""
# #elasticsearch-password = ""
# elasticsearch-max-conns = 10
# #elasticsearch-pem-file = "/path/to/elasticCert.pem"
# elastic-validate-pem-file = false
# dropped-collections = true
# dropped-databases = true
# replay = false
# resume = true
# resume-write-unsafe = false
# resume-name = "default"
# # namespace-regex = '^mydb\.(mycollection|\$cmd)$'
# # namespace-exclude-regex = '^mydb\.(ignorecollection|\$cmd)$'
# gtm-channel-size = 200
# index-files = false
# file-highlighting = true
# file-namespaces = ["users.fs.files"]
# verbose = true
# cluster-name = 'my-application'
# direct-read-namespaces = ["stack.question"]
# exit-after-direct-reads = false




