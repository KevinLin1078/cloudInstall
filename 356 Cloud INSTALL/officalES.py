from datetime import datetime
from elasticsearch import Elasticsearch
from elasticsearch_dsl import Search
es = Elasticsearch([{'host': '130.245.168.89', 'port': 9200}])



def filter_with_query(query, timestamp, limit, sort_by, tags, has_media, accepted):
   must_not ={ "should":[] ,"must": [  { "range": { "timestamp": { "lte": timestamp }}}], 'must_not': [] }
   
   if len(query) != 0:
      must_not['should'].append(   {"match" : {"title": query }})
      must_not['should'].append(   {"match" : {"body": query }})

   if accepted == True:
      must_not['must'].append({ "exists": {"field": "accepted_answer_id" }}   ) # field must exist

   if has_media == True:
      must_not['must_not'].append( {"terms" : { "media" : [] }} )
   
   if tags != []:
      for item in tags:
         term = {"terms" : {'tags': [item]}} 
         must_not['must'].append(term)
   
      
   body={
         "sort" : [{ sort_by : {"order" : "desc"}}],
         "from" : 0, "size" : limit,
         "query" : {
            "constant_score" : {
               "filter" : { 
                  "bool" : must_not
               }
            }
         }
      }

   questFilter =[]
   res = es.search(index="test-index", body=body)
   for hit in res['hits']['hits']:
      # print( hit["_source"])
      temp = {    
               'id': str(q['_id']),
               'title':q["_source"]['title'],
               'body': q["_source"]['body'],
               'tags': q["_source"]['tags'],
               'answer_count': 0,
               'media': q["_source"]['media'],
               'accepted_answer_id': q["_source"]['accepted_answer_id'] ,
               'user':q["_source"]['user'],
               'timestamp': q["_source"]['timestamp'],
               'score': q["_source"]['score'],
               "view_count": q["_source"]['view_count']
            }
      questFilter.append(temp)
