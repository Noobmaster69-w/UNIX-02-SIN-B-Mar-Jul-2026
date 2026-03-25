gpg --full-generate-key #genera llave publica
gpg --armor --export #export public key
gpg --import  ag_llave_publica.asc # import public key
echo "burrito pizza?" > doc_no_cifrado2.txt # write the message
cat doc_no_cifrado2.txt # to check the message
gpg --output doc_cifrado.txt --encrypt --recipient FD999E623F0E6A05942CE911A91C2A6252985C72 #we encrypt
gpg --decrypt ag_doc_cifrado.txt #We decrypted the message
gpg --output doc_no_cifrado2.txt --clearsign doc_no_cifrado2.txt #document with signature
gpg --verify ag_doc_no_cifrado_firmado.txt #verification
gpg --edit-key FD999E623F0E6A05942CE911A91C2A6252985C72 # we give level of trust 
gpg --sign-key A91C2A6252985C72 #We signed the key to ratify