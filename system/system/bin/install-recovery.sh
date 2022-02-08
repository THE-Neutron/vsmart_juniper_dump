#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:20c5cd1929a81bfaaa4780944a5fdc1c186fb74f; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:1aa2c908fcc5d831428f721430100a72abf15da9 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:20c5cd1929a81bfaaa4780944a5fdc1c186fb74f && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
