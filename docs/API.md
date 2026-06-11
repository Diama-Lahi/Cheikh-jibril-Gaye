# API Documentation - École Cheikh Djibril Gaye

## 📚 Base URL

```
Production: https://api.djibrilgaye.sn
Développement: http://localhost:5000
```

---

## 🔐 Authentification

Toutes les routes (sauf login) requièrent un token JWT dans le header:

```
Authorization: Bearer <token>
```

---

## 🔑 Endpoints d'authentification

### Login

**POST** `/api/auth/login`

**Request:**
```json
{
  "email": "admin@djibrilgaye.sn",
  "password": "password123"
}
```

**Response (200):**
```json
{
  "success": true,
  "token": "eyJhbGc...",
  "user": {
    "id": "uuid",
    "email": "admin@djibrilgaye.sn",
    "role": "admin"
  },
  "expiresIn": 86400
}
```

---

## 👥 Endpoints Élèves

### Lister tous les élèves

**GET** `/api/eleves`

**Query Parameters:**
- `classe_id` (optional)
- `page` (optional, défaut: 1)
- `limit` (optional, défaut: 20)

**Response (200):**
```json
{
  "success": true,
  "data": [
    {
      "id": "uuid",
      "matricule": "MAT-2024-001",
      "nom": "Diallo",
      "prenom": "Mamadou",
      "classe_id": "uuid",
      "niveau_etude": "primaire"
    }
  ],
  "total": 150
}
```

---

## 📊 Endpoints Notes et Moyennes

### Saisir une évaluation

**POST** `/api/notes/evaluation`

**Request:**
```json
{
  "eleve_id": "uuid",
  "matiere_id": "uuid",
  "classe_id": "uuid",
  "note": 18,
  "coefficient_eval": 2,
  "date_evaluation": "2024-06-10"
}
```

**Response (201):**
```json
{
  "success": true,
  "message": "Évaluation enregistrée",
  "data": {
    "moyenne_eleve": 16.5,
    "moyenne_classe": 14.8
  }
}
```

---

## 💰 Endpoints Paiements

### Lister les paiements

**GET** `/api/paiements`

**Query Parameters:**
- `statut`: 'paye', 'en_attente', 'retard'
- `classe_id`: UUID
- `mois`: MM
- `annee`: YYYY

**Response (200):**
```json
{
  "success": true,
  "data": [
    {
      "id": "uuid",
      "eleve": {...},
      "montant": 50000,
      "statut": "paye",
      "date_paiement": "2024-06-01"
    }
  ]
}
```

---

## ⚠️ Codes d'erreur

| Code | Signification |
|------|---------------|
| 200 | OK |
| 201 | Created |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Internal Error |

---

*Mise à jour: 11 Juin 2026*
