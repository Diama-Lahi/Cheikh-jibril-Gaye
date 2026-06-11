# Architecture - École Cheikh Djibril Gaye

## 🏗️ Vue d'ensemble générale

```
┌─────────────────────────────────────────────────────────────┐
│                   NAVIGATEURS / CLIENTS                     │
├─────────────────────────────────────────────────────────────┤
│  Public  │  Admin Panel  │  Teachers Portal  │  Students    │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│              FRONTEND (React.js + Tailwind)                 │
├─────────────────────────────────────────────────────────────┤
│  Pages  │  Components  │  Services API  │  State (Redux)   │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│             API REST (Node.js + Express)                    │
├──────────────┬──────────────┬─────────────┬────────────────┤
│ Auth Routes  │ Élèves/Class │ Notes       │ Files/Upload   │
│              │ Absences     │ Moyennes    │ Paiements      │
│              │ Emplois      │ Ressources  │ Événements     │
└──────────────┴──────────────┴─────────────┴────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│          BASE DE DONNÉES (PostgreSQL)                       │
├──────────────────────────────────────────────────────────────┤
│  Users  │  Classes  │  Élèves  │  Absences  │  Évaluations │
│  Moyennes  │  Paiements  │  Ressources  │  Événements    │
└──────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│      STOCKAGE FICHIERS (Cloud ou Local)                     │
├─────────────────────────────────────────────────────────────┤
│  PDFs  │  Documents  │  Photos  │  Vidéos  │  Uploads      │
└─────────────────────────────────────────────────────────────┘
```

---

## 📁 Structure des répertoires

### Frontend
```
frontend/
├── public/
│   ├── index.html
│   └── favicon.ico
├── src/
│   ├── assets/
│   │   ├── images/
│   │   ├── icons/
│   │   └── fonts/
│   ├── components/
│   │   ├── common/          # Composants réutilisables
│   │   │   ├── Header.tsx
│   │   │   ├── Sidebar.tsx
│   │   │   ├── Footer.tsx
│   │   │   └── Modal.tsx
│   │   ├── forms/
│   │   ├── tables/
│   │   └── charts/
│   ├── pages/
│   │   ├── Home.tsx         # Accueil public
│   │   ├── Login.tsx
│   │   ├── admin/           # Pages admin
│   │   │   ├── Dashboard.tsx
│   │   │   ├── Eleves.tsx
│   │   │   ├── Classes.tsx
│   │   │   ├── Notes.tsx
│   │   │   ├── Absences.tsx
│   │   │   ├── Paiements.tsx
│   │   │   ├── EmploiDuTemps.tsx
│   │   │   ├── Ressources.tsx
│   │   │   └── Evenements.tsx
│   │   ├── teachers/
│   │   │   ├── Dashboard.tsx
│   │   │   ├── MesClasses.tsx
│   │   │   ├── SaisieAbsences.tsx
│   │   │   └── SaisieNotes.tsx
│   │   ├── students/
│   │   │   ├── Dashboard.tsx
│   │   │   ├── Notes.tsx
│   │   │   └── Ressources.tsx
│   │   └── NotFound.tsx
│   ├── services/
│   │   ├── api.ts           # Instance axios
│   │   ├── auth.ts
│   │   ├── eleves.ts
│   │   ├── notes.ts
│   │   └── ...
│   ├── store/
│   │   ├── index.ts         # Store Redux
│   │   ├── slices/
│   │   │   ├── authSlice.ts
│   │   │   ├── uiSlice.ts
│   │   │   └── ...
│   ├── utils/
│   │   ├── validators.ts
│   │   ├── formatters.ts
│   │   └── helpers.ts
│   ├── hooks/
│   ├── App.tsx
│   ├── index.tsx
│   └── index.css
├── .env.example
├── .gitignore
├── package.json
├── tsconfig.json
├── tailwind.config.js
└── README.md
```

### Backend
```
backend/
├── src/
│   ├── config/
│   │   ├── database.ts      # Configuration PostgreSQL
│   │   ├── environment.ts
│   │   └── jwt.ts
│   ├── middleware/
│   │   ├── auth.ts          # Vérification JWT
│   │   ├── validation.ts
│   │   ├── errorHandler.ts
│   │   └── cors.ts
│   ├── entities/            # TypeORM entities
│   │   ├── User.ts
│   │   ├── Classe.ts
│   │   ├── Eleve.ts
│   │   ├── Absence.ts
│   │   ├── Evaluation.ts
│   │   ├── Moyenne.ts
│   │   ├── Paiement.ts
│   │   ├── RessourcePedagogique.ts
│   │   ├── Evenement.ts
│   │   ├── ContactUrgence.ts
│   │   └── EmploiDuTemps.ts
│   ├── repositories/        # Accès données
│   │   ├── UserRepository.ts
│   │   ├── EleveRepository.ts
│   │   ├── ClasseRepository.ts
│   │   └── ...
│   ├── services/            # Logique métier
│   │   ├── AuthService.ts
│   │   ├── EleveService.ts
│   │   ├── MoyenneService.ts # ⭐ Calculs moyennes
│   │   ├── PaiementService.ts
│   │   ├── FileService.ts
│   │   └── EmailService.ts
│   ├── controllers/         # Gestion requêtes
│   │   ├── auth.controller.ts
│   │   ├── eleves.controller.ts
│   │   ├── classes.controller.ts
│   │   ├── notes.controller.ts
│   │   ├── absences.controller.ts
│   │   ├── paiements.controller.ts
│   │   ├── ressources.controller.ts
│   │   ├── evenements.controller.ts
│   │   └── emploi.controller.ts
│   ├── routes/
│   │   ├── index.ts         # Routes principales
│   │   ├── auth.routes.ts
│   │   ├── eleves.routes.ts
│   │   ├── classes.routes.ts
│   │   ├── notes.routes.ts
│   │   ├── absences.routes.ts
│   │   ├── paiements.routes.ts
│   │   ├── ressources.routes.ts
│   │   ├── evenements.routes.ts
│   │   └── emploi.routes.ts
│   ├── utils/
│   │   ├── logger.ts
│   │   ├── validators.ts
│   │   └── helpers.ts
│   └── server.ts            # Point d'entrée
├── migrations/              # TypeORM migrations
│   ├── 1-initial.ts
│   └── ...
├── seeds/                   # Données initiales
│   └── seed.ts
├── tests/                   # Tests unitaires
│   ���── unit/
│   ├── integration/
│   └── e2e/
├── .env.example
├── .gitignore
├── package.json
├── tsconfig.json
├── ormconfig.json           # Configuration TypeORM
└── README.md
```

