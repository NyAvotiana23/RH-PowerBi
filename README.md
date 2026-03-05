# 📊 RH-PowerBI — Gestion des Ressources Humaines (Madagascar)

## 🎯 Objectif

Base de données PostgreSQL complète pour la gestion des RH, conçue pour alimenter des dashboards Power BI interactifs avec des données réalistes contextualisées à Madagascar (système fiscal malgache : IRSA, CNaPS, OSTIE).

---

## 📁 Structure du Projet

```
RH-PowerBi/
├── sql/
│   ├── script.sql    → Création des 18 tables (schéma BDD)
│   ├── data.sql      → Données d'exemple réalistes
│   └── reset.sql     → Réinitialisation complète
├── power-bi/         → Fichiers Power BI (à créer)
├── rh-base.md        → Documentation technique de la BDD
├── prompt.md         → Cahier des charges
└── README.md         → Ce fichier (tutoriel complet)
```

---

## 🚀 Installation Rapide

```bash
# Créer la base de données
createdb rh_madagascar

# Créer les tables
psql -d rh_madagascar -f sql/script.sql

# Insérer les données
psql -d rh_madagascar -f sql/data.sql

# Réinitialiser (si besoin)
psql -d rh_madagascar -f sql/reset.sql
# Puis relancer script.sql et data.sql
```

---

## 🔌 Connexion Power BI ↔ PostgreSQL

### Prérequis
1. **Power BI Desktop** installé
2. **PostgreSQL** en cours d'exécution avec la BDD `rh_madagascar`
3. **Connecteur Npgsql** (installé automatiquement avec Power BI récent)

### Étapes de Connexion
1. Ouvrir **Power BI Desktop**
2. **Obtenir les données** → **Base de données** → **PostgreSQL**
3. Renseigner :
   - Serveur : `localhost` (ou IP du serveur)
   - Base de données : `rh_madagascar`
   - Mode : **Importer**
4. Sélectionner **toutes les tables**
5. Cliquer **Charger**

### Vérifier les Relations
- Aller dans l'onglet **Modèle** (icône diagramme)
- Vérifier que les relations FK sont bien détectées
- Corriger si nécessaire (glisser-déposer les champs)

---

## 📊 Fonctionnalités et Tutoriels PowerBI

---

### 1️⃣ Gestion du Recrutement par Département

#### Détails
- Publication et suivi des offres d'emploi par département
- Pipeline de candidatures (Reçue → Présélectionnée → Entretien → Acceptée/Refusée)
- Planification et résultats des entretiens
- Suivi des candidats tout au long du processus

#### Visualisations PowerBI

| Visuel | Type | Données |
|--------|------|---------|
| Funnel de recrutement | Entonnoir | Candidature[statut], COUNT |
| Candidatures par département | Barres empilées | Departement[nom], Candidature[statut] |
| Taux d'acceptation | KPI Card | Acceptées / Total × 100 |
| Délai moyen recrutement | KPI Card | Date embauche - Date publication |
| Calendrier entretiens | Tableau | Entretien[date], Candidat, Résultat |
| Notes entretiens | Nuage de points | Candidat, note_evaluation |
| Offres par type de contrat | Camembert | Annonce[type_contrat] |

#### Mesures DAX

```dax
// Nombre total de candidatures
Total Candidatures = COUNTROWS(Candidature)

// Taux d'acceptation
Taux Acceptation = 
    DIVIDE(
        CALCULATE(COUNTROWS(Candidature), Candidature[statut] = "Acceptee"),
        COUNTROWS(Candidature),
        0
    ) * 100

// Nombre de postes ouverts
Postes Ouverts = 
    CALCULATE(
        SUM(Annonce[nombre_postes]),
        Annonce[statut] = "Ouverte"
    )

// Note moyenne des entretiens
Note Moyenne Entretien = AVERAGE(Entretien[note])

// Délai moyen de recrutement (jours)
Delai Moyen Recrutement = 
    AVERAGEX(
        FILTER(Annonce, Annonce[statut] = "Fermee"),
        DATEDIFF(Annonce[date_publication], Annonce[date_cloture], DAY)
    )

// Candidatures par mois (tendance)
Candidatures Par Mois = 
    COUNTROWS(Candidature)
```

#### Filtres recommandés
- **Slicer** : Département, Statut annonce, Type contrat, Période

---

### 2️⃣ Gestion des Employés

#### Détails
- Dossiers employés avec données JSON (situation familiale, compétences, langues)
- Suivi des performances trimestrielles
- Gestion des congés et absences
- Formation et développement des compétences

