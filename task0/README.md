## 1. **Docker**

- Permet de créer des **conteneurs** = petits environnements isolés avec tout ce qu’il faut pour faire tourner une app (code, dépendances, configs).
- Avantages : léger, portable, rapide, facile à déployer et à scaler.

---

## 2. **Architecture du projet**

Tu vas créer une **infrastructure avec 4 parties** :

- **Reverse proxy** : point d’entrée, reçoit toutes les requêtes des clients.
- **Load balancer** : répartit les requêtes entre les serveurs API.
- **2 serveurs API** : fournissent les données / logique métier.
- **1 serveur front-end** : sert le contenu statique (HTML, CSS, JS).

---

## 3. **Fonctionnement**

- Le client envoie une requête → elle arrive au **reverse proxy**.
- Si c’est du **contenu statique** → proxy → serveur front-end → proxy → client.
- Si c’est une **requête API** → proxy → load balancer → API 1 ou API 2 (selon l’ordre) → proxy → client.
- Le client **ne parle jamais directement** aux serveurs API ou front-end.

---

## 4. **Load Balancing (Round Robin)**

- Algorithme simple = **chacun son tour**.
- Exemple avec 3 serveurs :
    - 1ère requête → serveur A
    - 2ème → serveur B
    - 3ème → serveur C
    - 4ème → serveur A (et ça recommence).
- Avantage : équilibre la charge.
- Limite : pas adapté si les requêtes demandent des ressources très différentes.

---

## 5. **Avant de commencer**

- Installer **Docker Desktop** (Windows, Mac, Linux).
- Chromebook = pas top, mieux vaut un vrai PC.
- Connaître les bases de Docker (commandes, images, conteneurs).

---
FROM ubuntu:latest       ← couche 1
RUN apt-get update -y    ← couche 2
CMD ["echo", "Hello, World!"]  ← couche 3