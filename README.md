# MacOSでWiFi SSID毎にマニュアルとDHCPの自動切り替え

## 導入方法
script.rbのcase部分をSSID毎に変更、実行権限を付与

    $chmod a+x script.rb

auto-wifi-config.plistを~/Library/LaunchAgents/へ移動
※script.rbのパスも忘れずに10行目

    $mv auto-wifi-config.plist ~/Library/LaunchAgents

auto-wifi-config.plistをrootオーナーへ変更  

    $sudo chown root ~/Library/LaunchAgents/auto-wifi-config.plist

登録

    $sudo launchctl load ~/Library/LaunchAgents/auto-wifi-config.plist

確認

    $sudo launchctl list | auto-wifi-config

解除

    $sudo launchctl unload ~/Library/LaunchAgents/auto-wifi-config.plist
