# 📊 Power BI — Page 1 : Gestion du Recrutement par Département
### Projet RH Madagascar — Base `rh_madagascar`

> **Prérequis :** Avoir complété le fichier `00_setup_commun.md` (connexion, relations, colonnes calculées, thème).

---

## Table des matières

1. [Objectif de la page](#1-objectif-de-la-page)
2. [Disposition visuelle](#2-disposition-visuelle)
3. [Tables utilisées](#3-tables-utilisées)
4. [Mesures DAX à créer](#4-mesures-dax-à-créer)
5. [Visuels à créer — Instructions détaillées](#5-visuels-à-créer--instructions-détaillées)
6. [Filtres (Slicers)](#6-filtres-slicers)
7. [Interactions entre visuels](#7-interactions-entre-visuels)

---

## 1. Objectif de la page

Cette page permet de **suivre l'ensemble du processus de recrutement** de l'entreprise, du début à la fin :

- 📢 **Publication** : visualiser les offres d'emploi actives par département
- 📥 **Réception** : suivre le volume de candidatures reçues
- 🔍 **Tri** : analyser les candidatures par statut (reçue, présélectionnée, refusée, acceptée)
- 🗓️ **Entretiens** : consulter le planning et les résultats des entretiens
- 🏆 **Sélection** : identifier les meilleurs candidats par note d'évaluation

---

## 2. Disposition visuelle

```
┌─────────────────────────────────────────────────────────────────┐
│  🎯 RECRUTEMENT PAR DÉPARTEMENT                                 │
├─────────┬─────────┬─────────┬─────────┬────────────────────────┤
│  KPI 1  │  KPI 2  │  KPI 3  │  KPI 4  │   FILTRE Département  │
│ Offres  │Candida- │ Taux    │ Délai   │   FILTRE Statut       │
│ actives │tures   │ accept. │ moyen   │   FILTRE Période      │
├─────────┴─────────┼─────────┴─────────┼────────────────────────┤
│                   │                   │                        │
│   Funnel de       │  Candidatures     │   Offres par type      │
│   recrutement     │  par département  │   de contrat           │
│   (Entonnoir)     │  (Barres empilées)│   (Donut)              │
│                   │                   │                        │
├───────────────────┼───────────────────┼────────────────────────┤
│                   │                   │                        │
│  Notes moyennes   │   Tableau des     │   Top candidats        │
│  par poste        │   entretiens      │   (Tableau trié)       │
│  (Barres horiz.)  │   (Détails)       │                        │
│                   │                   │                        │
└───────────────────┴───────────────────┴────────────────────────┘
```

---

## 3. Tables utilisées

| Table | Rôle dans cette page |
|-------|---------------------|
| `departement` | Filtrage par département |
| `annonce` | Offres d'emploi (poste, type contrat, statut, dates) |
| `candidature` | Candidatures reçues et leur statut |
| `candidat` | Informations personnelles des candidats |
| `entretien` | Planning, notes et résultats des entretiens |

---

## 4. Mesures DAX à créer

Aller dans **Modélisation** → **Nouvelle mesure** pour créer chaque mesure. Il est conseillé de les organiser dans un **dossier de mesures** nommé `_Recrutement`.

---

### Mesure 1 : Total des candidatures

```dax
Total Candidatures = COUNTROWS(candidature)
```

> Compte le nombre total de candidatures. Varie selon les filtres actifs (département, période, statut).

---

### Mesure 2 : Candidatures acceptées

```dax
Candidatures Acceptees = 
    CALCULATE(
        COUNTROWS(candidature),
        candidature[statut] = "Acceptee"
    )
```

---

### Mesure 3 : Candidatures refusées

```dax
Candidatures Refusees = 
    CALCULATE(
        COUNTROWS(candidature),
        candidature[statut] = "Refusee"
    )
```

---

### Mesure 4 : Taux d'acceptation (%)

```dax
Taux Acceptation = 
    DIVIDE(
        CALCULATE(COUNTROWS(candidature), candidature[statut] = "Acceptee"),
        COUNTROWS(candidature),
        0
    ) * 100
```

> Indique le pourcentage de candidatures aboutissant à une acceptation. Un taux faible peut signifier des annonces mal ciblées ou un manque de candidats qualifiés.

---

### Mesure 5 : Nombre de postes ouverts

```dax
Postes Ouverts = 
    CALCULATE(
        SUM(annonce[nombre_postes]),
        annonce[statut] = "Ouverte"
    )
```

---

### Mesure 6 : Nombre d'offres actives

```dax
Offres Actives = 
    CALCULATE(
        COUNTROWS(annonce),
        annonce[statut] IN {"Ouverte", "En cours"}
    )
```

> Compte les annonces dont le recrutement est encore en cours.

---

### Mesure 7 : Note moyenne des entretiens

```dax
Note Moyenne Entretien = AVERAGE(entretien[note])
```

> Moyenne des notes attribuées lors des entretiens. À comparer par poste ou par département.

---

### Mesure 8 : Délai moyen de recrutement (en jours)

```dax
Delai Moyen Recrutement = 
    AVERAGEX(
        FILTER(annonce, annonce[statut] = "Fermee"),
        DATEDIFF(annonce[date_publication], annonce[date_cloture], DAY)
    )
```

> Calcule en moyenne combien de jours s'écoulent entre la publication d'une offre et sa clôture. Un délai élevé peut indiquer une pénurie de profils ou un processus trop long.

---

### Mesure 9 : Taux d'entretiens favorables (%)

```dax
Taux Entretiens Favorables = 
    DIVIDE(
        CALCULATE(COUNTROWS(entretien), entretien[resultat] = "Favorable"),
        COUNTROWS(entretien),
        0
    ) * 100
```

---

## 5. Visuels à créer — Instructions détaillées

### Visuel 1 : KPI — Offres actives (Carte)

1. Cliquer sur une zone vide du canevas
2. Dans le volet **Visualisations**, sélectionner **Carte**
3. Faire glisser la mesure `Offres Actives` dans le champ **Valeur**
4. **Format** → **Étiquette de légende** → Texte : `Offres actives`
5. **Format** → **Étiquette de données** → Taille : `28pt`, Couleur : `#1B4F72`
6. Dimensionner la carte : environ `200 × 100 px`, positionner en haut à gauche

---

### Visuel 2 : KPI — Total candidatures (Carte)

1. Même procédure avec la mesure `Total Candidatures`
2. Étiquette : `Candidatures reçues`
3. Positionner à droite du KPI précédent

---

### Visuel 3 : KPI — Taux d'acceptation (Carte avec couleur conditionnelle)

1. Carte avec la mesure `Taux Acceptation`
2. Étiquette : `Taux d'acceptation (%)`
3. Appliquer une **couleur conditionnelle** en créant cette mesure auxiliaire :

```dax
Couleur Taux Acceptation = 
    IF([Taux Acceptation] >= 30, "#27AE60",
        IF([Taux Acceptation] >= 15, "#F39C12", "#E74C3C")
    )
```

> Interprétation : vert si ≥ 30 %, orange si entre 15 et 30 %, rouge si < 15 %.

---

### Visuel 4 : KPI — Délai moyen de recrutement (Carte)

1. Carte avec la mesure `Delai Moyen Recrutement`
2. Étiquette : `Délai moyen (jours)`
3. Format : `0 j`

---

### Visuel 5 : Funnel de Recrutement (Entonnoir)

> Représente le pipeline de recrutement : de la réception à l'acceptation finale.

1. Sélectionner le visuel **Entonnoir** dans le volet Visualisations
2. Configuration :
    - **Catégorie** : `candidature[statut]`
    - **Valeurs** : `Total Candidatures` (ou `Count of id_candidature`)
3. Format :
    - Couleurs par statut :
        - `Recue` → `#85C1E9`
        - `Preselectionnee` → `#2E86C1`
        - `Entretien` → `#1B4F72`
        - `Acceptee` → `#27AE60`
        - `Refusee` → `#E74C3C`
    - **Étiquettes de données** : Activé — afficher la valeur ET le pourcentage
4. Taille : `350 × 300 px`, positionner en bas à gauche

**Résultat attendu :**
```
    ┌────────────── Recue (N) ──────────────┐
    └──┌──── Preselectionnee (N) ────┐──────┘
       └──┌── Entretien (N) ──┐──────┘
          └── Acceptee (N) ──┘
              Refusee (N)
```

---

### Visuel 6 : Candidatures par Département (Barres empilées)

> Montre la répartition des candidatures par département et par statut.

1. Sélectionner **Graphique à barres empilées**
2. Configuration :
    - **Axe Y** : `departement[nom]`
    - **Axe X** : `Count of id_candidature`
    - **Légende** : `candidature[statut]`
3. Format :
    - Appliquer les couleurs par statut (voir palette ci-dessus)
    - **Étiquettes de données** : Activé
    - Titre : `Candidatures par département`
4. Taille : `350 × 300 px`

---

### Visuel 7 : Offres par Type de Contrat (Donut)

1. Sélectionner **Graphique en anneau**
2. Configuration :
    - **Légende** : `annonce[type_contrat]`
    - **Valeurs** : `Count of id_annonce`
3. Format :
    - CDI → `#1B4F72`
    - CDD → `#2E86C1`
    - Stage → `#85C1E9`
    - Freelance → `#F39C12`
    - **Position de la légende** : En bas
    - Titre : `Offres par type de contrat`
4. Taille : `300 × 250 px`

---

### Visuel 8 : Notes Moyennes par Poste (Barres horizontales)

> Permet d'identifier les postes où les entretiens sont les plus sélectifs.

1. Sélectionner **Graphique à barres groupées**
2. Configuration :
    - **Axe Y** : `annonce[poste]`
    - **Axe X** : `Note Moyenne Entretien`
3. Format :
    - Couleur des barres : `#2E86C1`
    - **Étiquettes de données** : Activé, format `0.00`
    - Titre : `Note moyenne entretien par poste`
    - Axe X : Min = 0, Max = 20

---

### Visuel 9 : Tableau des Entretiens (Détails)

> Liste complète des entretiens avec notes et résultats.

1. Sélectionner le visuel **Tableau**
2. Colonnes à afficher :
    - `candidat[Nom Complet Candidat]`
    - `annonce[poste]`
    - `entretien[date_entretien]`
    - `entretien[type_entretien]`
    - `entretien[note]`
    - `entretien[resultat]`
3. Format :
    - Tri par `entretien[date_entretien]` décroissant (les plus récents en premier)
    - **Mise en forme conditionnelle sur `note`** :
        1. Cliquer sur `note` → **...** → **Mise en forme conditionnelle** → **Couleur d'arrière-plan**
        2. Règles : note ≥ 15 → `#27AE60` (vert) ; note ≥ 10 → `#F39C12` (orange) ; sinon → `#E74C3C` (rouge)
    - **Mise en forme conditionnelle sur `resultat`** :
        - `Favorable` → fond vert, `Defavorable` → fond rouge
    - Titre : `Détails des entretiens`

---

### Visuel 10 : Top 5 Candidats (Tableau trié)

> Affiche les 5 candidats avec les meilleures notes d'évaluation.

1. Sélectionner **Tableau**
2. Colonnes :
    - `candidat[Nom Complet Candidat]`
    - `candidat[niveau_etude]`
    - `candidat[experience_annees]`
    - `candidature[note_evaluation]`
    - `candidature[statut]`
3. **Filtre visuel** : Top N → Afficher les 5 premiers par `note_evaluation` décroissant
    - Cliquer sur le visuel → volet **Filtres** → **Filtre du niveau visuel** → `note_evaluation` → **Filtrage N premiers** → N = 5
4. Titre : `Top 5 candidats`

---

## 6. Filtres (Slicers)

Placer les slicers en haut à droite de la page.

### Slicer 1 : Département

1. Sélectionner **Segment**
2. Champ : `departement[nom]`
3. Style : **Liste déroulante** (Format → Contrôle du segment → Style : liste déroulante)
4. Titre : `Département`

### Slicer 2 : Statut de l'annonce

1. Segment avec `annonce[statut]`
2. Style : **Boutons** (Format → Contrôle du segment → Style : boutons)
3. Titre : `Statut offre`

### Slicer 3 : Période (date de publication)

1. Segment avec `annonce[date_publication]`
2. Style : **Plage de dates** (entre deux dates)
3. Titre : `Période`

---

## 7. Interactions entre visuels

Pour configurer les interactions entre visuels :
1. Sélectionner un visuel → onglet **Format** → **Modifier les interactions**
2. Pour chaque autre visuel, choisir l'icône souhaitée : **Filtrer** 🔗, **Mettre en surbrillance** ou **Aucune** ⛔

**Recommandations pour cette page :**

| Visuel source (clic) | Action sur les autres visuels |
|----------------------|-------------------------------|
| Funnel de recrutement | Filtrer le tableau des entretiens et le Top 5 |
| Barres candidatures/département | Filtrer tous les autres visuels |
| Slicers (département, statut, période) | Filtrer TOUS les visuels de la page |
| KPIs | Aucune interaction (lecture seule) |

---

*Tutoriel RH-PowerBI — Page 1 Recrutement — Madagascar — 2025*