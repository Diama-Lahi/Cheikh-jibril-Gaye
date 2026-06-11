# Rôles et Permissions - École Cheikh Djibril Gaye

## 👥 Rôles du système

### 1️⃣ ADMINISTRATEUR
**Accès:** Complet à toute l'application

**Responsabilités:**
- ✅ Gestion utilisateurs (création, modification, suppression)
- ✅ Configuration système
- ✅ Gestion toutes les classes et élèves
- ✅ Suivi paiements
- ✅ Gestion ressources pédagogiques
- ✅ Rapports administratifs
- ✅ Audit et logs

**Dashboard:**
- Vue d'ensemble complète du système
- Statistiques globales
- Alertes critiques

---

### 2️⃣ DIRECTEUR
**Accès:** Gestion pédagogique et administrative

**Responsabilités:**
- ✅ Approuver création de classes
- ✅ Assigner enseignants aux classes
- ✅ Consulter performances académiques
- ✅ Suivi paiements par classe
- ✅ Générer rapports mensuels
- ✅ Valider événements importants
- ✅ Consulter emplois du temps

**Restrictions:**
- ❌ Modifier utilisateurs
- ❌ Accès configuration système
- ❌ Supprimer données (archivage seulement)

**Dashboard:**
- Statistiques académiques
- État des paiements
- Effectifs par classe
- Moyennes générales

---

### 3️⃣ SECRÉTAIRE
**Accès:** Gestion opérationnelle quotidienne

**Responsabilités:**
- ✅ Enregistrer nouveaux élèves
- ✅ Mettre à jour informations élèves
- ✅ Gérer contacts d'urgence
- ✅ Enregistrer absences
- ✅ Enregistrer paiements
- ✅ Créer/gérer événements
- ✅ Télécharger ressources pédagogiques
- ✅ Générer certains rapports

**Restrictions:**
- ❌ Modifier notes (saisie enseignants)
- ❌ Créer/supprimer utilisateurs
- ❌ Accès configuration
- ❌ Supprimer données

**Dashboard:**
- Présences du jour
- Paiements attendus
- Événements du jour
- Alertes opérationnelles

---

### 4️⃣ ENSEIGNANT
**Accès:** Gestion classe et notes

**Responsabilités:**
- ✅ Consulter ma/mes classes
- ✅ Saisir absences quotidiennes
- ✅ Saisir notes et évaluations
- ✅ Consulter moyennes élèves
- ✅ Voir mon emploi du temps
- ✅ Consulter contacts d'urgence élèves
- ✅ Télécharger ressources (pour enseignement)
- ✅ Voir statistiques classe

**Restrictions:**
- ❌ Accès classes ne lui étant pas assignées
- ❌ Modifier données non-académiques
- ❌ Gérer paiements
- ❌ Accès infos autres classes

**Dashboard:**
- Mes classes
- Absences à marquer
- Notes à saisir
- Mon emploi du temps
- Moyennes mes élèves

---

### 5️⃣ ÉLÈVE (Secondaire uniquement)
**Accès:** Lecteur - données personnelles

**Responsabilités:**
- ✅ Consulter mes notes
- ✅ Consulter moyennes
- ✅ Voir mes absences
- ✅ Télécharger ressources pédagogiques
- ✅ Accéder emploi du temps classe
- ✅ Voir information profs classe

**Restrictions:**
- ❌ Modifier aucune donnée
- ❌ Voir notes autres élèves
- ❌ Accès infos paiements
- ❌ Accès données autres élèves

**Dashboard:**
- Mes notes et moyennes
- Mes absences
- Ressources à télécharger
- Emploi du temps

---

### 6️⃣ PARENT/TUTEUR
**Accès:** À définir ultérieurement

**Accès potentiel (futur):**
- Voir notes enfant
- Voir absences enfant
- Voir moyennes
- Payer en ligne
- Recevoir alertes

---

### 7️⃣ PUBLIC
**Accès:** Lecture-seule pages publiques

**Autorisé à voir:**
- ✅ Accueil école
- ✅ Événements et actualités
- ✅ Photos/vidéos événements (published)
- ✅ Informations contact
- ✅ Horaires école
- ✅ Informations générales

**Restrictions:**
- ❌ Aucun login requis
- ❌ Aucune donnée personnelle
- ❌ Aucune donnée académique

---

## 📋 Matrice des permissions par action

### Gestion des élèves