#### Visualisations PowerBI

| Visuel | Type | Données |
|--------|------|---------|
| Effectif par département | Barres horizontales | Departement[nom], COUNT(Employe) |
| Répartition H/F | Donut | Employe[sexe] |
| Pyramide des âges | Histogramme | Tranches d'âge |
| Ancienneté moyenne | KPI Card | AVG(ancienneté) |
| Types de contrat | Camembert | Employe[type_contrat] |
| Évolution performances | Courbes | Performance[periode], note_globale |
| Top performers | Tableau trié | Employe, note, objectifs |
| Carte compétences | TreeMap | DossierEmploye→competences |

#### Mesures DAX

```dax
// Effectif total actif
Effectif Actif = 
    CALCULATE(COUNTROWS(Employe), Employe[statut] = "Actif")

// Ratio Hommes/Femmes
Ratio HF = 
    DIVIDE(
        CALCULATE(COUNTROWS(Employe), Employe[sexe] = "Masculin"),
        CALCULATE(COUNTROWS(Employe), Employe[sexe] = "Feminin"),
        0
    )

// Note de performance moyenne
Performance Moyenne = AVERAGE(Performance[note_globale])

// Objectifs moyens atteints
Objectifs Moyens = AVERAGE(Performance[objectifs_atteints])

// Taux de recommandation promotion
Taux Promotion = 
    DIVIDE(
        CALCULATE(COUNTROWS(Performance), Performance[recommandation] = "Promotion"),
        COUNTROWS(Performance),
        0
    ) * 100

// Ancienneté moyenne (années)
Anciennete Moyenne = 
    AVERAGEX(
        FILTER(Employe, Employe[statut] = "Actif"),
        DATEDIFF(Employe[date_embauche], TODAY(), YEAR)
    )

// Turnover (employés partis / effectif)
Turnover = 
    DIVIDE(
        CALCULATE(COUNTROWS(Employe), Employe[statut] <> "Actif"),
        COUNTROWS(Employe),
        0
    ) * 100
```

#### Filtres recommandés
- **Slicer** : Département, Sexe, Type contrat, Période évaluation

---

### 3️⃣ Gestion de la Paie

#### Détails
- Calcul automatique : Salaire brut = Base + HS + Primes
- Déductions : CNaPS (1%), OSTIE (1%), IRSA (barème progressif)
- Salaire net = Brut - Total déductions
- Bulletins de paie avec détails JSON

#### Visualisations PowerBI

| Visuel | Type | Données |
|--------|------|---------|
| Masse salariale mensuelle | Courbe + barres | Mois, Brut/Net |
| Masse par département | Barres empilées | Departement, Brut |
| Répartition déductions | Donut | ImpotDeduction[type], montant |
| Top salaires | Tableau trié | Employe, salaire_brut DESC |
| Évolution salaire net | Courbe multi-lignes | Mois, Employe, Net |
| Ratio déductions/brut | Jauge | total_deductions/brut |
| Coût HS mensuel | Barres | Mois, heures_sup_montant |
| Primes distribuées | Treemap | Employe, primes |

#### Mesures DAX

```dax
// Masse salariale brute totale
Masse Salariale Brute = SUM(Paie[salaire_brut])

// Masse salariale nette
Masse Salariale Nette = SUM(Paie[salaire_net])

// Total déductions
Total Deductions = SUM(Paie[total_deductions])

// Salaire moyen net
Salaire Moyen Net = AVERAGE(Paie[salaire_net])

// Coût heures supplémentaires
Cout HS Total = SUM(Paie[heures_sup_montant])

// Part CNaPS
Part CNaPS = 
    CALCULATE(
        SUM(ImpotDeduction[montant]),
        ImpotDeduction[type_deduction] = "CNaPS"
    )

// Part IRSA
Part IRSA = 
    CALCULATE(
        SUM(ImpotDeduction[montant]),
        ImpotDeduction[type_deduction] = "IRSA"
    )

// Évolution masse salariale MoM
Evolution Masse MoM = 
    VAR MoisActuel = SUM(Paie[salaire_brut])
    VAR MoisPrecedent = CALCULATE(
        SUM(Paie[salaire_brut]),
        DATEADD(Paie[date_paiement], -1, MONTH)
    )
    RETURN DIVIDE(MoisActuel - MoisPrecedent, MoisPrecedent, 0) * 100
```

#### Filtres recommandés
- **Slicer** : Mois, Année, Département, Employé

---

