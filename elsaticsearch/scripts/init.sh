curl -X PUT "localhost:9200/productos"

curl -X PUT "localhost:9200/productos/doc/1" -H 'Content-Type: application/json' -d @./datos-productos/producto1.json

curl -X PUT "localhost:9200/productos/doc/2" -H 'Content-Type: application/json' -d @./datos-productos/producto2.json

curl -X PUT "localhost:9200/productos/doc" -H 'Content-Type: application/json' -d @./datos-productos/producto3.json