---

## 🔐 Flux d'authentification

```
1. UTILISATEUR
   ↓
2. POST /api/auth/login
   { email, password }
   ↓
3. BACKEND - Vérifier utilisateur
   ├─ Vérifier email existe
   ├─ Vérifier password (bcrypt)
   └─ Générer JWT token
   ↓
4. RÉPONSE
   {
     token: "eyJhbGc...",
     user: { id, email, role },
     expires_in: 86400
   }
   ↓
5. FRONTEND
   ├─ Stocker token (localStorage)
   ├─ Rediriger selon role
   └─ Ajouter Authorization header
   ↓
6. REQUÊTES FUTURES
   Authorization: Bearer <token>
```

---

## 📊 Flux calcul des moyennes

```
 SAISIE ÉVALUATIONS
        ↓
 POST /api/notes/evaluation
 {
   eleve_id,
   matiere_id,
   classe_id,
   note: 18,
   coefficient_eval: 2
 }
        ↓
 BACKEND - MoyenneService
        ↓
 ✓ Récupérer toutes évaluations élève pour matière
 ✓ Vérifier coefficients matière
 ✓ Calculer: Moyenne = Σ(note × coeff_eval) / Σ(coeff_eval)
 ✓ Stocker nouvelle moyenne
 ✓ Recalculer moyennes classe
        ↓
 RÉPONSE
 {
   succes: true,
   moyenne_eleve: 16.5,
   moyenne_classe: 14.8
 }
```

### Formule détaillée
```
Moyenne Matière Élève = Σ(note × coefficient_evaluation) / Σ(coefficient_evaluation)

Exemple:
- Éval 1: note=16, coeff=1 → 16×1 = 16
- Éval 2: note=18, coeff=2 → 18×2 = 36
- Éval 3: note=14, coeff=1 → 14×1 = 14
Moyenne = (16+36+14) / (1+2+1) = 66/4 = 16.5

Moyenne Classe = Moyenne(toutes moyennes élèves)
```

---

## 👥 Modèle de permissions (RBAC)

| Ressource | Admin | Directeur | Secrétaire | Enseignant | Élève | Public |
|-----------|-------|-----------|-----------|-----------|-------|--------|
| Élèves (CRUD) | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ |
| Classes (CRUD) | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Notes (lire) | ✅ | ✅ | ✅ | ✅ | ⚠️ | ❌ |
| Notes (créer) | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| Absences (CRUD) | ✅ | ✅ | ✅ | ✅ | ❌ | ❌ |
| Paiements (CRUD) | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Ressources (upload) | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Ressources (lire) | ✅ | ✅ | ✅ | ✅ | ⚠️ | ❌ |
| Événements (CRUD) | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Événements (lire) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

⚠️ = Accès limité (secondaire uniquement)

---

## 🗄️ Relations base de données

```
USERS
  ├─ One-to-Many → ENSEIGNANTS_CLASSES
  └─ One-to-Many → SESSIONS

CLASSES
  ├─ One-to-Many → ELEVES
  ├─ One-to-Many → MATIERES
  ├─ One-to-Many → ENSEIGNANTS_CLASSES
  ├─ One-to-Many → EMPLOIS_DU_TEMPS
  ├─ One-to-Many → ABSENCES
  └─ One-to-Many → MOYENNES_CLASSE

ELEVES
  ├─ Many-to-One ← CLASSES
  ├─ One-to-Many → CONTACTS_URGENCE
  ├─ One-to-Many → ABSENCES
  ├─ One-to-Many → EVALUATIONS
  ├─ One-to-Many → MOYENNES
  └─ One-to-Many → PAIEMENTS

MATIERES
  ├─ Many-to-One ← CLASSES
  ├─ One-to-Many → EVALUATIONS
  ├─ One-to-Many → MOYENNES
  ├─ One-to-Many → ENSEIGNANTS_CLASSES
  └─ One-to-Many → EMPLOIS_DU_TEMPS

EVALUATIONS
  ├─ Many-to-One ← ELEVES
  ├─ Many-to-One ← MATIERES
  └─ Many-to-One ← CLASSES
```

---

## 🚀 Déploiement

### Environnements
- **Développement**: Local avec Docker
- **Staging**: Heroku / Railway
- **Production**: DigitalOcean / AWS

### CI/CD Pipeline
```
Git Push
  ↓
GitHub Actions
  ├─ Lint (ESLint)
  ├─ Tests (Jest)
  ├─ Build (npm run build)
  └─ Deploy (selon branche)
      ├─ main → Production
      └─ develop → Staging
```

---

## 📈 Performance

- **API Response Time**: < 200ms
- **Database Queries**: Indexed sur columns clés
- **Frontend Bundle**: < 500KB (gzipped)
- **Images**: Optimisées et compressées
- **PDFs**: Lazy loading avec streaming

---

*Dernière mise à jour: 11 Juin 2026*
