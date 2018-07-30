#!/bin/bash

echo "email: "

read email

mkdir ~/.ssh/keys

ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/keys/gitlab-rsa

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/keys/gitlab-rsa

echo "
# GitLab.com server
Host gitlab.com
IdentityFile ~/.ssh/keys/gitlab-rsa
" >> ~/.ssh/config

echo "

////////////////////////////////////////////////////////////////////
1. go to https://gitlab.com/profile/keys

2. copy and paste the text below
////////////////////////////////////////////////////////////////////

"
cat ~/.ssh/keys/gitlab-rsa.pub
