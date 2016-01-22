curl -X POST 'localhost:9200/simple-search/_suggest?pretty' -d '{
    "tag" : {
        "text" : "bl",
        "completion" : {
            "field" : "tag_suggest_simple_analyzer",
            "fuzzy" : {
                "fuzziness" : 10
            }
        }
    }
}'

curl -X POST 'localhost:9200/simple-search/_suggest?pretty' -d '{
    "tag" : {
        "text" : "blo",
        "completion" : {
            "field" : "tag_suggest_trigrams"
        }
    }
}'

#https://qbox.io/blog/multi-field-partial-word-autocomplete-in-elasticsearch-using-ngrams
#https://www.elastic.co/blog/you-complete-me
#https://qbox.io/blog/quick-and-dirty-autocomplete-with-elasticsearch-completion-suggest

curl -X POST 'localhost:9200/phrase-search/titles/_search?pretty' -d '{
   "query": { 
      "prefix": { 
                  "shingle_autocomplete": "on" 
               } 
   } 
}'

curl -X POST 'localhost:9200/phrase-search/titles/_search?pretty' -d '{
   "query": { 
      "prefix": { 
                  "shingle_autocomplete": "microsoft windows" 
                } 
   } 
}'
