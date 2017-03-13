# AWSDockermachine
Script to install all Docker machine components on AMI

The script installs (and configures)
- noip
- Docker
- Docker-machine
- [Optional] go

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
Reboot the AMI aftre installation to check that all services start up correctly (noip registration)

## noip Configuration

If you want to configure noip: please run "sudo noip2 -C" to customize noip settings after running the script

This will populate the configuration file

noipservices will run automatically at every reboot

Tested on a t1.micro AMI

### Configuration

The code has flags (at the beginning of the script) to determine which actions to perform:

These are the ones that are working (others are WIP):

```
updatenoip=1
updatedocker=1
updatedockermachine=1
installgo=0
```
Set a flag to 1 to have that component installed and configured


@FabioChiodini
