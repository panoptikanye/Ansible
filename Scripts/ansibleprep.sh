#!

## Prep fresh installs for Ansible
## Remember to chmod +x

# clear known hosts
#> ~/.ssh/known_hosts

# create /.ssh
mkdir ~/.ssh

# create new key without password
ssh-keygen -C "fedora" -t ed25519 -f ~/.ssh/id_ed25519 -q -N ""

 
