#!/bin/bash
service dbus start
service avahi-daemon start

shairport-sync
