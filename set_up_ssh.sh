echo "setting up ssh for github"
ssh-keygen -t rsa -b 4096 -C "jomitsch@redhat.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
echo "copy and paste that to github ssh keys"

