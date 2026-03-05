# 📊 Power BI — Page 6 : Vue des Configurations RH
### Projet RH Madagascar — Base `rh_madagascar`

> **Prérequis :** Avoir complété le fichier `00_setup_commun.md` (connexion, relations, colonnes calculées, thème).

---

## Table des matières

1. [Objectif de la page](#1-objectif-de-la-page)
2. [Disposition visuelle](#2-disposition-visuelle)
3. [Tables manuelles à créer dans Power BI](#3-tables-manuelles-à-créer-dans-power-bi)
4. [Mesures DAX à créer](#4-mesures-dax-à-créer)
5. [Visuels à créer — Instructions détaillées](#5-visuels-à-créer--instructions-détaillées)
6. [Simulateur IRSA interactif](#6-simulateur-irsa-interactif)
7. [Remarques sur cette page](#7-remarques-sur-cette-page)

---

## 1. Objectif de la page

Cette page est une **page de référence** qui affiche les paramètres légaux et réglementaires du système RH à Madagascar. Elle permet aux gestionnaires RH de :

- 📋 **Consulter** les taux de cotisations sociales (CNaPS, OSTIE)
- 📊 **Visualiser** le barème IRSA (impôt progressif sur salaires)
- ⚖️ **Comparer** les salaires de l'entreprise avec le SMIG légal
- ⏰ **Référencer** les taux de majoration des heures supplémentaires
- 🧮 **Simuler** l'IRSA pour n'importe quel salaire via un curseur interactif

> Cette page ne contient **pas de slicers dynamiques** (sauf le curseur du simulateur). C'est une page de référence statique enrichie d'un outil interactif.

---

## 2. Disposition visuelle

```
┌─────────────────────────────────────────────────────────────────┐
│  ⚙️ CONFIGURATIONS RH MADAGASCAR                                │
├─────────────────────────┬───────────────────────────────────────┤
│                         │                                       │
│  Tableau Cotisations    │   Barème IRSA                         │
│  Sociales               │   (Barres horizontales)               │
│  (CNaPS + OSTIE)        │                                       │
│                         │                                       │
├─────────────────────────┼───────────────────────────────────────┤
│                         │                                       │
│  Répartition réelle des │   Comparaison SMIG vs                 │
│  déductions employés    │   Salaires réels (Jauge)              │
│  (Camembert)            │                                       │
│                         │                                       │
├─────────────────────────┼───────────────────────────────────────┤
│                         │                                       │
│  Simulateur IRSA        │   Majorations HS                      │
│  (Curseur + Cartes)     │   (Tableau de référence)              │
│                         │                                       │
└─────────────────────────┴───────────────────────────────────────┘
```

---

## 3. Tables manuelles à créer dans Power BI

Ces tables sont créées **directement dans Power BI**, sans passer par PostgreSQL. Elles reflètent les paramètres légaux malgaches de l'application RH.

Pour créer chaque table : **Accueil** → **Entrer des données** → saisir les valeurs → nommer la table → **Charger**.

---

### Table 1 : `ConfigCotisations` — Cotisations sociales

| Cotisation | Part Employe (%) | Part Employeur (%) | Total (%) |
|-----------|-----------------|-------------------|----------|
| CNaPS | 1.0 | 13.0 | 14.0 |
| OSTIE | 1.0 | 5.0 | 6.0 |
| Total | 2.0 | 18.0 | 20.0 |

> Sources : Code du Travail malgache — CNAPS : Caisse Nationale de Prévoyance Sociale, OSTIE : Organisation Sanitaire Tananarivienne Inter-Entreprises.

---

### Table 2 : `ConfigIRSA` — Barème IRSA progressif

| Tranche | De (Ar) | A (Ar) | Taux (%) |
|---------|---------|--------|----------|
| Tranche 1 | 0 | 350 000 | 0 |
| Tranche 2 | 350 001 | 400 000 | 5 |
| Tranche 3 | 400 001 | 500 000 | 10 |
| Tranche 4 | 500 001 | 600 000 | 15 |
| Tranche 5 | 600 001 | 4 000 000 | 20 |
| Tranche 6 | 4 000 001 | 999 999 999 | 25 |

> L'IRSA (Impôt sur les Revenus Salariaux et Assimilés) est calculé de manière progressive : chaque tranche de revenu est imposée à son propre taux, pas le salaire entier.

---

### Table 3 : `ConfigMajorationHS` — Taux de majoration des heures supplémentaires

| Periode | Taux Majoration (%) | Description |
|---------|-------------------|-------------|
| Jour ouvrable (≤ 8h HS) | 130 | 8 premières heures supplémentaires |
| Jour ouvrable (> 8h HS) | 150 | Au-delà de 8 heures supplémentaires |
| Nuit (21h – 5h) | 150 | Travail de nuit |
| Dimanche / Jour férié | 200 | Dimanche et jours fériés |
| Nuit dimanche / férié | 200 | Nuit + dimanche ou jour férié |

---

### Table 4 : `ConfigGeneral` — Paramètres généraux RH

| Parametre | Valeur | Unite | Description |
|-----------|--------|-------|-------------|
| SMIG | 350 000 | Ar/mois | Salaire Minimum Interprofessionnel Garanti |
| Heures mensuelles légales | 173.33 | heures | 40h/sem × 52 semaines ÷ 12 mois |
| Congés annuels | 30 | jours | Droit congé annuel complet |
| Congé mensuel acquis | 2.5 | jours | Acquisition mensuelle (30 ÷ 12) |
| Max absences/mois | 3 | jours | Seuil d'alerte avant sanction |
| Max retards/mois | 2 | jours | Seuil de tolérance |
| HS max/semaine | 20 | heures | Plafond hebdomadaire HS |
| HS max/mois | 80 | heures | Plafond mensuel HS |
| Heure seuil retard | 08:00 | heure | Au-delà → retard comptabilisé |
| Heure seuil absence | 09:00 | heure | Au-delà → absence comptabilisée |
| Validité congés non pris | 3 | ans | Délai de report maximum |

---

## 4. Mesures DAX à créer

Créer un dossier `_Config`.

---

### Mesure 1 : SMIG légal (valeur fixe)

```dax
SMIG = 350000
```

---

### Mesure 2 : Employés payés au SMIG ou en dessous

```dax
Employes Au SMIG = 
    CALCULATE(
        COUNTROWS(employe),
        employe[salaire_base] <= 350000
    )
```

> Un employé payé exactement au SMIG est légal, mais cela peut signaler une précarité à surveiller.

---

### Mesure 3 : Employés au-dessus du SMIG

```dax
Employes Au Dessus SMIG = 
    CALCULATE(
        COUNTROWS(employe),
        employe[salaire_base] > 350000
    )
```

---

### Mesure 4 : Salaire minimum dans l'entreprise

```dax
Salaire Min Entreprise = MIN(employe[salaire_base])
```

---

### Mesure 5 : Salaire maximum dans l'entreprise

```dax
Salaire Max Entreprise = MAX(employe[salaire_base])
```

---

### Mesure 6 : CNaPS total prélevé (part employé)

```dax
CNaPS Total Employe = 
    CALCULATE(SUM(impotdeduction[montant]), impotdeduction[type_deduction] = "CNaPS")
```

---

### Mesure 7 : OSTIE total prélevé (part employé)

```dax
OSTIE Total Employe = 
    CALCULATE(SUM(impotdeduction[montant]), impotdeduction[type_deduction] = "OSTIE")
```

---

### Mesure 8 : IRSA total prélevé

```dax
IRSA Total = 
    CALCULATE(SUM(impotdeduction[montant]), impotdeduction[type_deduction] = "IRSA")
```

---

## 5. Visuels à créer — Instructions détaillées

### Visuel 1 : Tableau Cotisations Sociales

1. **Tableau**
2. Source : table `ConfigCotisations`
3. Colonnes : Cotisation, Part Employe (%), Part Employeur (%), Total (%)
4. Format :
    - En-tête : fond `#1B4F72`, texte blanc
    - Lignes alternées : blanc / gris clair `#ECF0F1`
5. Titre : `📋 Cotisations Sociales (CNaPS + OSTIE)`

---

### Visuel 2 : Barème IRSA (Barres horizontales)

> Visualise graphiquement le caractère progressif de l'IRSA.

1. **Graphique à barres groupées (horizontales)**
2. Source : table `ConfigIRSA`
3. Configuration :
    - **Axe Y** : `ConfigIRSA[Tranche]`
    - **Axe X** : `ConfigIRSA[Taux (%)]`
4. Format :
    - Couleurs en gradient : Tranche 1 → vert clair, Tranche 6 → rouge foncé
    - **Étiquettes de données** : Activé — afficher le taux en %
    - Axe X : Min = 0, Max = 30
5. Titre : `📊 Barème IRSA progressif`

---

### Visuel 3 : Répartition Réelle des Déductions (Camembert)

> Montre la répartition effective des déductions appliquées sur les vrais employés.

1. **Graphique en secteurs**
2. Source : table `impotdeduction` (données réelles de la base)
3. Configuration :
    - **Légende** : `impotdeduction[type_deduction]`
    - **Valeurs** : `SUM(impotdeduction[montant])`
4. Couleurs :
    - CNaPS → `#1B4F72`
    - OSTIE → `#2E86C1`
    - IRSA → `#E74C3C`
    - Mutuelle → `#27AE60`
    - Avance → `#F39C12`
5. Titre : `Répartition réelle des déductions`

---

### Visuel 4 : Comparaison SMIG vs Salaires de l'entreprise

**Option A — Jauge :**

1. **Jauge**
2. Configuration :
    - **Valeur** : `Salaire Min Entreprise`
    - **Valeur minimale** : 0
    - **Valeur maximale** : `Salaire Max Entreprise`
    - **Valeur cible** : mesure `SMIG` (350 000 Ar)
3. Titre : `Salaire min. entreprise vs SMIG`
4. Couleur : vert si ≥ SMIG, rouge si < SMIG

**Option B — Carte multi-lignes :**

1. **Carte à plusieurs lignes**
2. Champs :
    - `SMIG` → étiquette `SMIG légal`
    - `Salaire Min Entreprise` → étiquette `Salaire min. entreprise`
    - `Salaire Max Entreprise` → étiquette `Salaire max. entreprise`
3. Titre : `Comparaison salaires (Ar)`

> 💡 **Recommandation :** Utiliser l'Option B pour une lecture plus immédiate, et l'Option A pour un effet visuel plus percutant.

---

### Visuel 5 : Tableau Majorations HS (Référence)

1. **Tableau**
2. Source : table `ConfigMajorationHS`
3. Colonnes : Periode, Taux Majoration (%), Description
4. Format :
    - Lignes alternées en gris clair
    - Taux ≥ 200 % → couleur rouge `#E74C3C`
5. Titre : `⏰ Taux de majoration des heures supplémentaires`

---

### Visuel 6 : Paramètres Généraux RH (Tableau)

1. **Tableau**
2. Source : table `ConfigGeneral`
3. Colonnes : Parametre, Valeur, Unite, Description
4. Format :
    - En-tête : fond `#1B4F72`, texte blanc
    - Lignes alternées blanc / gris
5. Titre : `📋 Paramètres généraux RH`

---

## 6. Simulateur IRSA interactif

Cette section crée un **simulateur d'impôt interactif** grâce à un paramètre What-If.

### Étape 1 : Créer le paramètre What-If "Salaire Simulation"

1. Aller dans **Modélisation** → **Nouveau paramètre** → **Paramètre numérique**
2. Renseigner :

| Champ | Valeur |
|-------|--------|
| Nom | `Salaire Simulation` |
| Valeur minimale | 300 000 |
| Valeur maximale | 5 000 000 |
| Pas (incrément) | 50 000 |
| Valeur par défaut | 550 000 |

3. Cocher **Ajouter un segment à cette page** → cliquer **OK**
4. Un slicer de type **curseur** apparaît automatiquement sur la page

---

### Étape 2 : Créer les mesures du simulateur

#### Mesure — IRSA simulé

```dax
IRSA Simule = 
    VAR Salaire = SELECTEDVALUE('Salaire Simulation'[Salaire Simulation])
    VAR T1 = 0
    VAR T2 = IF(Salaire > 350000, MIN(Salaire, 400000) - 350000, 0) * 0.05
    VAR T3 = IF(Salaire > 400000, MIN(Salaire, 500000) - 400000, 0) * 0.10
    VAR T4 = IF(Salaire > 500000, MIN(Salaire, 600000) - 500000, 0) * 0.15
    VAR T5 = IF(Salaire > 600000, MIN(Salaire, 4000000) - 600000, 0) * 0.20
    VAR T6 = IF(Salaire > 4000000, Salaire - 4000000, 0) * 0.25
    RETURN T1 + T2 + T3 + T4 + T5 + T6
```

> Calcule l'IRSA exact par application progressive du barème sur chaque tranche de revenu.

#### Mesure — Salaire net simulé

```dax
Salaire Net Simule = 
    VAR Salaire = SELECTEDVALUE('Salaire Simulation'[Salaire Simulation])
    VAR CNaPS = Salaire * 0.01
    VAR OSTIE = Salaire * 0.01
    VAR IRSA = [IRSA Simule]
    RETURN Salaire - CNaPS - OSTIE - IRSA
```

---

### Étape 3 : Afficher le simulateur sur la page

**Éléments à placer côte à côte :**

1. **Le slicer curseur** `Salaire Simulation` (créé automatiquement à l'étape 1)
2. **3 cartes** :
    - Mesure `Salaire Simulation` → Étiquette : `Salaire brut simulé`
    - Mesure `IRSA Simule` → Étiquette : `IRSA calculé`
    - Mesure `Salaire Net Simule` → Étiquette : `Salaire net estimé`

---

### Étape 4 : Graphique de décomposition du salaire (Optionnel — avancé)

> Affiche la décomposition du salaire brut en Salaire Net, IRSA, OSTIE et CNaPS dans un graphique à barres.

**Créer une table calculée :**

```dax
DecompositionSimulation = 
    DATATABLE(
        "Composant", STRING,
        "Ordre", INTEGER,
        {
            {"Salaire Net", 1},
            {"IRSA", 2},
            {"OSTIE", 3},
            {"CNaPS", 4}
        }
    )
```

**Créer la mesure `Montant Composant` :**

```dax
Montant Composant = 
    VAR Salaire = SELECTEDVALUE('Salaire Simulation'[Salaire Simulation])
    VAR Composant = SELECTEDVALUE(DecompositionSimulation[Composant])
    RETURN
    SWITCH(Composant,
        "CNaPS", Salaire * 0.01,
        "OSTIE", Salaire * 0.01,
        "IRSA", [IRSA Simule],
        "Salaire Net", [Salaire Net Simule]
    )
```

**Configurer le graphique :**

1. **Graphique à colonnes groupées**
2. Configuration :
    - **Axe X** : `DecompositionSimulation[Composant]`
    - **Axe X (Trier par)** : `DecompositionSimulation[Ordre]`
    - **Valeurs** : `Montant Composant`
3. Couleurs :
    - Salaire Net → `#27AE60`
    - IRSA → `#E74C3C`
    - OSTIE → `#2E86C1`
    - CNaPS → `#1B4F72`
4. Titre : `Décomposition du salaire simulé`

---

## 7. Remarques sur cette page

- Cette page est **une page de référence**, pas une page analytique. Aucun slicer de filtrage dynamique n'est nécessaire, sauf le curseur du simulateur.
- Les tables `ConfigCotisations`, `ConfigIRSA`, `ConfigMajorationHS` et `ConfigGeneral` sont des **tables manuelles Power BI** (pas depuis PostgreSQL). Si les paramètres légaux changent, les modifier directement dans ces tables via **Transformer les données**.
- Le simulateur IRSA s'actualise **en temps réel** quand on déplace le curseur — pas besoin d'actualiser les données.

---

*Tutoriel RH-PowerBI — Page 6 Configurations — Madagascar — 2025*