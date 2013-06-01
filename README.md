att-sms-last-line
=================

Don't you hate when this happens?

![compiling](http://imgs.xkcd.com/comics/compiling.png)

You're nerf sword battling your teammates while your code compiles. Your boss asks what's going on. You explain to her that your code is still compiling... but, you just lied. The build failed unexpectedly!  

This tool sends an SMS to your AT&T phone when a shell command (e.g. a build script) has exited. It sends you the last line, so you know what to expect when you return to your workstation.

## Setup

1.  Edit `sms_me_last_line.sh` and specify values for `clientid` and `clientsecret`.

## Usage

1.  Run your build script and pipe the output into `sms_me_last_line.sh` specifying your phone number as a parameter:

```$ fakebuild.sh | sms_me_last_line.sh "+14158675309"
```
