# SimHub Arduino code for Esp8266

## What is this?
Utility to import your SimHub Arduino Setup and (mostly) import it to a Platform.io structure setup for a ESP8266. SimHub will see it as an Arduino Mega.

## Why would you want to do this?
ESP8266 are more powerful than most Arduinos, have more RAM and most importantly, they're significantly cheaper.

## Known issues
A lot, you can mostly hook up screens and leds. I tried importing all libraries that SimHub uses but some don't support ESPs directly. However I believe some of the issues are due to timing of the processors, which can be easily addressed knowing the processor speed for esp8266 and adapting the code, but I can't do that myself right now.

## How to
- Have SimHub installed in the default location
- Dowload Platform.io (VSCode with Platformio plugin). This will replace Arduino IDE in your workflow. VSCode and Platformio are much more powerful, but more generic.
- Set up what you want in the Arduino Setup Wizard in SimHub.
- Open `setup-once.ps1` in Notepad, read what it does, understand it. (Don't just run scripts without knowing what they're doing)
- Run `setup-once.ps1` if you agree with what it does (copies what SimHub Arduino wizard set up to this folder).
- Open VSCode with Platformio and open the current folder/project.
- Verify that the code compiles
- Make sure SimHub is closed
- Compile and upload to your ESP8266
- Connect to SimHub
- Enjoy
