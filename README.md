# AWSDockermachine
Script to install all Docker machine components on AMI

The script installs
- noip
- Docker-machine

It also configure these services to run at startup

It could also optionally (set the appropriate flag=1)  install go in the AMI

Please run "sudo yum install -y git" in the AMI **BEFORE** launching 

## HOW TO USE:

Download the code and exceute it :)

```
git clone https://github.com/FabioChiodini/AWSDockermachine

cd AWSDockermachine

./AWSDMain.sh

```

## noip Configuration

If you want to configure noip: please run "sudo noip2 -C" to customize noip settings after running the script

This will populate the configuration file

noipservices will run automatically at every reboot

Tested on a t1.micro AMI

@FabioChiodini
