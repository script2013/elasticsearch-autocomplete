#docs: https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-analyze.html

curl -XGET 'localhost:9200/simple-search/_analyze?pretty' -d '{
  "analyzer": "autocomplete",
  "text" : "quick brown"
}
'

#https://www.elastic.co/guide/en/elasticsearch/guide/current/ngrams-compound-words.html
curl -XGET 'localhost:9200/simple-search/_analyze?pretty' -d '{
  "analyzer": "trigrams",
  "text" : "quick brown"
}
'

curl -XGET 'localhost:9200/phrase-search/_analyze?pretty' -d '{
  "analyzer": "shingle_analyzer",
  "text" : "quick brown fox ate the poor rabbit"
}
'