| Action | Admin | Directeur | Secrétaire | Enseignant | Élève | Public |
|--------|-------|-----------|-----------|-----------|-------|--------|
| Créer élève | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ |
| Lire élève | ✅ | ✅ | ✅ | ✅* | Soi-même | ❌ |
| Modifier élève | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ |
| Archiver élève | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Supprimer élève | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Importer élèves | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ |

*Enseignant voit seulement élèves de ses classes

### Gestion des classes

| Action | Admin | Directeur | Secrétaire | Enseignant | Élève | Public |
|--------|-------|-----------|-----------|-----------|-------|--------|
| Créer classe | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Lire classe | ✅ | ✅ | ✅ | ✅* | Siennes | ❌ |
| Modifier classe | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Archiver classe | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Supprimer classe | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |

*Enseignant lire seulement classes assignées

### Gestion des notes et moyennes

| Action | Admin | Directeur | Secrétaire | Enseignant | Élève | Public |
|--------|-------|-----------|-----------|-----------|-------|--------|
| Créer évaluation | ✅ | ❌ | ❌ | ✅ | ❌ | ❌ |
| Lire notes classe | ✅ | ✅ | ✅ | ✅* | Siennes | ❌ |
| Modifier évaluation | ✅ | ❌ | ❌ | ✅** | ❌ | ❌ |
| Supprimer évaluation | ✅ | ❌ | ❌ | ✅*** | ❌ | ❌ |
| Lire moyennes | ✅ | ✅ | ✅ | ✅ | Siennes | ❌ |
| Exporter bulletin | ✅ | ✅ | ✅ | ✅ | Sien | ❌ |

*Enseignant: ses classes seulement  
**Enseignant: max 48h après création  
***Enseignant: si non validée

### Gestion des absences

| Action | Admin | Directeur | Secrétaire | Enseignant | Élève | Public |
|--------|-------|-----------|-----------|-----------|-------|--------|
| Enregistrer absence | ✅ | ✅ | ✅ | ✅ | ❌ | ❌ |
| Marquer justifiée | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Consulter absences | ✅ | ✅ | ✅ | ✅* | Siennes | ❌ |
| Générer rapport | ✅ | ✅ | ✅ | ✅* | ❌ | ❌ |
| Supprimer absence | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |

*Enseignant: ses classes seulement

### Gestion des paiements

| Action | Admin | Directeur | Secrétaire | Enseignant | Élève | Public |
|--------|-------|-----------|-----------|-----------|-------|--------|
| Créer paiement | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ |
| Lire paiements | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Modifier paiement | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Générer reçu | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Envoyer relance | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Voir en retard | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |

### Ressources pédagogiques

| Action | Admin | Directeur | Secrétaire | Enseignant | Élève | Public |
|--------|-------|-----------|-----------|-----------|-------|--------|
| Upload ressource | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Lire ressource | ✅ | ✅ | ✅ | ✅ | ✅* | ❌ |
| Télécharger PDF | ✅ | ✅ | ✅ | ✅ | ✅* | ❌ |
| Visionner en ligne | ✅ | ✅ | ✅ | ✅ | ✅* | ❌ |
| Modifier ressource | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Supprimer ressource | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |

*Élève: secondaire seulement

### Événements

| Action | Admin | Directeur | Secrétaire | Enseignant | Élève | Public |
|--------|-------|-----------|-----------|-----------|-------|--------|
| Créer événement | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Lire événement | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Modifier événement | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Publier événement | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Archiver événement | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Supprimer événement | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |

### Emplois du temps

| Action | Admin | Directeur | Secrétaire | Enseignant | Élève | Public |
|--------|-------|-----------|-----------|-----------|-------|--------|
| Créer emploi temps | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Lire emploi temps | ✅ | ✅ | ✅ | ✅* | Sien | ❌ |
| Modifier emploi temps | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Exporter emploi temps | ✅ | ✅ | ✅ | ✅* | ✅* | ❌ |

*Enseignant: ses classes seulement  
*Élève: secondaire seulement

---

## 🔐 Sécurité

### Principes
1. **Least Privilege**: Chaque rôle a le minimum requis
2. **Role-Based Access Control (RBAC)**: Permissions basées sur rôle
3. **Audit Trail**: Log de toutes les actions
4. **Data Privacy**: Données sensibles jamais loggées

### Règles
- Les mots de passe ne sont jamais loggés
- Les numéros de téléphone masqués sauf pour admin
- Les adresses masquées pour non-admin
- Sessions JWT expiration: 24 heures
- Refresh tokens: 30 jours

---

*Dernière mise à jour: 11 Juin 2026*
