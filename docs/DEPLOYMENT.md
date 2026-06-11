# Guide de déploiement - École Cheikh Djibril Gaye

## 🚀 Déploiement en production

### Prérequis
- Domaine: `djibrilgaye.sn`
- Hébergeur: DigitalOcean, AWS, Linode, etc.
- SSL Certificate: Let's Encrypt (gratuit)

---

## Option 1: DigitalOcean (Recommandé - $12/mois)

### Étape 1: Créer un Droplet

1. Aller sur [DigitalOcean.com](https://www.digitalocean.com)
2. Créer nouveau Droplet
3. Sélectionner:
   - **Image**: Ubuntu 22.04 LTS
   - **Plan**: $12/mois minimum (2GB RAM)
   - **Région**: Frankfurt ou Amsterdam

### Étape 2: Configurer le Droplet

```bash
# Connexion via SSH
ssh root@VOTRE_IP

# Mise à jour système
sudo apt update && sudo apt upgrade -y

# Installer Node.js
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Installer PostgreSQL
sudo apt install -y postgresql postgresql-contrib

# Installer Nginx
sudo apt install -y nginx

# Installer Certbot (SSL)
sudo apt install -y certbot python3-certbot-nginx
```

### Étape 3: Configurer PostgreSQL

```bash
# Accéder à PostgreSQL
sudo -u postgres psql

# Créer utilisateur et BD
CREATE USER ecole WITH PASSWORD 'strong_password_here';
CREATE DATABASE ecole_djibril_gaye OWNER ecole;

# Quitter
\q

# Importer schéma
sudo -u postgres psql ecole_djibril_gaye < /chemin/vers/database/schema.sql
```

### Étape 4: Déployer l'application

```bash
# Créer répertoire
sudo mkdir -p /var/www/ecole-djibril-gaye
cd /var/www/ecole-djibril-gaye

# Cloner le repository
git clone https://github.com/Diama-Lahi/Cheikh-jibril-Gaye.git .

# Setup Backend
cd backend
npm install --production
npm run build

# Configuration .env
cat > .env << EOF
NODE_ENV=production
PORT=5000
DB_HOST=localhost
DB_USERNAME=ecole
DB_PASSWORD=strong_password_here
DB_NAME=ecole_djibril_gaye
JWT_SECRET=$(openssl rand -hex 32)
FRONTEND_URL=https://djibrilgaye.sn
EOF

# Setup Frontend
cd ../frontend
npm install --production
npm run build
```

### Étape 5: Configurer DNS

1. Chez votre registrar (Namecheap, GoDaddy, etc.)
2. Ajouter les records A:

```
djibrilgaye.sn → VOTRE_IP
www.djibrilgaye.sn → VOTRE_IP
api.djibrilgaye.sn → VOTRE_IP
```

### Étape 6: SSL Certificate (Let's Encrypt)

```bash
sudo certbot certonly --standalone -d djibrilgaye.sn -d www.djibrilgaye.sn -d api.djibrilgaye.sn
```

---

## Option 2: Heroku (Plus simple)

```bash
# Installer Heroku CLI
# https://devcenter.heroku.com/articles/heroku-cli

# Créer une app
heroku create ecole-djibril-gaye-api

# Ajouter PostgreSQL
heroku addons:create heroku-postgresql:hobby-dev

# Configurer env vars
heroku config:set JWT_SECRET=votre_secret_sécurisé

# Déployer
git push heroku main
```

---

## Option 3: Vercel (Frontend) + Railway (Backend)

**Frontend sur Vercel:**
```bash
cd frontend
vercel
```

**Backend sur Railway:**
1. Aller sur [Railway.app](https://railway.app)
2. Connecter GitHub repo
3. Ajouter PostgreSQL
4. Déployer

---

## ✅ Checklist

- [ ] Domaine enregistré
- [ ] DNS configuré
- [ ] SSL Certificate actif
- [ ] Base de données créée
- [ ] Backend construit et testé
- [ ] Frontend construit et testé
- [ ] Backups en place
- [ ] Monitoring actif

---

*Mise à jour: 11 Juin 2026*
