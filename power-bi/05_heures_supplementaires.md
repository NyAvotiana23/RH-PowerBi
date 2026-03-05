# 📊 Power BI — Page 5 : Gestion des Heures Supplémentaires
### Projet RH Madagascar — Base `rh_madagascar`

> **Prérequis :** Avoir complété le fichier `00_setup_commun.md` (connexion, relations, colonnes calculées, thème).

---

## Table des matières

1. [Objectif de la page](#1-objectif-de-la-page)
2. [Disposition visuelle](#2-disposition-visuelle)
3. [Tables utilisées](#3-tables-utilisées)
4. [Mesures DAX à créer](#4-mesures-dax-à-créer)
5. [Colonne calculée à créer](#5-colonne-calculée-à-créer)
6. [Visuels à créer — Instructions détaillées](#6-visuels-à-créer--instructions-détaillées)
7. [Filtres (Slicers)](#7-filtres-slicers)
8. [Interactions entre visuels](#8-interactions-entre-visuels)

---

## 1. Objectif de la page

Cette page suit et analyse les **heures supplémentaires** effectuées par les employés :

- ⏱️ **Volume** : nombre total d'heures supplémentaires par mois et par département
- 💸 **Coût** : montant total à payer en heures supplémentaires
- 📋 **Statut des demandes** : En attente, Approuvées, Payées, Refusées
- 📊 **Taux de majoration** : répartition entre 130%, 150% et 200%
- 🏆 **Top employés** : ceux qui effectuent le plus d'heures supplémentaires
- ⚖️ **Ratio HS / masse salariale** : indicateur de contrôle budgétaire

---

## 2. Disposition visuelle

```
┌─────────────────────────────────────────────────────────────────┐
│  ⏰ HEURES SUPPLÉMENTAIRES                                      │
├─────────┬─────────┬─────────┬─────────┬────────────────────────┤
│  KPI 1  │  KPI 2  │  KPI 3  │  KPI 4  │  FILTRE Période       │
│ Total   │ Coût    │ HS en   │Moyenne  │  FILTRE Département   │
│ heures  │ total   │ attente │HS/empl. │  FILTRE Taux major.   │
├─────────┴─────────┼─────────┴─────────┼────────────────────────┤
│                   │                   │                        │
│  HS par mois      │  HS par           │  Répartition par       │
│  (Combo chart)    │  département      │  taux majoration       │
│  heures + montant │  (Barres)         │  (Donut)               │
├───────────────────┼───────────────────┼────────────────────────┤
│                   │                   │                        │
│  Statut des       │  Top employés     │  Ratio HS / Masse     │
│  demandes HS      │  HS (Tableau)     │  salariale (Jauge)    │
│  (Barres empilées)│                   │                        │
└───────────────────┴───────────────────┴────────────────────────┘
```

---

## 3. Tables utilisées

| Table | Rôle dans cette page |
|-------|---------------------|
| `heuressupplementaires` | Table principale : demandes, heures, taux, montants, statuts |
| `employe` | Nom, département |
| `departement` | Regroupement par département |
| `paie` | Utilisée pour calculer le ratio HS / masse salariale |

---

## 4. Mesures DAX à créer

Aller dans **Modélisation** → **Nouvelle mesure**. Créer un dossier `_HeuresSupp`.

---

### Mesure 1 : Total heures supplémentaires

```dax
Total HS Heures = SUM(heuressupplementaires[nombre_heures])
```

---

### Mesure 2 : Coût total des heures supplémentaires

```dax
Cout Total HS = SUM(heuressupplementaires[montant_calcule])
```

> Somme des montants calculés (heures × taux horaire × taux de majoration).

---

### Mesure 3 : HS en attente (nombre de demandes)

```dax
HS En Attente = 
    CALCULATE(
        COUNTROWS(heuressupplementaires),
        heuressupplementaires[statut] = "En attente"
    )
```

> Nombre de demandes d'heures supplémentaires soumises mais pas encore approuvées.

---

### Mesure 4 : Moyenne HS par employé

```dax
Moyenne HS Par Employe = 
    AVERAGEX(
        VALUES(heuressupplementaires[id_employe]),
        CALCULATE(SUM(heuressupplementaires[nombre_heures]))
    )
```

> Calcule la moyenne des heures supplémentaires effectuées par chaque employé distinct.

---

### Mesure 5 : HS approuvées et non encore payées (montant)

```dax
HS A Payer = 
    CALCULATE(
        SUM(heuressupplementaires[montant_calcule]),
        heuressupplementaires[statut] = "Approuvee"
    )
```

> Montant total des HS approuvées mais dont le paiement n'a pas encore été effectué.

---

### Mesure 6 : HS payées (montant)

```dax
HS Payees = 
    CALCULATE(
        SUM(heuressupplementaires[montant_calcule]),
        heuressupplementaires[statut] = "Payee"
    )
```

---

### Mesure 7 : Ratio HS / Masse salariale brute (%)

```dax
Ratio HS Masse = 
    DIVIDE(
        [Cout Total HS],
        [Masse Salariale Brute],
        0
    ) * 100
```

> Indique la proportion que représentent les HS par rapport à la masse salariale brute totale. L'objectif est de rester sous 5 %.

> ⚠️ Cette mesure utilise `Masse Salariale Brute` définie dans la page Paie. S'assurer que cette mesure existe avant de créer celle-ci.

---

### Mesure 8 : Nombre total de demandes HS

```dax
Nb Demandes HS = COUNTROWS(heuressupplementaires)
```

---

### Mesure 9 : HS au taux 150 %

```dax
HS Taux 150 = 
    CALCULATE(
        SUM(heuressupplementaires[nombre_heures]),
        heuressupplementaires[taux_majoration] = 1.50
    )
```

---

### Mesure 10 : HS au taux 200 %

```dax
HS Taux 200 = 
    CALCULATE(
        SUM(heuressupplementaires[nombre_heures]),
        heuressupplementaires[taux_majoration] = 2.00
    )
```

---

## 5. Colonne calculée à créer

Cette colonne calculée est nécessaire pour afficher un libellé lisible dans le Donut des taux de majoration.

### Table `heuressupplementaires` — Libellé du taux

```dax
Libelle Taux = 
    IF(
        heuressupplementaires[taux_majoration] = 1.50,
        "150% (jour / nuit)",
        "200% (dimanche / férié)"
    )
```

> Affiche un libellé compréhensible à la place d'un chiffre décimal dans les légendes.

---

## 6. Visuels à créer — Instructions détaillées

### Visuels 1 à 4 : KPIs (4 Cartes en haut)

| N° | Mesure | Étiquette | Format |
|----|--------|-----------|--------|
| 1 | `Total HS Heures` | Total heures sup. | `0.0 h` |
| 2 | `Cout Total HS` | Coût total HS | `#,##0 Ar` |
| 3 | `HS En Attente` | Demandes en attente | Couleur orange si > 0 |
| 4 | `Moyenne HS Par Employe` | Moy. HS / employé | `0.0 h` |

---

### Visuel 5 : HS par Mois — Heures + Montant (Graphique combiné)

> Affiche les heures supplémentaires (barres) et leur coût (courbe) sur l'axe du temps.

1. **Graphique combiné (barres + courbe)**
2. Configuration :
    - **Axe X** : `heuressupplementaires[date_hs]` avec granularité **Mois**
    - **Valeurs colonne (axe Y gauche)** : `Total HS Heures`
    - **Valeurs ligne (axe Y droit)** : `Cout Total HS`
3. Format :
    - Colonnes : `#2E86C1` (bleu)
    - Ligne : `#E74C3C` (rouge)
    - Activer le **2e axe Y** pour le montant (Format → Axe Y secondaire)
    - **Marqueurs** : Activé
    - Titre : `Heures sup. et coût par mois`

---

### Visuel 6 : HS par Département (Barres horizontales)

1. **Graphique à barres groupées**
2. Configuration :
    - **Axe Y** : `departement[nom]`
    - **Axe X** : `Total HS Heures`
3. Format :
    - Couleur : `#1B4F72` (bleu foncé)
    - **Étiquettes de données** : Activé, format `0.0 h`
    - Titre : `Heures sup. par département`

---

### Visuel 7 : Répartition par Taux de Majoration (Donut)

> Montre la proportion d'heures supplémentaires selon leur taux de majoration applicable.

1. **Graphique en anneau**
2. Configuration :
    - **Légende** : `heuressupplementaires[Libelle Taux]` *(colonne calculée créée ci-dessus)*
    - **Valeurs** : `Total HS Heures`
3. Couleurs :
    - 150% (jour / nuit) → `#2E86C1`
    - 200% (dimanche / férié) → `#E74C3C`
4. Titre : `Répartition par taux de majoration`

---

### Visuel 8 : Statut des Demandes HS par Mois (Barres empilées)

> Permet de voir combien de demandes sont en attente, approuvées, payées ou refusées chaque mois.

1. **Graphique à colonnes empilées**
2. Configuration :
    - **Axe X** : `heuressupplementaires[date_hs]` (granularité **Mois**)
    - **Valeurs** : `Nb Demandes HS`
    - **Légende** : `heuressupplementaires[statut]`
3. Couleurs par statut :
    - En attente → `#F39C12`
    - Approuvee → `#2E86C1`
    - Payee → `#27AE60`
    - Refusee → `#E74C3C`
4. Titre : `Statut des demandes HS par mois`

---

### Visuel 9 : Top 10 Employés en Heures Supplémentaires (Tableau trié)

> Identifie les 10 employés ayant effectué le plus grand nombre d'heures supplémentaires.

1. **Tableau**
2. Colonnes :

| Champ | Format |
|-------|--------|
| `employe[Nom Complet]` | Texte |
| `departement[nom]` | Texte |
| `Total HS Heures` | `0.0 h` |
| `Cout Total HS` | `#,##0 Ar` |
| `heuressupplementaires[motif]` | Texte |

3. Tri : `Total HS Heures` décroissant
4. **Filtre visuel Top N** = 10 par `Total HS Heures` décroissant
5. **Mise en forme conditionnelle** : barres de données sur `Total HS Heures`
6. Titre : `Top 10 employés en heures supplémentaires`

---

### Visuel 10 : Ratio HS / Masse Salariale (Jauge)

> Indicateur de contrôle budgétaire des heures supplémentaires.

1. **Jauge**
2. Configuration :
    - **Valeur** : `Ratio HS Masse`
    - **Valeur minimale** : 0
    - **Valeur maximale** : 10
    - **Valeur cible** : 5 (objectif à ne pas dépasser)
3. Couleurs de zone :
    - < 3 % → vert `#27AE60`
    - 3 à 5 % → orange `#F39C12`
    - > 5 % → rouge `#E74C3C`
4. Titre : `Ratio HS / Masse salariale (%)`

---

## 7. Filtres (Slicers)

| Slicer | Champ | Style |
|--------|-------|-------|
| Période | `heuressupplementaires[date_hs]` | Plage de dates |
| Département | `departement[nom]` | Liste déroulante |
| Statut HS | `heuressupplementaires[statut]` | Boutons |
| Taux de majoration | `heuressupplementaires[Libelle Taux]` | Boutons |

> 💡 **Conseil :** Utiliser le slicer **Statut HS = "Approuvee"** pour voir uniquement les HS approuvées et non encore payées, afin de préparer la prochaine paie.

---

## 8. Interactions entre visuels

| Visuel source (clic) | Action recommandée |
|----------------------|--------------------|
| Barres HS par département | Filtrer le Tableau Top 10 et le Donut taux |
| Donut taux majoration | Filtrer les Barres HS par mois |
| Barres empilées statut | Filtrer le Tableau Top 10 |
| Slicers | Filtrer TOUS les visuels sans exception |

---

*Tutoriel RH-PowerBI — Page 5 Heures Supplémentaires — Madagascar — 2025*