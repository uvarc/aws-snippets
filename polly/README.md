# AWS Polly Text-to-Speech

Polly will generate an audio resource programmatically.

In the AWS CLI this can be called:

`aws polly synthesize-speech --output-format mp3 --voice-id "Joanna" --text "Hello everyone, this is AWS Polly" ~/Desktop/polly-test.mp3`

In boto3 you would use this method:
```python
import boto3

client = boto3.client('polly')
response = client.synthesize_speech(
    LexiconNames=[
        'string',
    ],
    OutputFormat='mp3'|'ogg_vorbis'|'pcm',
    SampleRate='string',
    Text='string',
    TextType='ssml'|'text',
    VoiceId='Geraint'|'Gwyneth'|'Mads'|'Naja'|'Hans'|'Marlene'|'Nicole'|'Russell'|'Amy'|'Brian'|'Emma'|'Raveena'|'Ivy'|'Joanna'|'Joey'|'Justin'|'Kendra'|'Kimberly'|'Salli'|'Conchita'|'Enrique'|'Miguel'|'Penelope'|'Chantal'|'Celine'|'Mathieu'|'Dora'|'Karl'|'Carla'|'Giorgio'|'Mizuki'|'Liv'|'Lotte'|'Ruben'|'Ewa'|'Jacek'|'Jan'|'Maja'|'Ricardo'|'Vitoria'|'Cristiano'|'Ines'|'Carmen'|'Maxim'|'Tatyana'|'Astrid'|'Filiz'
)
```

## Text-to-speech using aws-cli and Twilio

Read Eric Hammond's great introduction to programmatically sending dynamic phone messages to users by using Polly and Twilio.

https://alestic.com/2016/11/amazon-polly-text-to-speech/

A working example of Eric's demo can be found in `call-me.sh`.
