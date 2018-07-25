#!/usr/bin/env ruby
#coding: utf-8

def check_ssid
    ret = `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | /usr/bin/grep -ie '^\s*ssid'  | cut -d ":" -f 2`
    ret.strip!
    return ret
end

ssid = check_ssid

puts ssid

exit if ssid == ""

case ssid

when /abcde/i
    puts 'manual'
     `/usr/sbin/networksetup -setmanual Wi-Fi 192.168.1.2 255.255.255.0 192.168.1.1`

else
    puts 'auto'
     `/usr/sbin/networksetup -setdhcp Wi-Fi`
end
