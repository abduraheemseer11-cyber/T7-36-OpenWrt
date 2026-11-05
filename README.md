# AbduRaheem OpenWrt - 360 T7

GitHub Actions cloud build of ImmortalWrt firmware for the **Qihoo 360 T7** (MT7981, Wi-Fi 6 / AX).

## Defaults
- Branding: **AbduRaheem OpenWrt** (banner, release info, hostname `AbduRaheem-OpenWrt`)
- LuCI language: **English**
- LAN IP: **192.168.1.20** — user `root`, no password
- DHCP server (v4 + v6): **disabled**; IPv6: **disabled**
- Wi-Fi 2.4 GHz: AP, HE20 (AX), channel 4, 30 dBm, SSID `AL-AMEER-NET_2G`, open, network lan
- Wi-Fi 5 GHz: AP + WDS, HE40 (AX), channel 116, 28 dBm, SSID `AL-AMEER-NET_5G`, open, network lan

Edit the top of `files/etc/uci-defaults/99-abduraheem` to change IP, SSID number `( )`, country code, etc.

## Build
1. Upload this project to your GitHub repo.
2. Actions → `AbduRaheem-OpenWrt-360T7` → Run workflow.
3. Download from Releases/Artifacts. Normal upgrade: `*sysupgrade.itb` (do not keep settings).
