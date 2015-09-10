#!/bin/sh
echo -n "create keys with passwords? (y/N)"
read var

if echo "$var" | grep -iq "^y" ;then
    echo "creating server private key..."
	openssl genrsa -des3 -out server.key 4096
    echo "creating client private key..."
	openssl genrsa -des3 -out client.key 4096
else
    echo "creating server private key..."
   	openssl genrsa -out server.key 4096
    echo "creating client private key..."
	openssl genrsa -out client.key 4096
fi

echo "creating server certificate"
openssl req -new -x509 -days 365 -key server.key -out server.crt

echo "creating client certificate signing request"
openssl req -new -key client.key -out client.csr

echo "signing client certificate"
openssl x509 -req -days 365 -in client.csr -CA server.crt -CAkey server.key -set_serial 01 -out client.crt

echo "converting client certificate to pkcs12"
openssl pkcs12 -export -clcerts -in client.crt -inkey client.key -out client.p12

echo "converting client certificate to der"
openssl x509 -in client.crt -inform PEM -out cliet.der.crt -outform DER
