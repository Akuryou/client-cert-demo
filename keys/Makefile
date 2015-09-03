all: server.key server.csr server.crt

server.key:
	openssl genrsa -des3 -out server.key 2048

server.csr:
	openssl req -new -key server.key -out server.csr

server.crt:
	openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

.PHONY: clean
clean:
	rm server.*
