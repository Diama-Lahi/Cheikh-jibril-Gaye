# Roadmap de développement - École Cheikh Djibril Gaye

## 📅 Phase 1: Fondations (Semaines 1-2)
**Objectif:** Infrastructure de base et authentification

### Livérables
- [x] Setup repository GitHub
- [ ] Structure backend Node.js + Express
- [ ] Configuration PostgreSQL
- [ ] Système d'authentification (JWT)
- [ ] Dashboard admin basique
- [ ] Documentation setup

### Fichiers clés
- `backend/src/server.ts`
- `backend/src/middleware/auth.ts`
- `database/schema.sql`
- `frontend/src/pages/Login.tsx`

---

## 📅 Phase 2: Gestion des élèves (Semaines 3-4)
**Objectif:** CRUD complet élèves et classes

### Livérables
- [ ] Gestion classes (CRUD)
- [ ] Gestion élèves (CRUD)
- [ ] Contacts d'urgence (parents/tuteurs)
- [ ] Import CSV élèves
- [ ] Fiche élève détaillée
- [ ] Liste classes avec effectifs

### Fichiers clés
- `backend/src/models/Classe.ts`
- `backend/src/models/Eleve.ts`
- `backend/src/models/ContactUrgence.ts`
- `frontend/src/pages/admin/Eleves.tsx`
- `frontend/src/pages/admin/Classes.tsx`

---

## 📅 Phase 3: Absences & Notes (Semaines 5-6)
**Objectif:** Suivi académique complet

### Livérables
- [ ] Tableau de présence quotidien
- [ ] Saisie évaluations/notes
- [ ] **Calcul moyennes avec coefficients**
- [ ] Moyennes par classe par matière
- [ ] Bulletins de notes (PDF)
- [ ] Statistiques et graphiques
- [ ] Alertes absences excessives

### Formules de calcul
```
Moyenne matière = Σ(note × coefficient) / Σ(coefficient)
Moyenne classe = Moyenne(toutes les moyennes élèves)
```

### Fichiers clés
- `backend/src/models/Absence.ts`
- `backend/src/models/Evaluation.ts`
- `backend/src/models/Moyenne.ts`
- `backend/src/services/calculMoyenne.ts`
- `frontend/src/pages/admin/Notes.tsx`
- `frontend/src/pages/admin/Presences.tsx`

---

## 📅 Phase 4: Paiements & Emploi du temps (Semaines 7-8)
**Objectif:** Gestion administrative avancée

### Livérables
- [ ] Dashboard paiements
- [ ] Enregistrement paiements
- [ ] États (payé/retard/en attente)
- [ ] Reçus PDF automatiques
- [ ] Relances email
- [ ] Emplois du temps par classe
- [ ] Assignation enseignants
- [ ] Vue calendrier

### Fichiers clés
- `backend/src/models/Paiement.ts`
- `backend/src/models/EmploiDuTemps.ts`
- `frontend/src/pages/admin/Paiements.tsx`
- `frontend/src/pages/admin/EmploiDuTemps.tsx`

---

## 📅 Phase 5: Ressources & Événements (Semaines 9-10)
**Objectif:** Bibliothèque et communication

### Livérables
- [ ] Upload fichiers PDF/documents
- [ ] Visionneuse PDF en ligne
- [ ] Téléchargement fichiers
- [ ] Organisation par niveau/classe/matière
- [ ] Gestion événements école
- [ ] Upload photos/vidéos
- [ ] Galerie événements

### Fichiers clés
- `backend/src/models/RessourcePedagogique.ts`
- `backend/src/models/Evenement.ts`
- `backend/src/services/fileUpload.ts`
- `frontend/src/pages/Resources.tsx`
- `frontend/src/pages/admin/Evenements.tsx`

---

## 📅 Phase 6: Portails & Finitions (Semaines 11-12)
**Objectif:** Interfaces publiques et déploiement

### Livérables
- [ ] Accueil public (design attractif)
- [ ] Section événements en homepage
- [ ] Portail enseignants complet
- [ ] Portail élèves (secondaire)
- [ ] Responsive design mobile
- [ ] Tests et QA
- [ ] Documentation utilisateur
- [ ] Déploiement staging

### Fichiers clés
- `frontend/src/pages/Home.tsx`
- `frontend/src/pages/teachers/Dashboard.tsx`
- `frontend/src/pages/students/Dashboard.tsx`
- `frontend/src/components/EventCarousel.tsx`

---

## 🎯 Priorités de développement

### 🔴 Priorité haute (MVP)
1. Authentification
2. Gestion élèves/classes
3. Suivi absences
4. Saisie notes et calcul moyennes
5. Accueil public basique

### 🟡 Priorité moyenne
1. Paiements
2. Emplois du temps
3. Ressources pédagogiques
4. Portails enseignants

### 🟢 Priorité basse (Nice to have)
1. SMS notifications
2. App mobile
3. Export statistiques avancées
4. Intégration bancaire paiements

---

## 📊 Métriques de succès

- ✅ 100% des élèves enregistrés
- ✅ Calcul moyennes exact avec coefficients
- ✅ Temps de réponse API < 200ms
- ✅ Uptime 99.5%
- ✅ Tous utilisateurs ont accès sécurisé
- ✅ Téléchargements ressources < 2s
- ✅ Interface accessible sur mobile

---

## 🚀 Prochaines étapes

1. **Confirmer stack technologique**
2. **Configurer base de données**
3. **Créer API skeleton**
4. **Commencer Phase 1 développement**

*Mise à jour: 11 Juin 2026*
