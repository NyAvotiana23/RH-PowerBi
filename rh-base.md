# Documentation Base de Données RH - Madagascar

## 📋 Vue d'ensemble

Base de données PostgreSQL pour la gestion des ressources humaines, conçue pour alimenter un dashboard Power BI. Contexte : entreprise basée à Madagascar avec le système fiscal malgache (CNaPS, OSTIE, IRSA).

---

## 🏗️ Structure de la Base de Données

### Diagramme des Relations

```
Departement ──┬── Annonce ──── Candidature ──── Entretien
              │                    │
              │               Candidat
              │
              └── Employe ──┬── DossierEmploye (JSON)
                            ├── Performance
                            ├── Conge
                            ├── Absence
                            ├── Formation
                            ├── Horaire
                            ├── Presence
                            ├── HeuresSupplementaires
                            ├── AvantageSocial
                            └── Paie ──┬── ImpotDeduction
                                       └── BulletinPaie (JSON)
```

---

## 📊 Description des Tables

### 1. Departement
| Colonne | Type | Description |
|---------|------|-------------|
| id_departement | SERIAL PK | Identifiant unique |
| nom | VARCHAR(100) | Nom du département |
| description | TEXT | Description |
| responsable | VARCHAR(100) | Nom du responsable |
| date_creation | DATE | Date de création |
| actif | BOOLEAN | Statut actif/inactif |

### 2. Candidat
| Colonne | Type | Description |
|---------|------|-------------|
| id_candidat | SERIAL PK | Identifiant unique |
| nom, prenom | VARCHAR(100) | Identité |
| email | VARCHAR(150) UNIQUE | Email |
| telephone | VARCHAR(20) | Téléphone |
| adresse | TEXT | Adresse |
| date_naissance | DATE | Date de naissance |
| sexe | VARCHAR(10) | Masculin/Feminin |
| niveau_etude | VARCHAR(50) | Niveau d'études |
| experience_annees | INTEGER | Années d'expérience |
| cv_url | TEXT | Lien vers CV |
| date_inscription | DATE | Date d'inscription |

### 3. Annonce
| Colonne | Type | Description |
|---------|------|-------------|
| id_annonce | SERIAL PK | Identifiant unique |
| id_departement | INTEGER FK | Département concerné |
| titre | VARCHAR(200) | Titre de l'offre |
| poste | VARCHAR(100) | Poste proposé |
| type_contrat | VARCHAR(50) | CDI/CDD/Stage/Freelance |
| salaire_min/max | NUMERIC(15,2) | Fourchette salariale (Ariary) |
| date_publication | DATE | Date de publication |
| date_cloture | DATE | Date de clôture |
| statut | VARCHAR(30) | Ouverte/Fermee/En cours/Annulee |
| nombre_postes | INTEGER | Nombre de postes |

### 4. Candidature
| Colonne | Type | Description |
|---------|------|-------------|
| id_candidature | SERIAL PK | Identifiant unique |
| id_candidat | INTEGER FK | Candidat |
| id_annonce | INTEGER FK | Annonce |
| date_candidature | DATE | Date de candidature |
| statut | VARCHAR(30) | Recue/Preselectionnee/Entretien/Acceptee/Refusee/En attente |
| note_evaluation | NUMERIC(4,2) | Note sur 20 |

### 5. Entretien
| Colonne | Type | Description |
|---------|------|-------------|
| id_entretien | SERIAL PK | Identifiant unique |
| id_candidature | INTEGER FK | Candidature associée |
| date_entretien | TIMESTAMP | Date et heure |
| type_entretien | VARCHAR(50) | Telephonique/Visio/Presentiel/Technique |
| note | NUMERIC(4,2) | Note sur 20 |
| resultat | VARCHAR(30) | Favorable/Defavorable/En attente/Reserve |

### 6. Employe
| Colonne | Type | Description |
|---------|------|-------------|
| id_employe | SERIAL PK | Identifiant unique |
| id_departement | INTEGER FK | Département |
| matricule | VARCHAR(20) UNIQUE | Matricule employé |
| nom, prenom | VARCHAR(100) | Identité |
| poste | VARCHAR(100) | Poste occupé |
| date_embauche | DATE | Date d'embauche |
| type_contrat | VARCHAR(50) | CDI/CDD/Stage/Freelance |
| salaire_base | NUMERIC(15,2) | Salaire de base (Ariary) |
| statut | VARCHAR(30) | Actif/Inactif/Suspendu/Demissionnaire |
| id_candidat | INTEGER FK | Lien avec candidature |

### 7. DossierEmploye
| Colonne | Type | Description |
|---------|------|-------------|
| id_dossier | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK UNIQUE | Employé (1:1) |
| details | JSONB | Données détaillées (situation familiale, compétences, langues, etc.) |

