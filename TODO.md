Disable HDMI on braam:

Based on https://forums.raspberrypi.com/viewtopic.php?p=1935276

I have first reverted back to the old (non-KMS) driver

Disable HDMI: /opt/vc/bin/tvservice -o
Enable HDMI again: /opt/vc/bin/tvservice -o

Perhaps it would be enough to change the asound configuration
