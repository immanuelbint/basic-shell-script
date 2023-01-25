#!/bin/bash

# script membuat multiple user dengan custom password

# define username multiple user
username="user1 user2 user3"

# Running loop create multiple user

for i in $username; do useradd "$i"; done

# define a password for every created user
# example password={username}:{password}

password="user1:user1 user2:user2 user3:user3"

# running loop chpasswd

for i in $password; do echo "$i" | chpasswd; done

# grant sudoers multiple user (optional)

read -r -p "Do you want to grant sudoers to newly created user? [y/n] => " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    for i in $user; do usermod -aG wheel "$i"; done
else
    exit 0
fi
