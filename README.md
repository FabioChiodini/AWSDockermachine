# AWSDockermachine
Script to install all Docker machine components on AMI

The script installs
- noip
- Docker-machine

It could also optionally (set the appropriate flag=1)  install go in the AMI

Please run "sudo yum install -y git" in the AMI **BEFORE** launching 

## HOW TO USE:

git clone https://github.com/FabioChiodini/AWSDockermachine

cd AWSDockermachine



./AWSDMain.sh

## noip Configuration

If you want to configure noip: Please run "sudo noip2 -C" to customize noip settings after running the script


Tested on a t1.micro AMI

@FabioChiodini
