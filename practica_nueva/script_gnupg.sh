gpg --full-generate-key #genera llave publica
gpg --armor --export #export public key
gpg --import  ag_llave_publica.asc # import public key
echo "burrito pizza?" > doc_no_cifrado2.txt # write the message
cat doc_no_cifrado2.txt # to check the message