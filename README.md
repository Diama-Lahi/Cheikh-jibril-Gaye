# École Cheikh Djibril Gaye - Plateforme de Gestion Scolaire

![School Logo](./docs/assets/logo.png)

**Plateforme numérique complète de gestion scolaire pour l'École Cheikh Djibril Gaye (Sénégal)**

## 📋 Vue d'ensemble

Cette application web permet de gérer l'ensemble des opérations d'une école:
- 👥 Gestion des élèves et classes
- 📊 Suivi des notes et moyennes (avec coefficients)
- 📅 Gestion des absences (justifiées/injustifiées)
- 💰 Suivi des paiements mensuels
- 📚 Bibliothèque de ressources pédagogiques (PDF visualisables et téléchargeables)
- 📆 Emplois du temps
- 🎓 Portail public avec événements et actualités

## 🎯 Niveaux supportés

**Primaire:**
- 6e
- 5e
- 3e

**Secondaire:**
- 2nde
- 1ère
- Terminale

*(Flexibilité pour ajouter des niveaux supplémentaires)*

## 👥 Rôles et accès

| Rôle | Accès |
|------|-------|
| **Administrateur** | Accès complet - Gestion toutes données |
| **Directeur** | Gestion classes, paiements, statistiques |
| **Secrétaire** | Gestion élèves, absences, événements |
| **Enseignant** | Saisie absences/notes, suivi classe |
| **Élève (Primaire)** | Aucun accès direct |
| **Élève (Secondaire)** | Voir notes, télécharger ressources |
| **Parents** | À définir ultérieurement |
| **Public** | Accueil, événements, contact |

## 🛠️ Stack technologique

### Frontend
- React 18+ avec TypeScript
- Tailwind CSS
- React Router v6
- Axios pour les requêtes API
- Chart.js / Recharts pour statistiques
- React PDF Viewer
- Redux/Zustand pour l'état

### Backend
- Node.js + Express.js
- TypeScript
- PostgreSQL
- JWT pour l'authentification
- TypeORM pour les migrations
- Multer pour uploads
- Nodemailer pour emails

### Infrastructure
- Base de données: PostgreSQL
- Stockage fichiers: Firebase Storage / AWS S3 / Local
- Hébergement: À définir (Vercel, Railway, DigitalOcean)

## 📁 Structure du projet

```
Cheikh-jibril-Gaye/
├── frontend/              # Application React
├── backend/               # API Node.js
├── database/              # Schémas et migrations
├── docs/                  # Documentation
└── README.md
```

## 🚀 Démarrage rapide

### Prérequis
- Node.js v18+
- PostgreSQL 12+
- Git

### Installation

1. **Cloner le repository**
```bash
git clone https://github.com/Diama-Lahi/Cheikh-jibril-Gaye.git
cd Cheikh-jibril-Gaye
```

2. **Setup Backend**
```bash
cd backend
npm install
cp .env.example .env
npm run dev
```

3. **Setup Frontend**
```bash
cd ../frontend
npm install
cp .env.example .env
npm start
```

4. **Setup Base de données**
```bash
# Voir database/README.md
```

## 📚 Documentation

- [📖 Architecture](./docs/ARCHITECTURE.md)
- [🔐 Authentification](./docs/SECURITY.md)
- [🌐 API Documentation](./docs/API.md)
- [👥 Rôles et Permissions](./docs/ROLES.md)
- [⚙️ Installation complète](./docs/SETUP.md)
- [🗄️ Schéma Base de Données](./database/SCHEMA.md)

## 📊 Caractéristiques principales

### Gestion des classes
✅ Créer/modifier classes  
✅ Ajouter élèves à une classe  
✅ Assigner enseignants  
✅ Gérer effectifs (35-45 élèves)  

### Suivi académique
✅ Saisie notes/évaluations  
✅ Calcul moyennes avec coefficients  
✅ Bulletins de notes  
✅ Rapports statistiques  

### Gestion absences
✅ Tableau de présence quotidien  
✅ Justification absences  
✅ Alertes élèves trop absents  
✅ Rapports d'absences  

### Contacts d'urgence
✅ Infos parents/tuteurs (4 ans+)  
✅ Infos élèves majeurs  
✅ Adresses et téléphones  

### Paiements
✅ Suivi mensuel  
✅ État paiements (payé/retard)  
✅ Reçus automatiques  
✅ Relances  

### Ressources pédagogiques
✅ Bibliothèque "Sources"  
✅ PDF visualisables en ligne  
✅ Téléchargement fichiers  
✅ Organisation par niveau/classe/matière  

### Emplois du temps
✅ Calendrier par classe  
✅ Assignation enseignants  
✅ Salles de classe  
✅ Horaires détaillés  

### Événements et actualités
✅ Gestion événements école  
✅ Photos/vidéos  
✅ Affichage public  
✅ Bannière accueil  

## 🔐 Sécurité

- JWT tokens pour authentification
- Passwords hashées (bcrypt)
- CORS configuré
- Protection CSRF
- Rate limiting API
- Validation données côté serveur

## 📧 Support et Contact

Pour toute question ou support:
- Email: contact@djibrilgaye.sn
- Téléphone: +221 *** *** ***
- Localisation: Sénégal

## 📄 Licence

MIT License - Voir [LICENSE](./LICENSE) pour plus de détails.

## 👨‍💼 Auteur

- **Créé par:** Copilot GitHub
- **Pour:** École Cheikh Djibril Gaye
- **Date:** 2026

---

**Dernière mise à jour:** Juin 2026
