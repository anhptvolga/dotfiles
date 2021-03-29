openssl genrsa -out keypair.pem 2048
openssl rsa -in keypair.pem -pubout -out ${1}.key.public
openssl pkcs8 -topk8 -inform PEM -outform PEM -nocrypt -in keypair.pem -out ${1}.key
