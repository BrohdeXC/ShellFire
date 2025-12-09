#!/bin/bash

export DISPLAY=:1

# Load Xresources (dark mode)
xrdb -merge /root/.Xresources 2>/dev/null

pkill Xtigervnc 2>/dev/null
pkill websockify 2>/dev/null

Xtigervnc :1 \
  -geometry 1920x1080 \
  -depth 24 \
  -rfbport 5901 \
  -SecurityTypes VncAuth \
  -PasswordFile /root/.vnc/passwd \
  -localhost=0 &

sleep 2

# noVNC
websockify --web=/usr/share/novnc/ 8080 localhost:5901 &
sleep 1

# Force scaling by modifying the noVNC index.html settings
sed -i 's/"resize": false/"resize": true/' /usr/share/novnc/app/ui.js 2>/dev/null || true
sed -i 's/"scaleViewport": false/"scaleViewport": true/' /usr/share/novnc/app/ui.js 2>/dev/null || true
sed -i 's/"autoresize": false/"autoresize": true/' /usr/share/novnc/app/ui.js 2>/dev/null || true

# Fix dbus launch
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Start xterm AFTER loading Xresources
xterm

