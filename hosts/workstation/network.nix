{ config, pkgs, ... }:

{
  networking = {
    hostName = "nemesis";
    usePredictableInterfaceNames = false;
    vlans = {
      lan = { id=10; interface="eth0"; };
      mgmt = { id=300; interface="eth0"; };
    };

    useDHCP = false;
    interfaces.lan.useDHCP = true;
  };
}
