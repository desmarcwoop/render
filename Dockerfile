FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install wget

RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

# Définir les variables d'environnement pour Render
ENV PORT=8080
ENV USERNAME=root
ENV PASSWORD=root

EXPOSE $PORT

CMD ["/bin/bash", "-c", "/bin/ttyd -p $PORT -c $USERNAME:$PASSWORD /bin/bash"]
