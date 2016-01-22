echo curl -XPUT "http://localhost:9200/simple-search/_mapping/tag?pretty" -d'
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
       "search_analyzer": "trigrams",
       "payloads": false
    }
  }
}'

#source: https://developer.rackspace.com/blog/qbox/#.UZ0yEWRATQ4
curl -XPUT "http://localhost:9200/phrase-search/_mapping/titles?pretty" -d'{
  properties: {
    title: {
       type: "multi_field",
       fields: {
          title: { type: "string" },
          sortable: { type: "string", index: "not_analyzed" },
          shingle_autocomplete: { type: "string", index_analyzer: "shingle_analyzer" }
       }
    }
  }
}'
