-- ============================================
-- SCHEMA: École Cheikh Djibril Gaye
-- ============================================

-- Créer la base de données
CREATE DATABASE IF NOT EXISTS ecole_djibril_gaye;

\c ecole_djibril_gaye

-- ============================================
-- EXTENSION
-- ============================================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- ============================================
-- TABLES
-- ============================================

-- USERS (Utilisateurs du système)
CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL DEFAULT 'user',
  nom VARCHAR(255) NOT NULL,
  prenom VARCHAR(255) NOT NULL,
  telephone VARCHAR(20),
  actif BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT roles_check CHECK (role IN ('admin', 'directeur', 'secretaire', 'enseignant', 'eleve', 'parent'))
);

-- CLASSES
CREATE TABLE IF NOT EXISTS classes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nom VARCHAR(50) NOT NULL,
  niveau VARCHAR(50) NOT NULL,
  annee_scolaire VARCHAR(20) NOT NULL,
  effectif INT DEFAULT 0,
  salle VARCHAR(100),
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT niveaux_check CHECK (niveau IN ('primaire', 'secondaire')),
  CONSTRAINT unique_classe_annee UNIQUE(nom, annee_scolaire)
);

-- ELEVES
CREATE TABLE IF NOT EXISTS eleves (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  matricule VARCHAR(50) UNIQUE NOT NULL,
  nom VARCHAR(255) NOT NULL,
  prenom VARCHAR(255) NOT NULL,
  date_naissance DATE,
  sexe VARCHAR(10),
  classe_id UUID NOT NULL REFERENCES classes(id),
  niveau_etude VARCHAR(50) NOT NULL,
  statut VARCHAR(50) DEFAULT 'actif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT statuts_check CHECK (statut IN ('actif', 'suspendu', 'retire')),
  CONSTRAINT niveaux_etude_check CHECK (niveau_etude IN ('primaire', 'secondaire'))
);

-- CONTACTS_URGENCE
CREATE TABLE IF NOT EXISTS contacts_urgence (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  eleve_id UUID NOT NULL REFERENCES eleves(id),
  type VARCHAR(50) NOT NULL,
  nom VARCHAR(255) NOT NULL,
  relation VARCHAR(100),
  telephone VARCHAR(20) NOT NULL,
  telephone_secondaire VARCHAR(20),
  adresse TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT types_check CHECK (type IN ('parent', 'tuteur'))
);

-- MATIERES
CREATE TABLE IF NOT EXISTS matieres (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nom VARCHAR(255) NOT NULL,
  coefficient INT DEFAULT 1,
  classe_id UUID NOT NULL REFERENCES classes(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_matiere_classe UNIQUE(nom, classe_id)
);

-- ENSEIGNANTS_CLASSES
CREATE TABLE IF NOT EXISTS enseignants_classes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  enseignant_id UUID NOT NULL REFERENCES users(id),
  classe_id UUID NOT NULL REFERENCES classes(id),
  matiere_id UUID NOT NULL REFERENCES matieres(id),
  annee_scolaire VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_enseignant_classe UNIQUE(enseignant_id, classe_id, matiere_id, annee_scolaire)
);

-- ABSENCES
CREATE TABLE IF NOT EXISTS absences (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  eleve_id UUID NOT NULL REFERENCES eleves(id),
  classe_id UUID NOT NULL REFERENCES classes(id),
  date DATE NOT NULL,
  justifiee BOOLEAN DEFAULT FALSE,
  motif TEXT,
  signalement_par UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_absence UNIQUE(eleve_id, date)
);

-- EVALUATIONS (Notes)
CREATE TABLE IF NOT EXISTS evaluations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  eleve_id UUID NOT NULL REFERENCES eleves(id),
  matiere_id UUID NOT NULL REFERENCES matieres(id),
  classe_id UUID NOT NULL REFERENCES classes(id),
  note DECIMAL(5, 2) NOT NULL,
  date_evaluation DATE NOT NULL,
  coefficient_eval INT DEFAULT 1,
  validee BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CHECK (note >= 0 AND note <= 20)
);

-- MOYENNES
CREATE TABLE IF NOT EXISTS moyennes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  eleve_id UUID NOT NULL REFERENCES eleves(id),
  matiere_id UUID NOT NULL REFERENCES matieres(id),
  classe_id UUID NOT NULL REFERENCES classes(id),
  moyenne DECIMAL(5, 2),
  mois_annee VARCHAR(7),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_moyenne UNIQUE(eleve_id, matiere_id, mois_annee)
);

