# 📊 Power BI — Page 4 : Gestion des Présences
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

Cette page permet un **suivi quotidien et mensuel de la ponctualité et des présences** des employés :

- ✅ **Présence** : taux de présence global et par département
- ⏰ **Ponctualité** : identification des employés les plus souvent en retard
- ❌ **Absences** : répartition des absences justifiées vs injustifiées
- 📅 **Heatmap** : calendrier visuel de présence (couleurs par statut)
- 📈 **Tendances** : évolution mensuelle du taux d'absentéisme

---

## 2. Disposition visuelle

```
┌─────────────────────────────────────────────────────────────────┐
│  📅 GESTION DES PRÉSENCES                                       │
├─────────┬─────────┬─────────┬─────────┬────────────────────────┤
│  KPI 1  │  KPI 2  │  KPI 3  │  KPI 4  │  FILTRE Mois          │
│  Taux   │  Nb     │  Total  │ Taux    │  FILTRE Département   │
│présence │retards  │ heures  │absences │  FILTRE Employé       │
├─────────┴─────────┼─────────┴─────────┼────────────────────────┤
│                   │                   │                        │
│  Taux de présence │  Présence par     │  Absences par type     │
│  par département  │  statut (Donut)   │  (Camembert)           │
│  (Barres groupées)│                   │                        │
├───────────────────┼───────────────────┼────────────────────────┤
│                   │                   │                        │
│  Heatmap présence │  Retards par      │  Tendance absences     │
│  (Matrice colorée)│  employé (Barres) │  par mois (Courbe)     │
│                   │                   │                        │
├───────────────────┴───────────────────┴────────────────────────┤
│  TABLEAU : Détail présences de la période sélectionnée         │
└────────────────────────────────────────────────────────────────┘
```

---

## 3. Tables utilisées

| Table | Rôle dans cette page |
|-------|---------------------|
| `presence` | Pointage journalier : heure arrivée, départ, statut |
| `absence` | Enregistrement des absences et leurs types |
| `employe` | Nom, département |
| `departement` | Regroupement par département |

---

## 4. Mesures DAX à créer

Aller dans **Modélisation** → **Nouvelle mesure**. Créer un dossier `_Presences`.

---

### Mesure 1 : Taux de présence global (%)

```dax
Taux Presence = 
    DIVIDE(
        CALCULATE(COUNTROWS(presence), presence[statut] = "Present"),
        COUNTROWS(presence),
        0
    ) * 100
```

> Calcule le pourcentage de jours de présence effective parmi tous les jours enregistrés. L'objectif est ≥ 90 %.

---

### Mesure 2 : Nombre de retards

```dax
Nb Retards = 
    CALCULATE(COUNTROWS(presence), presence[statut] = "Retard")
```

> Un retard correspond à une arrivée entre 08:00 et 09:00 selon la configuration RH.

---

### Mesure 3 : Total heures travaillées

```dax
Total Heures Travaillees = SUM(presence[heures_travaillees])
```

---

### Mesure 4 : Heures moyennes par jour

```dax
Heures Moyennes Jour = AVERAGE(presence[heures_travaillees])
```

---

### Mesure 5 : Taux d'absentéisme (%)

```dax
Taux Absenteisme = 
    DIVIDE(
        CALCULATE(COUNTROWS(presence), presence[statut] = "Absent"),
        COUNTROWS(presence),
        0
    ) * 100
```

> Complémentaire au taux de présence. Un taux > 10 % est un signal d'alerte.

---

### Mesure 6 : Jours de congé (dans le pointage)

```dax
Jours Conge Presence = 
    CALCULATE(COUNTROWS(presence), presence[statut] = "Conge")
```

> Compte les jours où le statut de présence est "Congé" (jour autorisé).

---

### Mesure 7 : Absences injustifiées

```dax
Absences Injustifiees = 
    CALCULATE(COUNTROWS(absence), absence[type_absence] = "Injustifiee")
```

---

### Mesure 8 : Absences justifiées

```dax
Absences Justifiees = 
    CALCULATE(COUNTROWS(absence), absence[type_absence] = "Justifiee")
```

---

### Mesure 9 : Total heures d'absence

```dax
Total Heures Absence = SUM(absence[duree_heures])
```

---

### Mesure 10 : Présents aujourd'hui

```dax
Presents Aujourdhui = 
    CALCULATE(
        COUNTROWS(presence),
        presence[statut] = "Present",
        presence[date_presence] = TODAY()
    )
```

> Permet d'afficher un KPI en temps réel si les données sont actualisées quotidiennement.

---

## 5. Visuels à créer — Instructions détaillées

### Visuels 1 à 4 : KPIs (4 Cartes en haut)

| N° | Mesure | Étiquette | Couleur conditionnelle |
|----|--------|-----------|----------------------|
| 1 | `Taux Presence` | Taux présence (%) | ≥ 90 % → vert, 80-90 % → orange, < 80 % → rouge |
| 2 | `Nb Retards` | Retards | < 5 → vert, 5-15 → orange, > 15 → rouge |
| 3 | `Total Heures Travaillees` | Heures totales | Bleu `#2E86C1` |
| 4 | `Taux Absenteisme` | Absentéisme (%) | < 5 % → vert, 5-10 % → orange, > 10 % → rouge |

---

### Visuel 5 : Taux de Présence par Département (Barres horizontales)

> Compare le taux de présence de chaque département avec l'objectif fixé.

1. **Graphique à barres groupées**
2. Configuration :
    - **Axe Y** : `departement[nom]`
    - **Axe X** : `Taux Presence`
