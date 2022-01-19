#!

## Prep fresh installs for Ansible
## Remember to chmod +x

# clear known hosts
> ~/.ssh/known_hosts

# create /.ssh
#mkdir ~/.ssh

# create new key without password
ssh-keygen -C "fedora" -t ed25519 -f ~/.ssh/id_ed25519 -q -N ""
### !!! REMEMBER TO COPY IDENTITY OF EACH NEW NODE TO ANSIBLE CONTROLLER, THEN COPY ANSIBLE CONTROLLER IDENTITIES TO EACH NEW NODE !!!
### --- ex: ssh-copy-id -i ~/.ssh/id_ed25519.pub [USERNAME]@xxx.xxx.xxx.xxx
