#!/bin/bash

text="Good morning everyone. My name is Polly. I've got 99 problems but text to speech ain't one."
audio_file=speech.mp3

aws polly synthesize-speech \
  --output-format "mp3" \
  --voice-id "Joanna" \
  --text "$text" \
  $audio_file

s3bucket=BUCKETNAME
aws s3 cp --acl public-read $audio_file s3://$s3bucket/$audio_file

from_phone="+1xxxxxxxxxx"      # Your Twilio allocated phone number
to_phone="+1xxxxxxxxxx"        # Your phone number to call

TWILIO_ACCOUNT_SID="ABCDE"     # Your Twilio account SID
TWILIO_AUTH_TOKEN="abcde"      # Your Twilio auth token

speech_url="https://s3.amazonaws.com/$s3bucket/$audio_file"
twimlet_url="http://twimlets.com/message?Message%5B0%5D=$speech_url"

curl -XPOST https://api.twilio.com/2010-04-01/Accounts/abc...8f/Calls.json \
  -u "$TWILIO_ACCOUNT_SID:$TWILIO_AUTH_TOKEN" \
  --data-urlencode "From=$from_phone" \
  --data-urlencode "To=$to_phone" \
  --data-urlencode "Url=$twimlet_url"
