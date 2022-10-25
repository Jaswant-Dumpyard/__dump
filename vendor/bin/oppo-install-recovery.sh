#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:00fe934e1a51a4e2b937c06b6dfd8b22df959016; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:8a8099b20a36e9dfbbcdc464bb03bb36a4afa65b \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:00fe934e1a51a4e2b937c06b6dfd8b22df959016 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
