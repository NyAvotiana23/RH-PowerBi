# 📊 Power BI — Page 2 : Gestion des Employés
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

Cette page offre une **vue complète et analytique des effectifs** de l'entreprise, organisée autour de quatre axes :

- 👥 **Effectifs** : répartition par département, sexe, type de contrat, tranche d'âge
- 📈 **Performances** : évolution des notes d'évaluation dans le temps
- 🏖️ **Congés & Absences** : types de congés pris, soldes restants
- 🎓 **Formations** : suivi des formations par département et statut

---

## 2. Disposition visuelle

```
┌─────────────────────────────────────────────────────────────────┐
│  👥 GESTION DES EMPLOYÉS                                        │
├─────────┬─────────┬─────────┬─────────┬────────────────────────┤
│  KPI 1  │  KPI 2  │  KPI 3  │  KPI 4  │  FILTRE Département   │
│ Effectif│ Ancien- │ Perfor- │Turnover │  FILTRE Sexe          │
│  actif  │ neté    │ mance   │   (%)   │  FILTRE Contrat       │
├─────────┴─────────┼─────────┴─────────┼────────────────────────┤
│                   │                   │                        │
│  Effectif par     │  Répartition      │  Types de contrat      │
│  département      │  H/F (Donut)      │  (Camembert)           │
│  (Barres horiz.)  │                   │                        │
├───────────────────┼───────────────────┼────────────────────────┤
│                   │                   │                        │
│  Évolution        │  Congés par type  │   Formations           │
│  performances     │  (Donut)          │   par statut           │
│  (Courbes)        │                   │   (Barres empilées)    │
├───────────────────┴───────────────────┴────────────────────────┤
│  TABLEAU : Liste des employés avec détails (scrollable)        │
└────────────────────────────────────────────────────────────────┘
```

---

## 3. Tables utilisées

| Table | Rôle dans cette page |
|-------|---------------------|
| `employe` | Table centrale — données personnelles, contrat, salaire |
| `departement` | Nom des départements |
| `performance` | Évaluations et notes des employés |
| `conge` | Types de congés et nombre de jours |
| `absence` | Enregistrements des absences |
| `formation` | Formations suivies et leur statut |
| `dossieremploye` | Données complémentaires du dossier |

---

## 4. Mesures DAX à créer

Aller dans **Modélisation** → **Nouvelle mesure**. Créer un dossier de mesures `_Employes`.

---

### Mesure 1 : Effectif actif

```dax
Effectif Actif = 
    CALCULATE(COUNTROWS(employe), employe[statut] = "Actif")
```

> Compte uniquement les employés dont le statut est `Actif`. Exclut les inactifs et suspendus.

---

### Mesure 2 : Effectif total

```dax
Effectif Total = COUNTROWS(employe)
```

---

### Mesure 3 : Ancienneté moyenne (en années)

```dax
Anciennete Moyenne = 
    AVERAGEX(
        FILTER(employe, employe[statut] = "Actif"),
        DATEDIFF(employe[date_embauche], TODAY(), YEAR)
    )
```

> Calcule la moyenne d'années d'ancienneté sur les employés actifs uniquement.

---

### Mesure 4 : Performance moyenne

```dax
Performance Moyenne = AVERAGE(performance[note_globale])
```

---

### Mesure 5 : Taux moyen d'objectifs atteints (%)

```dax
Objectifs Moyens = AVERAGE(performance[objectifs_atteints])
```

---

### Mesure 6 : Taux de turnover (%)

```dax
Turnover = 
    DIVIDE(
        CALCULATE(COUNTROWS(employe), employe[statut] <> "Actif"),
        COUNTROWS(employe),
        0
    ) * 100
```

> Ratio des employés inactifs ou suspendus par rapport à l'effectif total. Un taux > 20 % est un signal d'alerte RH.

---

### Mesure 7 : Taux de promotion (%)

```dax
Taux Promotion = 
    DIVIDE(
        CALCULATE(COUNTROWS(performance), performance[recommandation] = "Promotion"),
        COUNTROWS(performance),
        0
    ) * 100
```

---

### Mesure 8 : Total jours de congé approuvés

```dax
Total Jours Conge = 
    CALCULATE(
        SUM(conge[nombre_jours]),
        conge[statut] = "Approuve"
    )
```

---

### Mesure 9 : Formations terminées

```dax
Formations Terminees = 
    CALCULATE(COUNTROWS(formation), formation[statut] = "Terminee")
```

---

### Mesure 10 : Coût total des formations

```dax
Cout Total Formations = SUM(formation[cout])
```

---

### Mesure 11 : Ratio Hommes / Femmes (texte)

```dax
Ratio HF = 
    VAR Hommes = CALCULATE(COUNTROWS(employe), employe[sexe] = "Masculin")
    VAR Femmes = CALCULATE(COUNTROWS(employe), employe[sexe] = "Feminin")
    RETURN Hommes & "H / " & Femmes & "F"
```

> Produit un affichage type `"12H / 8F"`. Utile dans une carte de type texte.

---

## 5. Visuels à créer — Instructions détaillées

### Visuels 1 à 4 : KPIs (4 Cartes en haut)

| N° | Mesure | Étiquette | Couleur / Format |
|----|--------|-----------|------------------|
| 1 | `Effectif Actif` | Effectif actif | `#1B4F72`, taille `32pt` |
| 2 | `Anciennete Moyenne` | Ancienneté moy. (ans) | Format `0.0` |
| 3 | `Performance Moyenne` | Note performance | Format `0.00 / 20` |
| 4 | `Turnover` | Turnover (%) | Vert < 10%, orange 10-20%, rouge > 20% |