### 4️⃣ Gestion des Présences

#### Détails
- Suivi quotidien des heures de travail (pointage arrivée/départ)
- Gestion des horaires par employé et par jour
- Détection des retards et absences
- Rapports de présence mensuels

#### Visualisations PowerBI

| Visuel | Type | Données |
|--------|------|---------|
| Taux de présence global | Jauge | Present / Total |
| Présence par département | Barres groupées | Departement, statut |
| Calendrier heatmap | Matrice | Date × Employe, couleur par statut |
| Retards par employé | Barres horizontales | Employe, COUNT(Retard) |
| Heures travaillées/semaine | Courbes | Semaine, SUM(heures) |
| Absences par type | Donut | Absence[type_absence] |
| Top retardataires | Tableau | Employe, nb_retards, heures_perdues |
| Tendance absences | Courbe | Mois, COUNT(absences) |

#### Mesures DAX

```dax
// Taux de présence global
Taux Presence = 
    DIVIDE(
        CALCULATE(COUNTROWS(Presence), Presence[statut] = "Present"),
        COUNTROWS(Presence),
        0
    ) * 100

// Nombre de retards
Nb Retards = 
    CALCULATE(COUNTROWS(Presence), Presence[statut] = "Retard")

// Total heures travaillées
Total Heures = SUM(Presence[heures_travaillees])

// Heures moyennes par jour
Heures Moyennes Jour = AVERAGE(Presence[heures_travaillees])

// Taux d'absentéisme
Taux Absenteisme = 
    DIVIDE(
        CALCULATE(COUNTROWS(Presence), Presence[statut] IN {"Absent", "Conge"}),
        COUNTROWS(Presence),
        0
    ) * 100

// Nombre absences injustifiées
Absences Injustifiees = 
    CALCULATE(COUNTROWS(Absence), Absence[type_absence] = "Injustifiee")
```

#### Filtres recommandés
- **Slicer** : Département, Employé, Mois, Statut présence

---

### 5️⃣ Gestion des Heures Supplémentaires

#### Détails
- Suivi des HS par employé avec motif
- Calcul automatique : Montant = (Salaire base / 173.33) × nb_heures × taux_majoration
- Taux de majoration : 150% (standard), 200% (nuit/dimanche)
- Workflow : En attente → Approuvée → Payée

#### Visualisations PowerBI

| Visuel | Type | Données |
|--------|------|---------|
| Total HS par mois | Barres + courbe | Mois, heures, montant |
| HS par département | Barres groupées | Departement, heures |
| Top HS employés | Tableau trié | Employe, total_heures, total_montant |
| Répartition par taux | Donut | taux_majoration (150%/200%) |
| Statut des demandes HS | Barres empilées | statut, COUNT |
| Coût HS vs Masse salariale | KPI | HS / Masse × 100 |
| Tendance HS mensuelle | Courbe | Mois, SUM(heures) |
| Motifs HS fréquents | WordCloud | motif |

#### Mesures DAX

```dax
// Total heures supplémentaires
Total HS Heures = SUM(HeuresSupplementaires[nombre_heures])

// Coût total HS
Cout Total HS = SUM(HeuresSupplementaires[montant_calcule])

// HS en attente
HS En Attente = 
    CALCULATE(
        COUNTROWS(HeuresSupplementaires),
        HeuresSupplementaires[statut] = "En attente"
    )

// Moyenne HS par employé
Moyenne HS Employe = 
    AVERAGEX(
        VALUES(HeuresSupplementaires[id_employe]),
        CALCULATE(SUM(HeuresSupplementaires[nombre_heures]))
    )

// Ratio HS / Masse salariale
Ratio HS Masse = 
    DIVIDE(
        SUM(HeuresSupplementaires[montant_calcule]),
        SUM(Paie[salaire_brut]),
        0
    ) * 100

// HS approuvées non payées
HS A Payer = 
    CALCULATE(
        SUM(HeuresSupplementaires[montant_calcule]),
        HeuresSupplementaires[statut] = "Approuvee"
    )
```

#### Filtres recommandés
- **Slicer** : Département, Employé, Période, Statut HS, Taux majoration

---

### 6️⃣ Vue des Configurations

#### Détails
Cette section affiche les paramètres de configuration du système RH malgache.

#### a) Cotisations Sociales

| Cotisation | Part Employé | Part Employeur | Base |
|-----------|-------------|---------------|------|
| **CNaPS** | 1% | 13% | Salaire brut (plafonné 1 610 000 Ar) |
| **OSTIE** | 1% | 5% | Salaire brut |

