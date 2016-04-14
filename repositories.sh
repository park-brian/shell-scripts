#!/bin/bash

##### Add repositories #####

sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF


sudo tee /etc/yum.repos.d/brackets.repo <<-'EOF'
[brackets]
name=Copr repo for brackets owned by mosquito
baseurl=https://copr-be.cloud.fedoraproject.org/results/mosquito/brackets/epel-7-$basearch/
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/mosquito/brackets/pubkey.gpg
enabled=1
enabled_metadata=1
EOF


sudo tee /etc/yum.repos.d/vscode.repo <<-'EOF'
[vscode]
name=Copr repo for vscode owned by mosquito
baseurl=https://copr-be.cloud.fedoraproject.org/results/mosquito/vscode/epel-7-$basearch/
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/mosquito/vscode/pubkey.gpg
enabled=1
enabled_metadata=1
EOF


sudo tee /etc/yum.repos.d/atom.repo <<-'EOF'
[atom]
name=Copr repo for atom owned by mosquito
baseurl=https://copr-be.cloud.fedoraproject.org/results/mosquito/atom/epel-7-$basearch/
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/mosquito/atom/pubkey.gpg
enabled=1
enabled_metadata=1
EOF
