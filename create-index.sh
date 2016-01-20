curl -XPUT 'localhost:9200/simple-search?pretty' -d '
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

                            "trigrams_filter": {
                                "type":     "ngram",
                                "min_gram": 3,
                                "max_gram": 3
                            }
                        },
                        "analyzer": {
                            "autocomplete": {
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
                            }

                        }
                    }
        }
    }
}
'
