#Please run "sudo yum install -y git" in the AMi before launching 
#!/bin/bash

# Toggle componentsto install 
updatenoip=1
updatedocker=1
updatedockermachine=1
installhelmclient=1
intallpython2=1
installgo=0
updatedockerswarm=0
updatedockercompose=0


echo ""
echo "Starting Install"
echo ""

# NoIP Installation
if [ $updatenoip -eq 1 ]; then
  echo ""
  echo "Installing noip"
  echo ""
sudo yum-config-manager --enable epel

sudo yum install -y noip

sudo chkconfig noip on
  echo ""
  echo "Please run sudo noip2 -C to customize noip settings"
  echo ""

fi


# Docker Installation
if [ $updatedocker -eq 1 ]; then
  echo ""
  echo "Installing Docker version: $dockerversion"
  echo ""

sudo yum update -y

sudo yum install -y docker

sudo chkconfig docker on

sudo usermod -a -G docker ec2-user

echo ""
  echo "Fixing bashrc"
  echo ""

echo "#Docker" >> ~/.bashrc
echo "eval "$(docker-machine env default)"" >> ~/.bashrc

  echo ""
  echo "Done Installing Docker-Machine"
  echo ""
fi

# Now install Docker-Machine: https://github.com/docker/machine/releases/
if [ $updatedockermachine -eq 1 ]; then
  echo ""
  echo ""

curl -L https://github.com/docker/machine/releases/download/v0.10.0/docker-machine-`uname -s`-`uname -m` > docker-machine

sudo mv -f docker-machine* /usr/local/bin

sudo chmod +x /usr/local/bin/docker-machine

  echo ""
  echo "Done Installing Docker Machine "
  echo ""
fi

# Helmclient Installation
if [ $installhelmclient -eq 1 ]; then
  echo ""
  echo "Installing Helm Client"
  echo ""
  curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
  chmod 700 get_helm.sh
  sudo ./get_helm.sh
fi

# Python2 Installation
if [ $intallpython2 -eq 1 ]; then
  echo ""
  echo "Installing Python2"
  echo ""
  sudo yum install python2
fi

# Now install Docker-Compose: https://github.com/docker/compose/releases/
if [ $updatedockercompose -eq 1 ]; then
  echo ""
  echo "Installing Docker Compose version: "
  echo ""
  curl -L https://github.com/docker/compose/releases/download/${dockercomposeversion}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  echo ""
  echo "Done Installing Docker Compose version: $updatedockercompose"
  echo ""
fi

# Now install Docker-Swarm: https://github.com/docker/swarm/releases
if [ $updatedockerswarm -eq 1 ]; then
  echo ""
  echo "Installing Docker Swarm version"
  echo ""
  if [ $installgo -eq 1 ]; then
    echo "Installing GO Version 1.4.2"
    sudo wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
    tar -xzf go1.4.2.linux-amd64.tar.gz 
    export GOROOT=/home/ec2-user/go
    export PATH=$PATH:$GOROOT/bin 
    export GOBIN=$GOROOT/bin 
    sudo mkdir ~/golang/ 
    export GOPATH=~/golang/ 
    export PATH=$GOPATH/bin:$PATH 
    echo ""
    echo "Done Installing GO "
    echo ""
  fi
  sudo pushd /opt >> /dev/null
  goworkspacepath="/opt/goworkspace/"
  if [ ! -e $goworkspacepath ]; then
      sudo mkdir $goworkspacepath >> /dev/null
      sudo chmod 777 $goworkspacepath >> /dev/null
  fi
  export GOPATH=$goworkspacepath
  echo " - Using GOPATH($GOPATH) set this in ./common.sh if you want to override"
  sudo go get github.com/docker/swarm
  sudo chmod 777 $GOPATH/bin/swarm

  sudo rm -f /usr/local/bin/swarm >> /dev/null
  sudo ln -s $GOPATH/bin/swarm /usr/local/bin/swarm

  sudo pushd >> /dev/null
  echo ""
  echo "Done Installing Docker Swarm "
  echo ""
fi

echo ""
echo "Done Installing.. Have a great day!! "
echo " @FabioChiodini "
echo ""



