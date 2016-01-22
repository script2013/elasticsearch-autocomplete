echo curl -XPUT 'localhost:9200/simple-search?pretty' -d '
{
    "settings" : {
        "index" : {
            "number_of_shards" : 10,
            "number_of_replicas" : 1,

            "analysis": {
                        "filter": {
                            "autocomplete_filter": { 
                                "type":     "edge_ngram",
                                "min_gram": 1,
                                "max_gram": 20
                            },

                            "ngram_filter_for_better_autocomplete":{
                              "type":"ngram",
                              "min_gram":2,
                              "max_gram":15
                            },

                            "trigrams_filter": {
                                "type":     "ngram",
                                "min_gram": 3,
                                "max_gram": 3
                            }
                        },
                        "analyzer": {
                            "worse_autocomplete": {
                                "type":      "custom",
                                "tokenizer": "standard",
                                "filter": [
                                    "lowercase",
                                    "autocomplete_filter" 
                                ]
                            },

                            "trigrams": {
                                "type":      "custom",
                                "tokenizer": "standard",
                                "filter":   [
                                    "lowercase",
                                    "trigrams_filter"
                                ]
                            },

                            "autocomplete":{
                              "type":"custom",
                              "tokenizer":"standard",
                              "filter":[ "standard", "lowercase", "stop", "kstem", "ngram_filter_for_better_autocomplete" ] 
                            }

                        }
                    }
        }
    }
}
'
curl -XPUT 'localhost:9200/phrase-search?pretty' -d '{
 settings: {
  "index" : {
      "number_of_shards" : 10,
      "number_of_replicas" : 1,

      analysis: {
       filter: {
        shingle_filter: {
         type: "shingle",
         min_shingle_size: 2,
         max_shingle_size: 5
        }
       },
       analyzer: {
        shingle_analyzer: {
         type: "custom",
         tokenizer: "standard",
         filter: ["lowercase", "shingle_filter"]
        }
       }
      }
    }
  }
}'
