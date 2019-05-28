# docker-magicmirror-mqtt

This repo houses the Docker files needed to allow testing of the MMM-MQTTfloorplan module in isolation.

The simplest option is to run `docker-compose up -d` which will bootstrap things for you.
Once complete, point your browser to http://localhost:8080 to see the Magic Mirror interface, and use an MQTT
client (e.g. MQTT-Lens, a Chrome extension) to publish messages.

If you want to manage the docker images one at a time, then use the dock-build.sh and dock-run.sh scripts, respectively.

The config file included in this repo includes examples of all object types. Simply use the topic name from the config file with values of on/off/open/closed etc to see the objects change state. The MQTT broker will also show up on localhost, this time using the default MQTT port of 1883 to publish and subscribe messages. The default eclipse-mqtt config is used, with no security - so beware !