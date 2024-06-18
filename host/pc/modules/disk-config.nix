#{ inputs, ... }: 
{
  # partion label will be auto generate - disk-nvme-esp
  disko.devices = {
    disk = {
      nvme = {
        type = "disk";
        #device = "/dev/disk/by-uuid/5373613d-2eb4-4b46-aa17-64eeb3cd21b5";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            esp = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              size = "24G";
              content ={
                type = "swap";
                resumeDevice = true;
              };
            };
            rootfs = {
              size = "250G";
              content = {
                type = "btrfs";
                extraArgs = ["-f"];    # Override existing partition         
                subvolumes = {
                  persist = {
                    mountpoint = "/persist";
                    mountOptions = [ 
                      "compress=lzo" 
                      "noatime" 
                      "subvol=persist"
                    ];
                  };
                  nix = {
                    mountpoint = "/nix";
                    mountOptions = [ 
                      "compress=lzo" 
                      "noatime" 
                      "subvol=nix"
                    ];
                  };
                  rootfs = {
                    mountpoint = "/";
                    mountOptions = [ 
                      "compress=lzo" 
                      "noatime" 
                      "subvol=nix"
                    ];
                  };
                };
              };
            };
          };
        };
      };
    };
#    nodev = {
#      "/" = {
#        fsType = "tmpfs";
#        mountOptions = [ 
#          "size=6G" 
#          "mode=755"
#          "noatime"
#          "defaults"
#        ];
#      };
#    };
  };

  # fileSystems = {
  #   "/".neededForBoot = true;
  #   "/nix".neededForBoot = true;
  #   "/home".neededForBoot = true;
  #   "/boot".neededForBoot = true;
  #   "/persist".neededForBoot = true;
  # };
}

