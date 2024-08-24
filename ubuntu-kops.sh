#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#source .bashrc


#! /bin/bash
apt update -y
apt upgrade -y
apt install awscli -y
aws configure
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.25.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops

aws s3api create-bucket --bucket mybuckdine.k8s.local --region ap-south-1
aws s3api put-bucket-versioning --bucket mybuckdine.k8s.local --region ap-south-1 --versioning-configuration Status=Enabled
export KOPS_STATE_STORE=s3://mybuckdine.k8s.local
kops create cluster --name dinesh.k8s.local --zones ap-south-1 --master-count=1 --master-size t2.medium --node-count=2 --node-size t2.micro
kops update cluster --name dinesh.k8s.local --yes --admin
