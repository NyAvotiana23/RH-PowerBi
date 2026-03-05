# 📊 Power BI — Page 3 : Gestion de la Paie
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

Cette page centralise le **suivi financier de la masse salariale** :

- 💰 **Masse salariale** : comparaison mensuelle Brut vs Net
- 🧮 **Déductions** : répartition CNaPS, OSTIE, IRSA
- 📊 **Analyse par département** : coût salarial de chaque département
- ⏱️ **Coût des heures supplémentaires** : impact sur la masse salariale
- 🏆 **Top salaires** : identifier les postes les mieux rémunérés

---

## 2. Disposition visuelle

```
┌─────────────────────────────────────────────────────────────────┐
│  💰 GESTION DE LA PAIE                                          │
├─────────┬─────────┬─────────┬─────────┬────────────────────────┤
│  KPI 1  │  KPI 2  │  KPI 3  │  KPI 4  │  FILTRE Mois/Année   │
│ Masse   │ Masse   │ Total   │ Salaire │  FILTRE Département  │
│ brute   │ nette   │ déduc.  │ moy net │  FILTRE Employé      │
├─────────┴─────────┴─────────┴─────────┴────────────────────────┤
│                                                                 │
│  Masse salariale mensuelle — Brut vs Net (Combo barres+courbe) │
│                                                                 │
├─────────────────────┬──────────────────┬────────────────────────┤
│                     │                  │                        │
│  Masse salariale    │  Répartition     │   Coût HS mensuel     │
│  par département    │  des déductions  │   (Barres)            │
│  (Barres empilées)  │  (Donut)         │                       │
├─────────────────────┼──────────────────┼────────────────────────┤
│                     │                  │                        │
│  Top 10 salaires    │  Primes par      │   Ratio déductions    │
│  (Tableau trié)     │  département     │   / brut (Jauge)      │
│                     │  (TreeMap)       │                        │
└─────────────────────┴──────────────────┴────────────────────────┘
```

---

## 3. Tables utilisées

| Table | Rôle dans cette page |
|-------|---------------------|
| `paie` | Données de paie mensuelles (brut, net, déductions, primes, HS) |
| `employe` | Nom, poste, département |
| `departement` | Filtrage et regroupement par département |
| `impotdeduction` | Détail des déductions : CNaPS, OSTIE, IRSA, mutuelle |
| `avantagesocial` | Avantages en nature et primes spéciales |

---

## 4. Mesures DAX à créer

Aller dans **Modélisation** → **Nouvelle mesure**. Créer un dossier `_Paie`.

---

### Mesure 1 : Masse salariale brute

```dax
Masse Salariale Brute = SUM(paie[salaire_brut])
```

---

### Mesure 2 : Masse salariale nette

```dax
Masse Salariale Nette = SUM(paie[salaire_net])
```

---

### Mesure 3 : Total des déductions

```dax
Total Deductions = SUM(paie[total_deductions])
```

---

### Mesure 4 : Salaire moyen net

```dax
Salaire Moyen Net = AVERAGE(paie[salaire_net])
```

---

### Mesure 5 : Salaire moyen brut

```dax
Salaire Moyen Brut = AVERAGE(paie[salaire_brut])
```

---

### Mesure 6 : Coût total des heures supplémentaires (via paie)

```dax
Cout HS Total = SUM(paie[heures_sup_montant])
```

> Montant des heures supplémentaires tel qu'il apparaît sur les fiches de paie.

---

### Mesure 7 : Total des primes

```dax
Total Primes = SUM(paie[primes])
```

---

### Mesure 8 : Part CNaPS dans les déductions

```dax
Part CNaPS = 
    CALCULATE(
        SUM(impotdeduction[montant]),
        impotdeduction[type_deduction] = "CNaPS"
    )
```

---

### Mesure 9 : Part OSTIE dans les déductions

```dax
Part OSTIE = 
    CALCULATE(
        SUM(impotdeduction[montant]),
        impotdeduction[type_deduction] = "OSTIE"
    )
```

---

### Mesure 10 : Part IRSA dans les déductions

```dax
Part IRSA = 
    CALCULATE(
        SUM(impotdeduction[montant]),
        impotdeduction[type_deduction] = "IRSA"
    )
```

---

### Mesure 11 : Ratio déductions / brut (%)

```dax
Ratio Deductions Brut = 
    DIVIDE(
        [Total Deductions],
        [Masse Salariale Brute],
        0
    ) * 100
```

> Indique quelle proportion du brut est absorbée par les déductions. Objectif : rester < 15 % pour les employés à faible revenu.

---

### Mesure 12 : Masse brute formatée (en millions Ar)

```dax
Masse Brute Millions = 
    FORMAT([Masse Salariale Brute] / 1000000, "0.00") & " M Ar"
```

> Utile pour les cartes KPI afin d'afficher des montants lisibles.

---

## 5. Visuels à créer — Instructions détaillées

### Visuels 1 à 4 : KPIs (4 Cartes en haut)

| N° | Mesure | Étiquette | Format |
|----|--------|-----------|--------|
| 1 | `Masse Salariale Brute` | Masse brute | `#,##0 Ar` |
| 2 | `Masse Salariale Nette` | Masse nette | `#,##0 Ar` |
| 3 | `Total Deductions` | Total déductions | `#,##0 Ar` |
| 4 | `Salaire Moyen Net` | Salaire moy. net | `#,##0 Ar` |

---

