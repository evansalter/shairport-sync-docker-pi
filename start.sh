#systemctl start dbus
#RUN /etc/init.d/dbus start
#RUN /etc/init.d/avahi-daemon start
#systemctl enable avahi-daemon
#systemctl start avahi-daemon

service dbus start
service avahi-daemon start

shairport-sync
