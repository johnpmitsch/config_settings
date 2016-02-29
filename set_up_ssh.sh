echo "setting up ssh for github"
ssh-keygen -t rsa -b 4096 -C "jomitsch@redhat.com"
NEW_KEY="$(cat ~/.ssh/id_rsa.pub)"
HOSTNAME="$(hostname -f)"
echo "$(echo $NEW_KEY)"
echo "copying and pasting that to github ssh keys"
curl -u "johnpmitsch" --data '{"title":"'"$HOSTNAME"'","key":"'"$NEW_KEY"'"}' https://api.github.com/user/keys
eval `ssh-agent`
ssh-add
