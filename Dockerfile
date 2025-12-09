FROM kalilinux/kali-rolling

# Install VNC + noVNC + tools
RUN apt update && apt install -y \
    tigervnc-standalone-server menu \
    novnc websockify python3-websockify vim \
    xterm iputils-ping iproute2 openbox python3-xdg \
    && apt clean

# Create VNC password
RUN mkdir -p /root/.vnc && \
    echo "kali" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Copy startup script
COPY start.sh /start.sh
COPY .Xresources /root/.Xresources
RUN chmod +x /start.sh && echo "openbox-session &" >> /root/.bashrc

# Proper dconf setup to silence warnings
RUN mkdir -p /etc/dconf/db/local.d && \
    touch /etc/dconf/db/local.d/00_defaults && \
    dconf update || true

# Run the openbox session (Allows full screen)
RUN openbox-session &

# Expose noVNC web port
EXPOSE 8080

CMD ["/start.sh"]