3. Format :
    - Couleur des barres : `#27AE60` (vert)
    - **Étiquettes** : Activé, format `0.0%`
    - Axe X : Min = 0, Max = 100
    - **Ligne de référence à 90 %** (objectif) : aller dans **Analytique** → **Ligne constante** → valeur = 90
4. Titre : `Taux de présence par département`

---

### Visuel 6 : Présence par Statut (Donut)

> Montre la répartition globale de tous les statuts de présence.

1. **Graphique en anneau**
2. Configuration :
    - **Légende** : `presence[statut]`
    - **Valeurs** : `Count of id_presence`
3. Couleurs par statut :
    - Present → `#27AE60`
    - Absent → `#E74C3C`
    - Retard → `#F39C12`
    - Conge → `#2E86C1`
    - Teletravail → `#9B59B6`
4. Titre : `Répartition des statuts de présence`

---

### Visuel 7 : Absences par Type (Camembert)

1. **Graphique en secteurs**
2. Configuration :
    - **Légende** : `absence[type_absence]`
    - **Valeurs** : `Count of id_absence`
3. Couleurs :
    - Justifiee → `#27AE60`
    - Injustifiee → `#E74C3C`
    - Retard → `#F39C12`
    - Maladie → `#9B59B6`
4. Titre : `Absences par type`

---

### Visuel 8 : Heatmap de Présence (Matrice colorée)

> Visualise le calendrier de présence de chaque employé, coloré selon le statut du jour.

1. **Matrice**
2. Configuration :
    - **Lignes** : `employe[Nom Complet]`
    - **Colonnes** : `presence[date_presence]`
    - **Valeurs** : `presence[statut]`
3. **Mise en forme conditionnelle** → **Couleur d'arrière-plan** basée sur des règles :
    - `"Present"` → `#27AE60` (vert)
    - `"Absent"` → `#E74C3C` (rouge)
    - `"Retard"` → `#F39C12` (orange)
    - `"Conge"` → `#2E86C1` (bleu)
    - `"Teletravail"` → `#9B59B6` (violet)
4. Titre : `Calendrier de présence`

> ⚠️ **Si la matrice est trop dense** (trop d'employés ou de dates), utiliser cette alternative :
> - Lignes : `employe[Nom Complet]`
> - Colonnes : jour de la semaine (créer une colonne calculée `Jour Semaine = FORMAT(presence[date_presence], "DDD")`)
> - Valeurs : Nombre de présences par statut

---

### Visuel 9 : Retards par Employé (Top 10 — Barres horizontales)

> Identifie les employés les plus souvent en retard pour un suivi disciplinaire ciblé.

1. **Graphique à barres groupées**
2. Configuration :
    - **Axe Y** : `employe[Nom Complet]`
    - **Axe X** : `Nb Retards`
3. Tri : décroissant par nombre de retards
4. **Filtre visuel Top N** = 10 (afficher seulement les 10 employés avec le plus de retards)
5. Couleur : `#F39C12` (orange)
6. **Étiquettes de données** : Activé
7. Titre : `Nombre de retards par employé (Top 10)`

---

### Visuel 10 : Tendance des Absences par Mois (Courbe)

> Montre l'évolution mensuelle du nombre d'absences pour détecter des pics saisonniers.

1. **Graphique en courbes**
2. Configuration :
    - **Axe X** : `absence[date_absence]` avec granularité **Mois**
    - **Valeurs** : `Count of id_absence`
3. Format :
    - **Marqueurs** : Activé
    - Couleur de la courbe : `#E74C3C` (rouge)
    - Titre : `Tendance mensuelle des absences`

> 💡 **Pour voir par type d'absence :** Ajouter `absence[type_absence]` dans le champ **Légende** pour une vue multi-courbes.

---

### Visuel 11 : Tableau détaillé des Présences

1. **Tableau**
2. Colonnes :

| Champ | Format |
|-------|--------|
| `employe[Nom Complet]` | Texte |
| `presence[date_presence]` | `dd/MM/yyyy` |
| `presence[heure_arrivee]` | Heure |
| `presence[heure_depart]` | Heure |
| `presence[heures_travaillees]` | `0.00 h` |
| `presence[statut]` | Mise en forme conditionnelle |
| `presence[commentaire]` | Texte |

3. **Mise en forme conditionnelle** sur `statut` (même code couleur que les autres visuels)
4. Titre : `Détail des présences`

---

## 6. Filtres (Slicers)

| Slicer | Champ | Style |
|--------|-------|-------|
| Période | `presence[date_presence]` | Plage de dates |
| Département | `departement[nom]` | Liste déroulante |
| Employé | `employe[Nom Complet]` | Barre de recherche |
| Statut | `presence[statut]` | Boutons |

> 💡 **Conseil :** Pour analyser un jour précis, utiliser le slicer **Période** avec les deux dates identiques (ex : 15/03/2025 → 15/03/2025). Cela permet de voir qui était présent ce jour-là.

---

## 7. Interactions entre visuels

| Visuel source (clic) | Action recommandée |
|----------------------|--------------------|
| Barres taux présence/département | Filtrer la Heatmap et le Tableau |
| Donut statut présence | Filtrer le Tableau détaillé |
| Barres retards par employé | Filtrer le Tableau pour voir les détails de cet employé |
| Slicers | Filtrer TOUS les visuels sans exception |

---

*Tutoriel RH-PowerBI — Page 4 Présences — Madagascar — 2025*