-- MOYENNES_CLASSE
CREATE TABLE IF NOT EXISTS moyennes_classe (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  classe_id UUID NOT NULL REFERENCES classes(id),
  matiere_id UUID NOT NULL REFERENCES matieres(id),
  moyenne_classe DECIMAL(5, 2),
  mois_annee VARCHAR(7),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PAIEMENTS
CREATE TABLE IF NOT EXISTS paiements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  eleve_id UUID NOT NULL REFERENCES eleves(id),
  classe_id UUID NOT NULL REFERENCES classes(id),
  montant DECIMAL(10, 2) NOT NULL,
  mois INT NOT NULL,
  annee INT NOT NULL,
  statut VARCHAR(50) DEFAULT 'en_attente',
  date_paiement DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT statuts_paiement_check CHECK (statut IN ('paye', 'en_attente', 'retard')),
  CONSTRAINT unique_paiement UNIQUE(eleve_id, mois, annee)
);

-- EMPLOIS_DU_TEMPS
CREATE TABLE IF NOT EXISTS emplois_du_temps (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  classe_id UUID NOT NULL REFERENCES classes(id),
  enseignant_id UUID NOT NULL REFERENCES users(id),
  matiere_id UUID NOT NULL REFERENCES matieres(id),
  jour_semaine VARCHAR(20) NOT NULL,
  heure_debut TIME NOT NULL,
  heure_fin TIME NOT NULL,
  salle VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT jours_check CHECK (jour_semaine IN ('lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche'))
);

-- RESSOURCES_PEDAGOGIQUES
CREATE TABLE IF NOT EXISTS ressources_pedagogiques (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  titre VARCHAR(255) NOT NULL,
  description TEXT,
  niveau_etude VARCHAR(50) NOT NULL,
  classe_id UUID REFERENCES classes(id),
  matiere_id UUID REFERENCES matieres(id),
  type_fichier VARCHAR(50) NOT NULL,
  url_fichier VARCHAR(500) NOT NULL,
  chemin_local VARCHAR(500),
  taille_fichier INT,
  date_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  telecharges_count INT DEFAULT 0,
  CONSTRAINT niveaux_ressource_check CHECK (niveau_etude IN ('primaire', 'secondaire', 'tous'))
);

-- EVENEMENTS_ECOLE
CREATE TABLE IF NOT EXISTS evenements_ecole (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  titre VARCHAR(255) NOT NULL,
  description TEXT,
  date_debut TIMESTAMP NOT NULL,
  date_fin TIMESTAMP,
  lieu VARCHAR(255),
  image_affiche VARCHAR(500),
  video_url VARCHAR(500),
  visible_public BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- INDEX
-- ============================================

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_eleves_classe ON eleves(classe_id);
CREATE INDEX idx_eleves_matricule ON eleves(matricule);
CREATE INDEX idx_absences_eleve ON absences(eleve_id);
CREATE INDEX idx_absences_date ON absences(date);
CREATE INDEX idx_evaluations_eleve ON evaluations(eleve_id);
CREATE INDEX idx_evaluations_matiere ON evaluations(matiere_id);
CREATE INDEX idx_paiements_eleve ON paiements(eleve_id);
CREATE INDEX idx_paiements_statut ON paiements(statut);
CREATE INDEX idx_moyennes_eleve ON moyennes(eleve_id);
CREATE INDEX idx_classes_nom ON classes(nom);

-- ============================================
-- CONSTRAINTS
-- ============================================

ALTER TABLE eleves ADD CONSTRAINT fk_eleves_classe FOREIGN KEY (classe_id) REFERENCES classes(id) ON DELETE RESTRICT;
ALTER TABLE contacts_urgence ADD CONSTRAINT fk_contacts_eleve FOREIGN KEY (eleve_id) REFERENCES eleves(id) ON DELETE CASCADE;
ALTER TABLE absences ADD CONSTRAINT fk_absences_eleve FOREIGN KEY (eleve_id) REFERENCES eleves(id) ON DELETE CASCADE;
ALTER TABLE evaluations ADD CONSTRAINT fk_evaluations_eleve FOREIGN KEY (eleve_id) REFERENCES eleves(id) ON DELETE CASCADE;
ALTER TABLE moyennes ADD CONSTRAINT fk_moyennes_eleve FOREIGN KEY (eleve_id) REFERENCES eleves(id) ON DELETE CASCADE;
ALTER TABLE paiements ADD CONSTRAINT fk_paiements_eleve FOREIGN KEY (eleve_id) REFERENCES eleves(id) ON DELETE CASCADE;

COMMIT;
