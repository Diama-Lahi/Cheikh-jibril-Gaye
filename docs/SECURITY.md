# Guide de sécurité - École Cheikh Djibril Gaye

## 🔐 Principes de sécurité

### 1. Authentification
- ✅ JWT tokens (expiration 24h)
- ✅ Refresh tokens (expiration 30j)
- ✅ Passwords hashés (bcrypt - 10 rounds)
- ✅ Rate limiting (max 5 tentatives)

### 2. Autorisation (RBAC)
- ✅ Role-Based Access Control
- ✅ Vérification permissions sur chaque endpoint
- ✅ Data isolation par utilisateur

### 3. Validation des données
- ✅ Validation côté serveur (IMPORTANT)
- ✅ Sanitization des inputs
- ✅ Paramètres filtrés

### 4. Transport de données
- ✅ HTTPS/SSL obligatoire
- ✅ HSTS headers
- ✅ CORS configuré

### 5. Base de données
- ✅ Requêtes paramétrées (ORM TypeORM)
- ✅ Protection contre SQL injection
- ✅ Backups réguliers

---

## 🚫 Pratiques interdites

❌ Stocker mots de passe en clair  
❌ Exposer JWT dans URL  
❌ Faire confiance à la validation client seule  
❌ Logguer données sensibles  
❌ Utiliser HTTP en production  
❌ Admin par défaut (admin/admin)  
❌ Committer secrets dans Git  

---

## 📋 Checklist de sécurité

**Avant déploiement en production:**

- [ ] NODE_ENV=production
- [ ] JWT_SECRET généré aléatoirement (min 32 caractères)
- [ ] Tous les secrets dans variables d'environnement
- [ ] HTTPS/SSL configuré
- [ ] CORS restreint (pas *)
- [ ] Rate limiting activé
- [ ] Logging sécurisé (pas de secrets)
- [ ] Passwords forts pour tous les comptes
- [ ] Audit des permissions
- [ ] Backups en place
- [ ] Monitoring actif
- [ ] Tests de sécurité effectués

---

## 🔑 Gestion des secrets

**Fichier `.env` - JAMAIS committer:**

```bash
# .env (local development)
DB_PASSWORD=secure_password
JWT_SECRET=your_very_long_random_secret_key_here
SMTP_PASS=app_password_from_gmail
```

**Générer JWT_SECRET sécurisé:**

```bash
# Sur Linux/Mac
openssl rand -hex 32

# Sur Windows PowerShell
[Convert]::ToBase64String((1..32 | ForEach-Object { [byte](Get-Random -Maximum 256) }))
```

---

## 🛡️ Headers de sécurité

Configurés automatiquement avec Helmet dans `backend/src/server.ts`:

```typescript
app.use(helmet());
```

Ajoute:
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: DENY`
- `Strict-Transport-Security: max-age=31536000`
- `Content-Security-Policy: ...`

---

## 🛑 Protection contre les attaques courantes

### SQL Injection
✅ **Utiliser ORM** (TypeORM)
```typescript
// ✅ Safe
await User.find({ where: { email: userEmail } });
```

### XSS (Cross-Site Scripting)
✅ **React échappe automatiquement**
```tsx
// ✅ Safe
<div>{userInput}</div>
```

### CSRF (Cross-Site Request Forgery)
✅ **SameSite cookies**
```typescript
res.cookie('token', token, {
  httpOnly: true,
  secure: true,
  sameSite: 'strict'
});
```

### Brute Force
✅ **Rate limiting**
```bash
Max 5 tentatives de login par IP
```

---

## 🔄 Mises à jour de sécurité

```bash
# Vérifier les vulnerabilités
npm audit

# Corriger automatiquement
npm audit fix

# Vérifier les dépendances obsolètes
npm outdated
```

---

## 📚 Ressources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Node.js Security Best Practices](https://nodejs.org/en/docs/guides/nodejs-security/)
- [JWT Best Practices](https://tools.ietf.org/html/rfc8725)

---

*Mise à jour: 11 Juin 2026*
