# --------------------------------
# ------------ BASE --------------
# --------------------------------
FROM debian:stable as base

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

# Run Fastfetch (extra performance)
RUN fastfetch

# Expose noVNC web port
EXPOSE 8080

CMD ["/start.sh"]


# --------------------------------
# -------- TEAM LEAD -------------
# --------------------------------
FROM base as teamlead

RUN apt install -y wireshark

# --------------------------------
# ------ SOC ANALYST -------------
# --------------------------------

FROM base as socanalyst

RUN apt install -y wireshark

# --------------------------------
# ------ THREAT HUNTER -----------
# --------------------------------

FROM base as threathunter

RUN apt install -y wireshark

# --------------------------------
# ------- FORENSICS ANALYST ------
# --------------------------------

FROM base as forensicsanalyst

RUN apt install -y wireshark

# --------------------------------
# ------- NETWORK ENGINEER--------
# --------------------------------

FROM base as networkengineer

RUN apt install -y wireshark

# --------------------------------
# ------- IAM SPECIALIST ---------
# --------------------------------

FROM base as iamspecialist

RUN apt install -y wireshark

# --------------------------------
# ------- DLP MONITORING ---------
# --------------------------------

FROM base as dlpmonitoring

run apt install -y wireshark
