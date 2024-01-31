# Configuration du Conteneur Docker pour l'Analyse Wi-Fi

## Objectif
Configurer un conteneur Docker pour effectuer des analyses Wi-Fi en utilisant des outils tels que airmon-ng, airodump-ng et aireplay-ng.

## Étapes

1. **Dockerfile :** Crée un Dockerfile avec les dépendances nécessaires.

   ```Dockerfile
   # Utiliser une image de Kali Linux pour ARM
   FROM arm32v7/kali-linux

   # Mise à jour du cache des paquets
   RUN apt-get update

   # Installation des outils nécessaires
   RUN apt-get install -y \
       aircrack-ng \
       wireless-tools \
       iw \
       pciutils \
       net-tools \
       macchanger \
       procps \
       kmod \
       procps \
       iproute2 \
       ethtool \
       tcpdump \
       libnl-3-dev \
       libnl-genl-3-dev \
       libssl-dev
   ```

2. **Construction de l'image :** Construis l'image Docker à partir du Dockerfile.

   ```bash
   docker build -t kali-wifi-scanner-arm .
   ```

3. **Exécution du Conteneur :** Exécute le conteneur en montant le périphérique Wi-Fi et en utilisant le mode réseau de l'hôte.

   ```bash
   docker run -it --rm --privileged --network=host --device=/dev/net/tun --device=/dev/<nom_de_ton_interface_wifi> kali-wifi-scanner-arm
   ```

   Assure-toi de remplacer `<nom_de_ton_interface_wifi>` par le nom réel de ton interface Wi-Fi.

4. **Utilisation d'airmon-ng :** À l'intérieur du conteneur, utilise airmon-ng pour mettre l'interface Wi-Fi en mode monitor.

   ```bash
   airmon-ng start wlan1
   ```

   Assure-toi de résoudre les problèmes d'autorisation ou de privilèges selon les besoins.

5. **Autres Actions :** Effectue d'autres actions telles que le scan des réseaux Wi-Fi avec airodump-ng selon tes besoins spécifiques.

## Remarques
- Assure-toi de comprendre les implications de sécurité liées à l'utilisation du mode `--privileged` et du mode réseau de l'hôte.
- Ajuste les dépendances et les étapes en fonction de tes besoins spécifiques.
