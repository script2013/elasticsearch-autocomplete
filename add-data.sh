curl -XPUT "http://localhost:9200/simple-search/tag/1?refresh=true&pretty" -d'
	{
   "tag_name": "blog",
   "tag_suggest_simple_analyzer": {
      "input": ["blog", "writing"],
      "output": ["Blogger"]
    },
   "tag_suggest_trigrams": {
      "input": ["blog", "writing"],
      "output": ["Blogger"]
    }
  }
'

curl -XPUT "http://localhost:9200/simple-search/tag/2?refresh=true&pretty" -d'
	{
   "tag_name": "magazine",
   "tag_suggest_simple_analyzer": {
      "input": "magazine"
    },
   "tag_suggest_trigrams": {
      "input": "magazine"
    }
  }
'

curl -XPUT "http://localhost:9200/simple-search/tag/3?refresh=true&pretty" -d'
	{
   "tag_name": "reblogging",
   "tag_suggest_simple_analyzer": {
      "input": "reblogging"
    },
   "tag_suggest_trigrams": {
      "input": "reblogging"
    }
  }
'