### 8. Performance
| Colonne | Type | Description |
|---------|------|-------------|
| id_performance | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK | Employé évalué |
| periode | VARCHAR(20) | Ex: "T1 2025" |
| note_globale | NUMERIC(4,2) | Note sur 20 |
| objectifs_atteints | INTEGER | Pourcentage 0-100% |
| recommandation | VARCHAR(50) | Promotion/Formation/Maintien/Avertissement |

### 9. Conge
| Colonne | Type | Description |
|---------|------|-------------|
| id_conge | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK | Employé |
| type_conge | VARCHAR(50) | Annuel/Maladie/Maternite/Paternite/Sans solde/Exceptionnel/Formation |
| date_debut/fin | DATE | Période du congé |
| nombre_jours | INTEGER | Durée en jours |
| statut | VARCHAR(30) | En attente/Approuve/Refuse/Annule |

### 10. Absence
| Colonne | Type | Description |
|---------|------|-------------|
| id_absence | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK | Employé |
| date_absence | DATE | Date |
| type_absence | VARCHAR(50) | Justifiee/Injustifiee/Retard/Maladie |
| duree_heures | NUMERIC(4,2) | Durée en heures |
| justificatif | BOOLEAN | Avec justificatif |

### 11. Formation
| Colonne | Type | Description |
|---------|------|-------------|
| id_formation | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK | Employé formé |
| titre | VARCHAR(200) | Titre de la formation |
| organisme | VARCHAR(150) | Organisme formateur |
| duree_heures | INTEGER | Durée en heures |
| cout | NUMERIC(15,2) | Coût en Ariary |
| statut | VARCHAR(30) | Planifiee/En cours/Terminee/Annulee |
| certification | BOOLEAN | Certification obtenue |

### 12. Horaire
| Colonne | Type | Description |
|---------|------|-------------|
| id_horaire | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK | Employé |
| jour_semaine | VARCHAR(10) | Lundi à Dimanche |
| heure_debut/fin | TIME | Horaires |
| pause_minutes | INTEGER | Durée pause (minutes) |

### 13. Presence
| Colonne | Type | Description |
|---------|------|-------------|
| id_presence | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK | Employé |
| date_presence | DATE | Date |
| heure_arrivee/depart | TIME | Pointage |
| heures_travaillees | NUMERIC(5,2) | Total heures |
| statut | VARCHAR(30) | Present/Absent/Retard/Conge/Teletravail |

### 14. HeuresSupplementaires
| Colonne | Type | Description |
|---------|------|-------------|
| id_hs | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK | Employé |
| date_hs | DATE | Date |
| nombre_heures | NUMERIC(5,2) | Nombre d'heures |
| taux_majoration | NUMERIC(4,2) | Taux (1.50 = 150%) |
| montant_calcule | NUMERIC(15,2) | Montant calculé |
| statut | VARCHAR(30) | En attente/Approuvee/Refusee/Payee |

### 15. Paie
| Colonne | Type | Description |
|---------|------|-------------|
| id_paie | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK | Employé |
| mois, annee | INTEGER | Période |
| salaire_base | NUMERIC(15,2) | Salaire de base |
| heures_sup_montant | NUMERIC(15,2) | Montant HS |
| primes | NUMERIC(15,2) | Primes |
| salaire_brut | NUMERIC(15,2) | = base + HS + primes |
| total_deductions | NUMERIC(15,2) | Total déductions |
| salaire_net | NUMERIC(15,2) | = brut - déductions |

### 16. AvantageSocial
| Colonne | Type | Description |
|---------|------|-------------|
| id_avantage | SERIAL PK | Identifiant unique |
| id_employe | INTEGER FK | Employé |
| type_avantage | VARCHAR(100) | Type (Transport, Assurance, etc.) |
| montant | NUMERIC(15,2) | Montant en Ariary |

### 17. ImpotDeduction
| Colonne | Type | Description |
|---------|------|-------------|
| id_impot | SERIAL PK | Identifiant unique |
| id_paie | INTEGER FK | Paie associée |
| type_deduction | VARCHAR(100) | IRSA/CNaPS/OSTIE/Mutuelle/Avance/Autre |
| montant | NUMERIC(15,2) | Montant |
| pourcentage | NUMERIC(5,2) | Taux appliqué |

### 18. BulletinPaie
| Colonne | Type | Description |
|---------|------|-------------|
| id_bulletin | SERIAL PK | Identifiant unique |
| id_paie | INTEGER FK UNIQUE | Paie (1:1) |
| numero_bulletin | VARCHAR(50) UNIQUE | Numéro du bulletin |
| details | JSONB | Détails complets du bulletin |

---

## 🔗 Relations entre les Tables

