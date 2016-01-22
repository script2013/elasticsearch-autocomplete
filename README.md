# elasticsearch-autocomplete
Autocomplete example for elasticsearch

Steps:

1. Configure elasticsearch

in config/elasticsearch.yml add the following

http.cors.enabled: true
http.cors.allow-origin : "*"
http.cors.allow-methods : OPTIONS, HEAD, GET, POST, PUT, DELETE
http.cors.allow-headers : X-Requested-With,X-Auth-Token,Content-Type, Content-Length

Those are required to allow the demo webpage (demo.html) to access elasticsearch.

2. Install nodejs or python one of which will provide a simple webserver

3. Configure the index and the suggesters

4. 


#References:

https://github.com/elastic/elasticsearch/issues/9377

http://jontai.me/blog/2013/02/adding-autocomplete-to-an-elasticsearch-search-application/

https://developer.rackspace.com/blog/qbox/#.UZ0yEWRATQ4
