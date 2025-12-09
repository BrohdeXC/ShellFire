# --------------------------------
# ----------- BASE ---------------
# --------------------------------

FROM kalilinux/kali-rolling as base

# Install VNC + noVNC + tools
RUN apt update && apt install -y \
    tigervnc-standalone-server menu \
    novnc websockify python3-websockify \
    xterm iputils-ping iproute2 openbox python3-xdg fastfetch \
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

# Put fastfetch into the .bashrc
RUN echo "fastfetch" >> /root/.bashrc

# Expose noVNC web port
EXPOSE 8080

WORKDIR "/root"

CMD ["/start.sh"]

# --------------------------------
# -------- TEAM LEAD -------------
# --------------------------------
FROM base as teamlead

RUN apt install -y wireshark

# --------------------------------
# ------ RECON SPECIALIST --------
# --------------------------------

FROM base as reconspecialist

RUN apt install -y wireshark

# --------------------------------
# ------ SCANNING AND RECON ------
# --------------------------------

FROM base as scanningandrecon

RUN apt install -y wireshark

# --------------------------------
# -------- EXPLOITATION ----------
# --------------------------------

FROM base as exploitation

RUN apt install -y wireshark

# --------------------------------
# ------- MOVE / ESCALATE --------
# --------------------------------

FROM base as movement

RUN apt install -y wireshark

# --------------------------------
# ------- PERSISTENCE ------------
# --------------------------------

FROM base as persistence

RUN apt install -y wireshark

# --------------------------------
# ------- CREDS AND EXFIL --------
# --------------------------------

FROM base as credsandexfil

run apt install -y wireshark