| Table Parent | Table Enfant | Relation | Clé |
|-------------|-------------|----------|-----|
| Departement | Annonce | 1:N | id_departement |
| Departement | Employe | 1:N | id_departement |
| Candidat | Candidature | 1:N | id_candidat |
| Annonce | Candidature | 1:N | id_annonce |
| Candidature | Entretien | 1:N | id_candidature |
| Candidat | Employe | 1:1 (optionnel) | id_candidat |
| Employe | DossierEmploye | 1:1 | id_employe |
| Employe | Performance | 1:N | id_employe |
| Employe | Conge | 1:N | id_employe |
| Employe | Absence | 1:N | id_employe |
| Employe | Formation | 1:N | id_employe |
| Employe | Horaire | 1:N | id_employe |
| Employe | Presence | 1:N | id_employe |
| Employe | HeuresSupplementaires | 1:N | id_employe |
| Employe | Paie | 1:N | id_employe |
| Employe | AvantageSocial | 1:N | id_employe |
| Paie | ImpotDeduction | 1:N | id_paie |
| Paie | BulletinPaie | 1:1 | id_paie |

---

## 📈 Requêtes Exemples pour PowerBI

### 1. Statistiques Recrutement

```sql
-- Nombre de candidatures par annonce et statut
SELECT a.titre, a.poste, d.nom AS departement,
       COUNT(c.id_candidature) AS total_candidatures,
       COUNT(CASE WHEN c.statut = 'Acceptee' THEN 1 END) AS acceptees,
       COUNT(CASE WHEN c.statut = 'Refusee' THEN 1 END) AS refusees,
       ROUND(COUNT(CASE WHEN c.statut = 'Acceptee' THEN 1 END)::NUMERIC / 
             NULLIF(COUNT(c.id_candidature), 0) * 100, 2) AS taux_acceptation
FROM Annonce a
JOIN Departement d ON a.id_departement = d.id_departement
LEFT JOIN Candidature c ON a.id_annonce = c.id_annonce
GROUP BY a.id_annonce, a.titre, a.poste, d.nom
ORDER BY total_candidatures DESC;

-- Pipeline de recrutement (funnel)
SELECT statut, COUNT(*) AS nombre
FROM Candidature
GROUP BY statut
ORDER BY CASE statut 
    WHEN 'Recue' THEN 1 
    WHEN 'Preselectionnee' THEN 2 
    WHEN 'Entretien' THEN 3 
    WHEN 'Acceptee' THEN 4 
    WHEN 'Refusee' THEN 5 
END;

-- Delai moyen de recrutement (publication -> embauche)
SELECT a.titre, a.poste,
       a.date_publication,
       MIN(e.date_embauche) AS date_embauche,
       MIN(e.date_embauche) - a.date_publication AS delai_jours
FROM Annonce a
JOIN Candidature c ON a.id_annonce = c.id_annonce
JOIN Employe e ON c.id_candidat = e.id_candidat
WHERE c.statut = 'Acceptee'
GROUP BY a.id_annonce, a.titre, a.poste, a.date_publication;
```

### 2. Statistiques Employés

```sql
-- Répartition par département
SELECT d.nom AS departement, 
       COUNT(e.id_employe) AS nombre_employes,
       ROUND(AVG(e.salaire_base), 0) AS salaire_moyen,
       COUNT(CASE WHEN e.sexe = 'Masculin' THEN 1 END) AS hommes,
       COUNT(CASE WHEN e.sexe = 'Feminin' THEN 1 END) AS femmes
FROM Departement d
LEFT JOIN Employe e ON d.id_departement = e.id_departement
GROUP BY d.nom;

-- Ancienneté moyenne par département
SELECT d.nom, 
       ROUND(AVG(CURRENT_DATE - e.date_embauche) / 365.25, 1) AS anciennete_moyenne_annees
FROM Employe e
JOIN Departement d ON e.id_departement = d.id_departement
WHERE e.statut = 'Actif'
GROUP BY d.nom;

-- Evolution des performances
SELECT e.nom || ' ' || e.prenom AS employe, 
       p.periode, p.note_globale, p.objectifs_atteints, p.recommandation
FROM Performance p
JOIN Employe e ON p.id_employe = e.id_employe
ORDER BY e.nom, p.date_evaluation;
```

### 3. Statistiques Paie

