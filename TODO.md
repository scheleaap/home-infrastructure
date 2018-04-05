## WIP

ECHT READ-ONLY MOUNTEN WERKT NIET GOED OMDAT SSL-CERTIFICATEN DAN NIET MEER KUNNEN WORDEN GECONTROLEERD

OP DE EEN OF ANDERE MANIER WERKT HET INSTALLEREN VAN SNAPCAST MET ANSIBLE NIET MEER GOED -
IS DIT EEN TIJDELIJK PROBLEEM OF WORDT HET OP DE EEN OF ANDERE MANIER DOOR HET
READ-ONLY MOUNTEN VEROORZAAKT?

find / -cmin -10 | grep -Pv "(^/proc|^/sys|^/run|^/tmp|^/var/log|^/var/lib/mopidy|^/var/cache/mopidy|^/var/lib/snapserver)"

import requests
requests.get("https://auth.mopidy.com")
requests.get("https://auth.mopidy.com", cert="/tmp/auth.mopidy.com.crt")

echo -n | openssl s_client -connect auth.mopidy.com:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/auth.mopidy.com.crt
echo | openssl s_client -showcerts -servername auth.mopidy.com -connect auth.mopidy.com:443 2>/dev/null | openssl x509 -inform pem -noout -text

```py
root@framboos:/home/pi# cat certtest.py
#!/usr/bin/env python

try:
    import urllib2 #python2
except:
    import urllib.request as urllib2 #python3
import sys

req = urllib2.Request(sys.argv[1], headers={'User-Agent':'Mozilla/5.0'})
urllib2.urlopen(req)
```


## Mopidy

- Start service (/)
- Mopidy-Spotify-Tunigo (/)
- Mopidy-Soundcloud (/)
- Mopidy-Scrobbler (/)
- UI (/)
  Candidates:
  - https://github.com/jaedb/iris: looks good, responsive, Spotify focus
  - https://github.com/dirkgroenen/mopidy-mopify: looks good, responsive, Spotify focus
  - https://github.com/matgallacher/mopidy-material-webclient: not supported
  - https://github.com/tkem/mopidy-mobile: also available as Android app
  - https://github.com/martijnboland/moped: looks okay as general client
  - https://github.com/pimusicbox/mopidy-musicbox-webclient: might be okay as general client
  - https://github.com/Lesterpig/mopidy-party: not sure what it does
  - https://docs.mopidy.com/en/latest/clients/mpd/#mpd-web-clients
  - https://populrr.com/: entirely different collaborative Spotify party service
- Android
  Candidates:
  - http://remotedy.com/
  - https://play.google.com/store/apps/details?id=at.co.kemmer.mopidy_mobile&hl=nl

## General & Other

- Install Kodi + plugins + configure proxy NL
- Automatic Raspbian updates
- Store Ansible secrets
- Install SSH keys
- Infrared control
