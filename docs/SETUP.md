# Guide d'installation complet - École Cheikh Djibril Gaye

## 📋 Prérequis

### Logiciels requis
- **Node.js** v18+ (https://nodejs.org)
- **PostgreSQL** 12+ (https://www.postgresql.org)
- **Git** (https://git-scm.com)
- **Code Editor** (VS Code recommandé)

---

## 🚀 Installation locale

### Étape 1: Cloner le repository

```bash
git clone https://github.com/Diama-Lahi/Cheikh-jibril-Gaye.git
cd Cheikh-jibril-Gaye
```

### Étape 2: Configuration Base de Données

**Créer la base de données:**

```bash
# Connexion à PostgreSQL
psql -U postgres

# Exécuter le script SQL
\i database/schema.sql

# Vérifier
\l  # lister les bases
\c ecole_djibril_gaye  # se connecter
\dt  # lister les tables
```

### Étape 3: Setup Backend

```bash
cd backend
npm install
cp .env.example .env

# Éditer .env avec vos configurations

# Lancer le serveur développement
npm run dev

# Le serveur devrait être accessible sur http://localhost:5000
```

### Étape 4: Setup Frontend

```bash
cd ../frontend
npm install
cp .env.example .env

# Éditer .env avec vos configurations
# REACT_APP_API_URL=http://localhost:5000

# Lancer l'application React
npm start

# L'application s'ouvrira automatiquement sur http://localhost:3000
```

---

## 📦 Build pour production

### Backend
```bash
cd backend
npm run build
node dist/server.js
```

### Frontend
```bash
cd frontend
npm run build
# Le contenu de build/ peut être servi par un serveur web
```

---

*Mise à jour: 11 Juin 2026*
