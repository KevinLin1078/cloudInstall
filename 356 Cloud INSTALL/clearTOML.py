# connection settings

# connect to MongoDB using the following URL
mongo-url = "mongodb://localhost:27017"
# connect to the Elasticsearch REST API at the following node URLs
elasticsearch-urls = ["http://localhost:9200" ]

# frequently required settings

# if you don't want to listen for changes to all collections in MongoDB but only a few
# e.g. only listen for inserts, updates, deletes, and drops from mydb.mycollection
# this setting does not initiate a copy, it is a filter on the oplog change listener only
namespace-regex = '^stack\.question$'


# direct-read-namespaces = ["mydb.mycollection", "db.collection", "test.test"]
# change-stream-namespaces = ["stack.question"]

# additional settings

dropped-collections = true
# propogate dropped databases in MongoDB as index deletes in Elasticsearch
dropped-databases = true

replay = false
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

# [[mapping]]
# namespace = "stack.question"
# index = "question"
# type = "place"