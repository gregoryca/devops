
# This script sends the Shift+F15 key combination every 59 seconds in an effort to keep the computer awake. This key combination is less intrusive than others and is also the default for the Caffeine program. Unfortunately, this key combination triggers a malware alert on Sophos, so a native solution was needed.

$wsh = New-Object -ComObject WScript.Shell
while (1) {
  # Send Shift+F15 - this is the least intrusive key combination I can think of and is also used as default by:
  # http://www.zhornsoftware.co.uk/caffeine/
  # Unfortunately the above triggers a malware alert on Sophos so I needed to find a native solution - hence this script...
  $wsh.SendKeys('+{F15}')
  Start-Sleep -seconds 59
}
