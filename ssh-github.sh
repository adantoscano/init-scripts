#!/bin/bash

echo "email: "

read email

mkdir -p ~/.ssh/keys

ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/keys/github-rsa

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/keys/github-rsa

echo "
# GitHub.com server
Host github.com
IdentityFile ~/.ssh/keys/github-rsa
" >> ~/.ssh/config

echo "

////////////////////////////////////////////////////////////////////
1. go to https://github.com/settings/keys

2. copy and paste the text below
////////////////////////////////////////////////////////////////////

"
cat ~/.ssh/keys/github-rsa.pub