### Visuel 5 : Masse Salariale Mensuelle — Brut vs Net (Graphique combiné)

> Affiche côte à côte les montants bruts (barres) et nets (courbe) par mois.

1. Sélectionner **Graphique combiné (barres + courbe)**
2. Configuration :
    - **Axe X partagé** : `paie[Periode Complete]` *(colonne calculée créée dans le setup)*
    - **Valeurs colonne (axe Y gauche)** : `Masse Salariale Brute`
    - **Valeurs ligne (axe Y droit)** : `Masse Salariale Nette`
3. Format :
    - Colonnes : `#2E86C1` (bleu — brut)
    - Ligne : `#27AE60` (vert — net)
    - **Marqueurs de ligne** : Activé
    - **Étiquettes de données** : Activé sur les colonnes
    - Titre : `Masse salariale mensuelle (Brut vs Net)`

> 💡 **Tri chronologique :** Cliquer → **...** → **Trier par** → `paie[mois]` → **Ordre croissant**

---

### Visuel 6 : Masse Salariale par Département (Barres empilées)

1. **Graphique à barres empilées**
2. Configuration :
    - **Axe Y** : `departement[nom]`
    - **Axe X** : `Masse Salariale Brute`
    - *(Optionnel)* **Légende** : `paie[Libelle Mois]` pour une décomposition mensuelle
3. Couleurs : palette bleu en dégradé
4. **Étiquettes de données** : Activé, format `#,##0`
5. Titre : `Masse salariale par département`

---

### Visuel 7 : Répartition des Déductions (Donut)

> Montre la part de chaque type de déduction (CNaPS, OSTIE, IRSA, mutuelle, avances).

1. **Graphique en anneau**
2. Configuration :
    - **Légende** : `impotdeduction[type_deduction]`
    - **Valeurs** : `SUM(impotdeduction[montant])`
3. Couleurs :
    - CNaPS → `#1B4F72`
    - OSTIE → `#2E86C1`
    - IRSA → `#E74C3C`
    - Mutuelle → `#27AE60`
    - Avance → `#F39C12`
4. Titre : `Répartition des déductions`

---

### Visuel 8 : Coût Heures Supplémentaires par Mois (Barres)

1. **Graphique à colonnes groupées**
2. Configuration :
    - **Axe X** : `paie[Libelle Mois]`
    - **Valeurs** : `Cout HS Total`
3. Couleur des barres : `#F39C12` (orange)
4. **Étiquettes de données** : Activé, format `#,##0 Ar`
5. Titre : `Coût HS mensuel`

---

### Visuel 9 : Top 10 Salaires (Tableau trié)

> Identifie les 10 employés les mieux rémunérés sur la période sélectionnée.

1. **Tableau**
2. Colonnes :

| Champ | Format |
|-------|--------|
| `employe[Nom Complet]` | Texte |
| `departement[nom]` | Texte |
| `employe[poste]` | Texte |
| `paie[salaire_brut]` | `#,##0 Ar` |
| `paie[salaire_net]` | `#,##0 Ar` |
| `paie[total_deductions]` | `#,##0 Ar` |

3. **Filtre visuel Top N** : afficher les 10 premiers par `salaire_brut` décroissant
    - Volet **Filtres** → champ `salaire_brut` → Filtrage N premiers → N = 10
4. **Mise en forme conditionnelle** : barres de données sur `salaire_brut`
5. Titre : `Top 10 salaires bruts`

---

### Visuel 10 : Primes par Département (TreeMap)

> Visualise la taille relative des primes distribuées par département.

1. **Treemap**
2. Configuration :
    - **Groupe** : `departement[nom]`
    - **Valeurs** : `Total Primes`
3. Couleur : gradient bleu clair → bleu foncé
4. **Étiquettes de données** : Activé, afficher nom + montant
5. Titre : `Primes distribuées par département`

---

### Visuel 11 : Ratio Déductions / Brut (Jauge)

> Indicateur de santé financière — montre si les déductions restent dans une proportion acceptable.

1. **Jauge**
2. Configuration :
    - **Valeur** : `Ratio Deductions Brut`
    - **Valeur minimale** : 0
    - **Valeur maximale** : 30
    - **Valeur cible** : 15 (objectif — environ 2 % salarié + IRSA moyen)
3. Couleurs de zone :
    - < 15 % → vert
    - 15 à 20 % → orange
    - > 20 % → rouge
4. Titre : `Ratio déductions / brut (%)`

---

## 6. Filtres (Slicers)

| Slicer | Champ | Style |
|--------|-------|-------|
| Mois | `paie[Libelle Mois]` | Liste déroulante |
| Année | `paie[annee]` | Boutons |
| Département | `departement[nom]` | Liste déroulante |
| Employé | `employe[Nom Complet]` | Barre de recherche |

> 💡 **Conseil :** Utiliser le slicer **Employé** pour comparer l'évolution du salaire d'un employé particulier sur plusieurs mois grâce au graphique combiné.

---

## 7. Interactions entre visuels

| Visuel source (clic) | Action recommandée |
|----------------------|--------------------|
| TreeMap Primes par département | Filtrer le Tableau Top 10 et la Jauge |
| Graphique combiné Brut/Net | Filtrer le Tableau Top 10 |
| Donut déductions | Filtrer les KPIs de déductions |
| Slicers | Filtrer TOUS les visuels sans exception |

---

*Tutoriel RH-PowerBI — Page 3 Paie — Madagascar — 2025*