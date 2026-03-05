-- ============================================================
-- SCRIPT DE CREATION DE LA BASE DE DONNEES RH - PostgreSQL
-- Gestion des Ressources Humaines (Madagascar)
-- ============================================================

-- ============================================================
-- 1. TABLE DEPARTEMENT
-- ============================================================
CREATE TABLE Departement (
    id_departement SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    responsable VARCHAR(100),
    date_creation DATE DEFAULT CURRENT_DATE,
    actif BOOLEAN DEFAULT TRUE
);

-- ============================================================
-- 2. TABLE CANDIDAT
-- ============================================================
CREATE TABLE Candidat (
    id_candidat SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telephone VARCHAR(20),
    adresse TEXT,
    date_naissance DATE,
    sexe VARCHAR(10) CHECK (sexe IN ('Masculin', 'Feminin')),
    niveau_etude VARCHAR(50),
    experience_annees INTEGER DEFAULT 0,
    cv_url TEXT,
    date_inscription DATE DEFAULT CURRENT_DATE
);

-- ============================================================
-- 3. TABLE ANNONCE (Offre d'emploi)
-- ============================================================
CREATE TABLE Annonce (
    id_annonce SERIAL PRIMARY KEY,
    id_departement INTEGER NOT NULL REFERENCES Departement(id_departement),
    titre VARCHAR(200) NOT NULL,
    description TEXT,
    poste VARCHAR(100) NOT NULL,
    type_contrat VARCHAR(50) CHECK (type_contrat IN ('CDI', 'CDD', 'Stage', 'Freelance')),
    salaire_min NUMERIC(15,2),
    salaire_max NUMERIC(15,2),
    date_publication DATE DEFAULT CURRENT_DATE,
    date_cloture DATE,
    statut VARCHAR(30) DEFAULT 'Ouverte' CHECK (statut IN ('Ouverte', 'Fermee', 'En cours', 'Annulee')),
    nombre_postes INTEGER DEFAULT 1
);

-- ============================================================
-- 4. TABLE CANDIDATURE
-- ============================================================
CREATE TABLE Candidature (
    id_candidature SERIAL PRIMARY KEY,
    id_candidat INTEGER NOT NULL REFERENCES Candidat(id_candidat),
    id_annonce INTEGER NOT NULL REFERENCES Annonce(id_annonce),
    date_candidature DATE DEFAULT CURRENT_DATE,
    lettre_motivation TEXT,
    statut VARCHAR(30) DEFAULT 'Recue' CHECK (statut IN ('Recue', 'Preselectionnee', 'Entretien', 'Acceptee', 'Refusee', 'En attente')),
    note_evaluation NUMERIC(4,2) CHECK (note_evaluation >= 0 AND note_evaluation <= 20),
    commentaire TEXT
);

-- ============================================================
-- 5. TABLE ENTRETIEN
-- ============================================================
CREATE TABLE Entretien (
    id_entretien SERIAL PRIMARY KEY,
    id_candidature INTEGER NOT NULL REFERENCES Candidature(id_candidature),
    date_entretien TIMESTAMP NOT NULL,
    lieu VARCHAR(200),
    type_entretien VARCHAR(50) CHECK (type_entretien IN ('Telephonique', 'Visio', 'Presentiel', 'Technique')),
    evaluateur VARCHAR(100),
    note NUMERIC(4,2) CHECK (note >= 0 AND note <= 20),
    commentaire TEXT,
    resultat VARCHAR(30) CHECK (resultat IN ('Favorable', 'Defavorable', 'En attente', 'Reserve'))
);

-- ============================================================
-- 6. TABLE EMPLOYE
-- ============================================================
CREATE TABLE Employe (
    id_employe SERIAL PRIMARY KEY,
    id_departement INTEGER NOT NULL REFERENCES Departement(id_departement),
    matricule VARCHAR(20) UNIQUE NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telephone VARCHAR(20),
    adresse TEXT,
    date_naissance DATE,
    sexe VARCHAR(10) CHECK (sexe IN ('Masculin', 'Feminin')),
    poste VARCHAR(100) NOT NULL,
    date_embauche DATE NOT NULL,
    type_contrat VARCHAR(50) CHECK (type_contrat IN ('CDI', 'CDD', 'Stage', 'Freelance')),
    salaire_base NUMERIC(15,2) NOT NULL,
    statut VARCHAR(30) DEFAULT 'Actif' CHECK (statut IN ('Actif', 'Inactif', 'Suspendu', 'Demissionnaire')),
    id_candidat INTEGER REFERENCES Candidat(id_candidat)
);

-- ============================================================
-- 7. TABLE DOSSIER EMPLOYE (avec colonne JSON)
-- ============================================================
CREATE TABLE DossierEmploye (
    id_dossier SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL UNIQUE REFERENCES Employe(id_employe),
    details JSONB NOT NULL DEFAULT '{}',
    date_creation DATE DEFAULT CURRENT_DATE,
    derniere_modification TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- 8. TABLE PERFORMANCE
-- ============================================================
CREATE TABLE Performance (
    id_performance SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES Employe(id_employe),
    date_evaluation DATE NOT NULL,
    periode VARCHAR(20) NOT NULL,
    note_globale NUMERIC(4,2) CHECK (note_globale >= 0 AND note_globale <= 20),
    objectifs_atteints INTEGER CHECK (objectifs_atteints >= 0 AND objectifs_atteints <= 100),
    commentaire TEXT,
    evaluateur VARCHAR(100),
    recommandation VARCHAR(50) CHECK (recommandation IN ('Promotion', 'Formation', 'Maintien', 'Avertissement', 'Licenciement'))
);

-- ============================================================
-- 9. TABLE CONGE
-- ============================================================
CREATE TABLE Conge (
    id_conge SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES Employe(id_employe),
    type_conge VARCHAR(50) NOT NULL CHECK (type_conge IN ('Annuel', 'Maladie', 'Maternite', 'Paternite', 'Sans solde', 'Exceptionnel', 'Formation')),
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    nombre_jours INTEGER NOT NULL,
    motif TEXT,
    statut VARCHAR(30) DEFAULT 'En attente' CHECK (statut IN ('En attente', 'Approuve', 'Refuse', 'Annule')),
    date_demande DATE DEFAULT CURRENT_DATE,
    approuve_par VARCHAR(100)
);

-- ============================================================
-- 10. TABLE ABSENCE
-- ============================================================
CREATE TABLE Absence (
    id_absence SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES Employe(id_employe),
    date_absence DATE NOT NULL,
    type_absence VARCHAR(50) CHECK (type_absence IN ('Justifiee', 'Injustifiee', 'Retard', 'Maladie')),
    motif TEXT,
    duree_heures NUMERIC(4,2),
    justificatif BOOLEAN DEFAULT FALSE
);

-- ============================================================
-- 11. TABLE FORMATION
-- ============================================================
CREATE TABLE Formation (
    id_formation SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES Employe(id_employe),
    titre VARCHAR(200) NOT NULL,
    description TEXT,
    organisme VARCHAR(150),
    date_debut DATE NOT NULL,
    date_fin DATE,
    duree_heures INTEGER,
    cout NUMERIC(15,2) DEFAULT 0,
    statut VARCHAR(30) DEFAULT 'Planifiee' CHECK (statut IN ('Planifiee', 'En cours', 'Terminee', 'Annulee')),
    certification BOOLEAN DEFAULT FALSE,
    note_obtenue NUMERIC(4,2)
);

-- ============================================================
-- 12. TABLE HORAIRE
-- ============================================================
CREATE TABLE Horaire (
    id_horaire SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES Employe(id_employe),
    jour_semaine VARCHAR(10) NOT NULL CHECK (jour_semaine IN ('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche')),
    heure_debut TIME NOT NULL,
    heure_fin TIME NOT NULL,
    pause_minutes INTEGER DEFAULT 60,
    actif BOOLEAN DEFAULT TRUE
);

-- ============================================================
-- 13. TABLE PRESENCE
-- ============================================================
CREATE TABLE Presence (
    id_presence SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES Employe(id_employe),
    date_presence DATE NOT NULL,
    heure_arrivee TIME,
    heure_depart TIME,
    heures_travaillees NUMERIC(5,2),
    statut VARCHAR(30) DEFAULT 'Present' CHECK (statut IN ('Present', 'Absent', 'Retard', 'Conge', 'Teletravail')),
    commentaire TEXT
);

-- ============================================================
-- 14. TABLE HEURES SUPPLEMENTAIRES
-- ============================================================
CREATE TABLE HeuresSupplementaires (
    id_hs SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES Employe(id_employe),
    date_hs DATE NOT NULL,
    nombre_heures NUMERIC(5,2) NOT NULL,
    motif TEXT,
    taux_majoration NUMERIC(4,2) DEFAULT 1.50,
    statut VARCHAR(30) DEFAULT 'En attente' CHECK (statut IN ('En attente', 'Approuvee', 'Refusee', 'Payee')),
    approuve_par VARCHAR(100),
    montant_calcule NUMERIC(15,2)
);

-- ============================================================
-- 15. TABLE PAIE
-- ============================================================
CREATE TABLE Paie (
    id_paie SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES Employe(id_employe),
    mois INTEGER NOT NULL CHECK (mois >= 1 AND mois <= 12),
    annee INTEGER NOT NULL,
    salaire_base NUMERIC(15,2) NOT NULL,
    heures_sup_montant NUMERIC(15,2) DEFAULT 0,
    primes NUMERIC(15,2) DEFAULT 0,
    salaire_brut NUMERIC(15,2) NOT NULL,
    total_deductions NUMERIC(15,2) DEFAULT 0,
    salaire_net NUMERIC(15,2) NOT NULL,
    date_paiement DATE,
    statut VARCHAR(30) DEFAULT 'En attente' CHECK (statut IN ('En attente', 'Paye', 'Annule'))
);

-- ============================================================
-- 16. TABLE AVANTAGE SOCIAL
-- ============================================================
CREATE TABLE AvantageSocial (
    id_avantage SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES Employe(id_employe),
    type_avantage VARCHAR(100) NOT NULL,
    description TEXT,
    montant NUMERIC(15,2),
    date_debut DATE,
    date_fin DATE,
    actif BOOLEAN DEFAULT TRUE
);

-- ============================================================
-- 17. TABLE IMPOT ET DEDUCTION
-- ============================================================
CREATE TABLE ImpotDeduction (
    id_impot SERIAL PRIMARY KEY,
    id_paie INTEGER NOT NULL REFERENCES Paie(id_paie),
    type_deduction VARCHAR(100) NOT NULL CHECK (type_deduction IN ('IRSA', 'CNaPS', 'OSTIE', 'Mutuelle', 'Avance', 'Autre')),
    description TEXT,
    montant NUMERIC(15,2) NOT NULL,
    pourcentage NUMERIC(5,2),
    obligatoire BOOLEAN DEFAULT TRUE
);

-- ============================================================
-- 18. TABLE BULLETIN DE PAIE
-- ============================================================
CREATE TABLE BulletinPaie (
    id_bulletin SERIAL PRIMARY KEY,
    id_paie INTEGER NOT NULL UNIQUE REFERENCES Paie(id_paie),
    numero_bulletin VARCHAR(50) UNIQUE NOT NULL,
    date_emission DATE DEFAULT CURRENT_DATE,
    periode VARCHAR(20) NOT NULL,
    details JSONB NOT NULL DEFAULT '{}',
    signe_par VARCHAR(100),
    remis BOOLEAN DEFAULT FALSE
);

-- ============================================================
-- INDEX POUR PERFORMANCE DES REQUETES
-- ============================================================
CREATE INDEX idx_employe_departement ON Employe(id_departement);
CREATE INDEX idx_employe_statut ON Employe(statut);
CREATE INDEX idx_candidature_annonce ON Candidature(id_annonce);
CREATE INDEX idx_candidature_candidat ON Candidature(id_candidat);
CREATE INDEX idx_presence_date ON Presence(date_presence);
CREATE INDEX idx_presence_employe ON Presence(id_employe);
CREATE INDEX idx_paie_employe ON Paie(id_employe);
CREATE INDEX idx_paie_periode ON Paie(mois, annee);
CREATE INDEX idx_conge_employe ON Conge(id_employe);
CREATE INDEX idx_absence_employe ON Absence(id_employe);
CREATE INDEX idx_hs_employe ON HeuresSupplementaires(id_employe);
CREATE INDEX idx_formation_employe ON Formation(id_employe);
CREATE INDEX idx_performance_employe ON Performance(id_employe);
