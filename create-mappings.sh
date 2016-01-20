curl -XPUT "http://localhost:9200/simple-search/_mapping/tag?pretty" -d'
{
  "properties": {
    "tag_name" : { "type" : "string" },

    "tag_suggest_simple_analyzer": {
       "type": "completion",
       "analyzer": "simple",
       "search_analyzer": "simple",
       "payloads": false
    },

    "tag_suggest_trigrams": {
       "type": "completion",
       "analyzer": "trigrams",
       "search_analyzer": "simple",
       "payloads": false
    }
  }
}'