#### b) Salaire Minimum (SME Madagascar 2025)

| Catégorie | Montant mensuel (Ar) |
|-----------|---------------------|
| M1 (manœuvre) | 250 000 |
| M2 (ouvrier spécialisé) | 260 000 |
| OP1 (professionnel) | 270 000 |
| OP2 (hautement qualifié) | 280 000 |
| Cadre | 300 000+ |

#### c) Barème IRSA (Simplifié)

| Tranche de revenu mensuel (Ar) | Taux |
|-------------------------------|------|
| 0 - 350 000 | 0% |
| 350 001 - 400 000 | 5% |
| 400 001 - 500 000 | 10% |
| 500 001 - 600 000 | 15% |
| 600 001+ | 20% |

#### d) Majoration Heures Supplémentaires

| Période | Taux de majoration |
|---------|-------------------|
| Jour ouvrable | 130% (les 8 premières HS) |
| Jour ouvrable | 150% (au-delà de 8 HS) |
| Nuit (21h-5h) | 150% |
| Dimanche / Jour férié | 200% |
| Nuit dimanche / férié | 200% |

#### Visualisations PowerBI

| Visuel | Type | Données |
|--------|------|---------|
| Table cotisations | Tableau | Paramètres fixes |
| Barème IRSA | Barres horizontales | Tranches, Taux |
| Répartition déductions | Camembert | Type déduction, montant total |
| Comparaison salaire min vs réel | Jauge | Min vs salaire_base |

#### Mesures DAX

```dax
// Salaire minimum
Salaire Minimum = 250000

// Employés au SMIC
Employes Au SMIC = 
    CALCULATE(
        COUNTROWS(Employe),
        Employe[salaire_base] <= 300000
    )

// CNaPS total part employé
CNaPS Total = 
    CALCULATE(
        SUM(ImpotDeduction[montant]),
        ImpotDeduction[type_deduction] = "CNaPS"
    )

// OSTIE total part employé
OSTIE Total = 
    CALCULATE(
        SUM(ImpotDeduction[montant]),
        ImpotDeduction[type_deduction] = "OSTIE"
    )

// IRSA total
IRSA Total = 
    CALCULATE(
        SUM(ImpotDeduction[montant]),
        ImpotDeduction[type_deduction] = "IRSA"
    )
```

---

## 🎨 Structure recommandée du Dashboard PowerBI

### Pages suggérées

| # | Page | Contenu principal |
|---|------|------------------|
| 1 | **Vue d'ensemble** | KPIs globaux, effectif, masse salariale, recrutements |
| 2 | **Recrutement** | Funnel, candidatures par dept, entretiens, délais |
| 3 | **Employés** | Effectif, répartition, ancienneté, contrats |
| 4 | **Performance** | Notes trimestrielles, objectifs, recommandations |
| 5 | **Congés & Absences** | Jours pris, solde congés, absences, retards |
| 6 | **Paie** | Masse salariale, salaires nets, déductions, primes |
| 7 | **Présence** | Taux présence, heures travaillées, retards |
| 8 | **Heures Sup** | HS par dept, coût HS, tendances, approbations |
| 9 | **Configuration** | Cotisations, barème IRSA, SME, taux HS |

### Thème de couleurs suggéré

| Couleur | Usage |
|---------|-------|
| `#1B4F72` | En-têtes, titres |
| `#2E86C1` | Barres principales |
| `#85C1E9` | Barres secondaires |
| `#27AE60` | Indicateurs positifs |
| `#E74C3C` | Indicateurs négatifs |
| `#F39C12` | Avertissements |
| `#ECF0F1` | Fond de page |

---

## 📝 Notes Techniques

### Données
- **15 employés** répartis sur **6 départements**
- **20 candidats**, **12 annonces**, **30 candidatures**
- **Paie** : Janvier & Février 2025 (30 bulletins)
- **Présences** : Échantillon Janvier-Mars 2025
- **Performances** : T3 2024, T4 2024, T1 2025
- Toutes les montants sont en **Ariary (MGA)**

### Calculs
- Salaire horaire = `salaire_base / 173.33` (base 40h/semaine)
- Brut = Base + HS + Primes
- Net = Brut - (CNaPS 1% + OSTIE 1% + IRSA)
- HS montant = Salaire horaire × nb_heures × taux_majoration

---

## 👥 Contributeurs

Projet réalisé dans le cadre du cours de Ressources Humaines - S5

---

*Dernière mise à jour : Mars 2026*
