{
  disko.devices = {
    disk = {
      # SSD - 負責系統啟動與核心檔案
      ssd = {
        type = "disk";
        device = "/dev/disk/by-id/ata-PLEXTOR_PX-256S3C_P02847114839";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "fmask=0077"
                  "dmask=0077"
                ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };

      # HDD - 負責所有使用者資料
      hdd = {
        type = "disk";
        device = "/dev/disk/by-id/ata-HGST_HTS721010A9E630_JR10044M2L5A2M";
        content = {
          type = "gpt";
          partitions = {
            home = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
              };
            };
          };
        };
      };
    };
  };
}
