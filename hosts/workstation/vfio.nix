{ config, pkgs, ... }:

{
  boot.kernelParams = [ "amd_iommu=on" ];
  boot.blacklistedKernelModules = [ "nvidia" "nouveau" ];
  boot.kernelModules = [ "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];

  services.udev.extraRules = ''
    SUBSYSTEM=="vfio", OWNER="root", GROUP="wheel"
    SUBSYSTEM=="input", OWNER="root", GROUP="wheel"
  '';

  security.pam.loginLimits = [
    { domain = "nemesis"; item = "memlock"; type = "soft"; value = "24000000"; }
    { domain = "nemesis"; item = "memlock"; type = "hard"; value = "24000000"; }
  ];

  boot.postBootCommands = ''
    DEVS="0000:10:00.0 0000:10:00.1 0000:0b:00.0 0000:04:00.0"

    echo -n "0000:04:00.0" > /sys/bus/pci/drivers/nvme/unbind
    echo -n "0000:0b:00.0" > /sys/bus/pci/drivers/xhci_hcd/unbind
    for DEV in $DEVS; do
      echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
    done
 ''; 
}