Pour la couleur conditionnelle sur le KPI Turnover :
```dax
Couleur Turnover = 
    IF([Turnover] < 10, "#27AE60",
        IF([Turnover] < 20, "#F39C12", "#E74C3C")
    )
```

---

### Visuel 5 : Effectif par Département (Barres horizontales)

1. **Graphique à barres groupées**
2. Configuration :
    - **Axe Y** : `departement[nom]`
    - **Axe X** : `Effectif Actif` (ou `Count of id_employe`)
3. Format :
    - Couleur des barres : `#2E86C1`
    - **Étiquettes de données** : Activé
    - Titre : `Effectif par département`
4. **Interactivité** : cliquer sur une barre filtre automatiquement tous les autres visuels de la page

---

### Visuel 6 : Répartition Hommes / Femmes (Donut)

1. **Graphique en anneau**
2. Configuration :
    - **Légende** : `employe[sexe]`
    - **Valeurs** : `Count of id_employe`
3. Format :
    - `Masculin` → `#2E86C1`
    - `Feminin` → `#E74C3C`
    - **Étiquettes** : afficher la valeur ET le pourcentage
    - Titre : `Répartition H/F`

---

### Visuel 7 : Types de Contrat (Camembert)

1. **Graphique en secteurs**
2. Configuration :
    - **Légende** : `employe[type_contrat]`
    - **Valeurs** : `Count of id_employe`
3. Couleurs :
    - CDI → `#1B4F72`
    - CDD → `#F39C12`
    - Stage → `#85C1E9`
4. Titre : `Types de contrat`

---

### Visuel 8 : Évolution des Performances par Trimestre (Courbes)

> Montre l'évolution de la note moyenne sur plusieurs périodes d'évaluation.

1. **Graphique en courbes**
2. Configuration :
    - **Axe X** : `performance[periode]`
    - **Valeurs** : `Performance Moyenne`
    - *(Optionnel)* **Légende** : `employe[Nom Complet]` pour une vue par employé
3. Format :
    - **Marqueurs** : Activé
    - **Étiquettes de données** : Activé
    - Axe Y : Min = 0, Max = 20
    - Titre : `Évolution des performances par trimestre`

> 💡 **Astuce tri chronologique :** Cliquer sur le visuel → **...** → **Trier par** → `date_evaluation` → **Ordre croissant**

---

### Visuel 9 : Congés Approuvés par Type (Donut)

1. **Graphique en anneau**
2. Configuration :
    - **Légende** : `conge[type_conge]`
    - **Valeurs** : `SUM(conge[nombre_jours])` filtré sur `statut = "Approuve"`
3. Couleurs :
    - Annuel → `#2E86C1`
    - Maladie → `#E74C3C`
    - Maternite → `#9B59B6`
    - Paternite → `#3498DB`
    - Sans solde → `#95A5A6`
    - Formation → `#F39C12`
    - Exceptionnel → `#1ABC9C`
4. Titre : `Congés approuvés par type`

---

### Visuel 10 : Formations par Département et Statut (Barres empilées)

1. **Graphique à colonnes empilées**
2. Configuration :
    - **Axe X** : `departement[nom]` (via la relation `employe`)
    - **Valeurs** : `Count of id_formation`
    - **Légende** : `formation[statut]`
3. Couleurs :
    - Terminee → `#27AE60`
    - En cours → `#F39C12`
    - Planifiee → `#2E86C1`
    - Annulee → `#E74C3C`
4. Titre : `Formations par département et statut`

---

### Visuel 11 : Tableau détaillé des Employés

> Vue complète et scrollable de tous les employés avec leurs informations clés.

1. **Tableau**
2. Colonnes à afficher :

| Champ | Format |
|-------|--------|
| `employe[matricule]` | Texte |
| `employe[Nom Complet]` | Texte |
| `departement[nom]` | Texte |
| `employe[poste]` | Texte |
| `employe[type_contrat]` | Texte |
| `employe[date_embauche]` | `dd/MM/yyyy` |
| `employe[salaire_base]` | `#,##0 Ar` |
| `employe[statut]` | Mise en forme conditionnelle |

3. **Mise en forme conditionnelle sur `statut`** :
    - `Actif` → fond vert `#27AE60`, texte blanc
    - `Inactif` → fond gris `#95A5A6`
    - `Suspendu` → fond orange `#F39C12`
4. **Tri** par `matricule` croissant
5. Titre : `Liste des employés`

---

## 6. Filtres (Slicers)

| Slicer | Champ | Style |
|--------|-------|-------|
| Département | `departement[nom]` | Liste déroulante |
| Sexe | `employe[sexe]` | Boutons |
| Type de contrat | `employe[type_contrat]` | Boutons |
| Période d'évaluation | `performance[periode]` | Liste déroulante |

---

## 7. Interactions entre visuels

**Recommandations :**

| Visuel source (clic) | Action recommandée |
|----------------------|--------------------|
| Barres effectif par département | Filtrer TOUS les visuels de la page |
| Donut H/F | Filtrer le tableau employés et les KPIs |
| Slicers | Filtrer TOUS les visuels sans exception |
| Courbe performances | Filtrer uniquement le tableau employés |

> 💡 **Astuce :** Désactiver l'interaction entre le Donut H/F et le Donut Congés pour éviter un filtrage croisé non pertinent (**Modifier les interactions** → icône Aucune ⛔).

---

*Tutoriel RH-PowerBI — Page 2 Employés — Madagascar — 2025*