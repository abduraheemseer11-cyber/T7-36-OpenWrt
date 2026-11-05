#!/bin/bash
# AbduRaheem OpenWrt - DIY script (runs inside openwrt/ after feeds are installed)

BRAND="AbduRaheem OpenWrt"
LAN_IP="192.168.1.20"

# Default LAN IP (cover every default used by upstream)
sed -i "s/192\.168\.1\.1\b/${LAN_IP}/g; s/192\.168\.6\.1\b/${LAN_IP}/g" package/base-files/files/bin/config_generate
sed -i "s/hostname='[^']*'/hostname='AbduRaheem-OpenWrt'/" package/base-files/files/bin/config_generate

# Branding in release info
sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='${BRAND} $(date +"%Y%m%d")'/" package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_ID=.*/DISTRIB_ID='${BRAND}'/" package/base-files/files/etc/openwrt_release

# Replace upstream branding in LuCI theme templates (best effort, never fails the build)
for d in feeds/*/themes feeds/*/luci-theme-* feeds/luci/modules/luci-base/ucode/template; do
  [ -d "$d" ] || continue
  grep -rlE "ImmortalWrt|OpenWrt" "$d" --include=*.ut --include=*.htm --include=*.lua 2>/dev/null \
    | xargs -r sed -i "s/ImmortalWrt/${BRAND}/g" || true
done
exit 0