```sql
-- Masse salariale par mois
SELECT annee, mois, 
       SUM(salaire_brut) AS masse_salariale_brute,
       SUM(salaire_net) AS masse_salariale_nette,
       SUM(total_deductions) AS total_deductions,
       SUM(heures_sup_montant) AS total_hs
FROM Paie
GROUP BY annee, mois
ORDER BY annee, mois;

-- Masse salariale par département
SELECT d.nom AS departement, p.annee, p.mois,
       SUM(p.salaire_brut) AS brut,
       SUM(p.salaire_net) AS net
FROM Paie p
JOIN Employe e ON p.id_employe = e.id_employe
JOIN Departement d ON e.id_departement = d.id_departement
GROUP BY d.nom, p.annee, p.mois
ORDER BY d.nom, p.annee, p.mois;

-- Répartition des déductions
SELECT id.type_deduction, 
       SUM(id.montant) AS total_montant,
       ROUND(AVG(id.pourcentage), 2) AS taux_moyen
FROM ImpotDeduction id
GROUP BY id.type_deduction
ORDER BY total_montant DESC;
```

### 4. Statistiques Présence

```sql
-- Taux de présence par employé
SELECT e.nom || ' ' || e.prenom AS employe, d.nom AS departement,
       COUNT(CASE WHEN p.statut = 'Present' THEN 1 END) AS jours_presents,
       COUNT(CASE WHEN p.statut = 'Absent' THEN 1 END) AS jours_absents,
       COUNT(CASE WHEN p.statut = 'Retard' THEN 1 END) AS jours_retard,
       COUNT(CASE WHEN p.statut = 'Conge' THEN 1 END) AS jours_conge,
       ROUND(COUNT(CASE WHEN p.statut = 'Present' THEN 1 END)::NUMERIC / 
             NULLIF(COUNT(p.id_presence), 0) * 100, 2) AS taux_presence
FROM Presence p
JOIN Employe e ON p.id_employe = e.id_employe
JOIN Departement d ON e.id_departement = d.id_departement
GROUP BY e.id_employe, e.nom, e.prenom, d.nom
ORDER BY taux_presence DESC;

-- Heures travaillées par mois
SELECT e.nom || ' ' || e.prenom AS employe,
       EXTRACT(MONTH FROM p.date_presence) AS mois,
       SUM(p.heures_travaillees) AS total_heures
FROM Presence p
JOIN Employe e ON p.id_employe = e.id_employe
GROUP BY e.id_employe, e.nom, e.prenom, EXTRACT(MONTH FROM p.date_presence);
```

### 5. Statistiques Heures Supplémentaires

```sql
-- HS par employé et par mois
SELECT e.nom || ' ' || e.prenom AS employe, d.nom AS departement,
       EXTRACT(MONTH FROM hs.date_hs) AS mois,
       EXTRACT(YEAR FROM hs.date_hs) AS annee,
       SUM(hs.nombre_heures) AS total_heures,
       SUM(hs.montant_calcule) AS total_montant
FROM HeuresSupplementaires hs
JOIN Employe e ON hs.id_employe = e.id_employe
JOIN Departement d ON e.id_departement = d.id_departement
GROUP BY e.id_employe, e.nom, e.prenom, d.nom, 
         EXTRACT(MONTH FROM hs.date_hs), EXTRACT(YEAR FROM hs.date_hs)
ORDER BY annee, mois;

-- Coût total HS par département
SELECT d.nom AS departement,
       SUM(hs.nombre_heures) AS total_heures,
       SUM(hs.montant_calcule) AS cout_total
FROM HeuresSupplementaires hs
JOIN Employe e ON hs.id_employe = e.id_employe
JOIN Departement d ON e.id_departement = d.id_departement
WHERE hs.statut IN ('Payee', 'Approuvee')
GROUP BY d.nom;
```

---

## 📦 Données d'Exemple

| Table | Nombre d'enregistrements |
|-------|-------------------------|
| Departement | 6 |
| Candidat | 20 |
| Annonce | 12 |
| Candidature | 30 |
| Entretien | 18 |
| Employe | 15 |
| DossierEmploye | 15 |
| Performance | 36 |
| Conge | 25 |
| Absence | 20 |
| Formation | 15 |
| Horaire | ~80 |
| Presence | ~180 |
| HeuresSupplementaires | 20 |
| Paie | 30 |
| AvantageSocial | 25 |
| ImpotDeduction | 90 |
| BulletinPaie | 30 |

---

## 🚀 Installation

```bash
# 1. Créer la base de données
createdb rh_madagascar

# 2. Exécuter le script de structure
psql -d rh_madagascar -f sql/script.sql

# 3. Insérer les données d'exemple
psql -d rh_madagascar -f sql/data.sql

# Pour réinitialiser (tout supprimer) :
psql -d rh_madagascar -f sql/reset.sql
```

---

## ⚠️ Système Fiscal Malgache (Simplifié)

- **CNaPS** (Caisse Nationale de Prévoyance Sociale) : 1% part employé
- **OSTIE** (Organisation Sanitaire Tananarivienne Inter-Entreprises) : 1% part employé
- **IRSA** (Impôt sur les Revenus Salariaux et Assimilés) : barème progressif
- Monnaie : **Ariary (MGA)**
