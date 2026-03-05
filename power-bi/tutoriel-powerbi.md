# 📊 Tutoriel Complet Power BI — Dashboard RH Madagascar

> Guide pas-à-pas pour créer un dashboard interactif de gestion des Ressources Humaines dans Power BI Desktop, connecté à la base PostgreSQL `rh_madagascar`.

---

## Table des matières

0. [Connexion et Configuration Initiale](#0-connexion-et-configuration-initiale)
1. [Page 1 — Gestion du Recrutement par Département](#page-1--gestion-du-recrutement-par-département)
2. [Page 2 — Gestion des Employés](#page-2--gestion-des-employés)
3. [Page 3 — Gestion de la Paie](#page-3--gestion-de-la-paie)
4. [Page 4 — Gestion des Présences](#page-4--gestion-des-présences)
5. [Page 5 — Gestion des Heures Supplémentaires](#page-5--gestion-des-heures-supplémentaires)
6. [Page 6 — Vue des Configurations](#page-6--vue-des-configurations)

---

# 0. Connexion et Configuration Initiale

## 0.1 Prérequis

- **Power BI Desktop** installé (version gratuite depuis [powerbi.microsoft.com](https://powerbi.microsoft.com))
- **PostgreSQL** en cours d'exécution avec la base `rh_madagascar` (scripts `script.sql` + `data.sql` exécutés)
- Connecteur **Npgsql** (inclus dans Power BI récent, sinon installer depuis [github.com/npgsql](https://github.com/npgsql/npgsql))

## 0.2 Connexion à PostgreSQL

1. Ouvrir **Power BI Desktop**
2. Cliquer sur **Accueil** → **Obtenir les données** → **Plus...**
3. Chercher **PostgreSQL** dans la liste → **Se connecter**
4. Renseigner :
   - **Serveur** : `localhost` (ou l'IP du serveur PostgreSQL)
   - **Base de données** : `rh_madagascar`
   - **Mode de connectivité** : `Importer`
5. Cliquer **OK**
6. Saisir les identifiants PostgreSQL (ex: `postgres` / votre mot de passe)
7. Dans le **Navigateur**, cocher **toutes les tables** :
   - ☑ `absence`
   - ☑ `annonce`
   - ☑ `avantagesocial`
   - ☑ `bulletinpaie`
   - ☑ `candidat`
   - ☑ `candidature`
   - ☑ `conge`
   - ☑ `departement`
   - ☑ `dossieremploye`
   - ☑ `employe`
   - ☑ `entretien`
   - ☑ `formation`
   - ☑ `heuressupplementaires`
   - ☑ `horaire`
   - ☑ `impotdeduction`
   - ☑ `paie`
   - ☑ `performance`
   - ☑ `presence`
8. Cliquer **Charger**

## 0.3 Vérification des Relations (Modèle de données)

1. Aller dans l'onglet **Modèle** (icône diagramme à gauche)
2. Vérifier que les relations suivantes sont bien détectées automatiquement :

| Table source | Champ | → | Table destination | Champ |
|---|---|---|---|---|
| `employe` | `id_departement` | → | `departement` | `id_departement` |
| `employe` | `id_candidat` | → | `candidat` | `id_candidat` |
| `annonce` | `id_departement` | → | `departement` | `id_departement` |
| `candidature` | `id_candidat` | → | `candidat` | `id_candidat` |
| `candidature` | `id_annonce` | → | `annonce` | `id_annonce` |
| `entretien` | `id_candidature` | → | `candidature` | `id_candidature` |
| `dossieremploye` | `id_employe` | → | `employe` | `id_employe` |
| `performance` | `id_employe` | → | `employe` | `id_employe` |
| `conge` | `id_employe` | → | `employe` | `id_employe` |
| `absence` | `id_employe` | → | `employe` | `id_employe` |
| `formation` | `id_employe` | → | `employe` | `id_employe` |
| `horaire` | `id_employe` | → | `employe` | `id_employe` |
| `presence` | `id_employe` | → | `employe` | `id_employe` |
| `heuressupplementaires` | `id_employe` | → | `employe` | `id_employe` |
| `paie` | `id_employe` | → | `employe` | `id_employe` |
| `avantagesocial` | `id_employe` | → | `employe` | `id_employe` |
| `impotdeduction` | `id_paie` | → | `paie` | `id_paie` |
| `bulletinpaie` | `id_paie` | → | `paie` | `id_paie` |

3. Si une relation manque : **glisser-déposer** le champ source vers le champ destination
4. Vérifier que toutes les relations sont en **Plusieurs-à-un (N:1)** sauf `dossieremploye` et `bulletinpaie` qui sont **Un-à-un (1:1)**

## 0.4 Colonnes calculées globales (à créer une seule fois)

Aller dans **Modélisation** → **Nouvelle colonne** pour chaque table :

### Table `employe` — Nom complet
```dax
Nom Complet = employe[nom] & " " & employe[prenom]
```

### Table `employe` — Ancienneté (années)
```dax
Anciennete = DATEDIFF(employe[date_embauche], TODAY(), YEAR)
```

### Table `employe` — Tranche d'âge
```dax
Tranche Age = 
    VAR Age = DATEDIFF(employe[date_naissance], TODAY(), YEAR)
    RETURN
    SWITCH(TRUE(),
        Age < 25, "< 25 ans",
        Age < 30, "25-29 ans",
        Age < 35, "30-34 ans",
        Age < 40, "35-39 ans",
        Age >= 40, "40+ ans"
    )
```

### Table `candidat` — Nom complet candidat
```dax
Nom Complet Candidat = candidat[nom] & " " & candidat[prenom]
```

### Table `paie` — Libellé mois
```dax
Libelle Mois = 
    SWITCH(paie[mois],
        1, "Janvier",
        2, "Février",
        3, "Mars",
        4, "Avril",
        5, "Mai",
        6, "Juin",
        7, "Juillet",
        8, "Août",
        9, "Septembre",
        10, "Octobre",
        11, "Novembre",
        12, "Décembre"
    )
```

### Table `paie` — Période complète
```dax
Periode Complete = paie[Libelle Mois] & " " & FORMAT(paie[annee], "0")
```

## 0.5 Thème de couleurs

Aller dans **Affichage** → **Thèmes** → **Personnaliser le thème actuel** :

| Élément | Couleur | Code Hex |
|---------|---------|----------|
| Couleur principale 1 | Bleu foncé | `#1B4F72` |
| Couleur principale 2 | Bleu moyen | `#2E86C1` |
| Couleur principale 3 | Bleu clair | `#85C1E9` |
| Couleur principale 4 | Vert | `#27AE60` |
| Couleur principale 5 | Rouge | `#E74C3C` |
| Couleur principale 6 | Orange | `#F39C12` |
| Arrière-plan de page | Gris clair | `#ECF0F1` |
| Texte | Noir | `#2C3E50` |

---

# Page 1 — Gestion du Recrutement par Département

## 📋 Objectif de la page

Suivre l'ensemble du processus de recrutement : publication d'offres, tri des candidatures, planification des entretiens et suivi des candidats.

## 📐 Disposition de la page

```
┌─────────────────────────────────────────────────────────────────┐
│  🎯 RECRUTEMENT PAR DÉPARTEMENT                                │
├─────────┬─────────┬─────────┬─────────┬────────────────────────┤
│  KPI 1  │  KPI 2  │  KPI 3  │  KPI 4  │   FILTRE Département  │
│ Offres  │Candida- │ Taux    │ Délai   │   FILTRE Statut       │
│ actives │tures   │accept. │ moyen   │   FILTRE Période      │
├─────────┴─────────┼─────────┴─────────┼────────────────────────┤
│                   │                   │                        │
│   Funnel de       │  Candidatures     │   Offres par type      │
│   recrutement     │  par département  │   de contrat           │
│   (Entonnoir)     │  (Barres empilées)│   (Camembert)          │
│                   │                   │                        │
├───────────────────┼───────────────────┼────────────────────────┤
│                   │                   │                        │
│  Notes moyennes   │   Calendrier      │   Top candidats        │
│  par poste        │   entretiens      │   (Tableau trié)       │
│  (Barres horiz.)  │   (Matrice)       │                        │
│                   │                   │                        │
└───────────────────┴───────────────────┴────────────────────────┘
```

---

## 🔢 Mesures DAX à créer

Aller dans **Modélisation** → **Nouvelle mesure** et créer chaque mesure :

### Mesure 1 : Total des candidatures
```dax
Total Candidatures = COUNTROWS(candidature)
```

### Mesure 2 : Candidatures acceptées
```dax
Candidatures Acceptees = 
    CALCULATE(
        COUNTROWS(candidature),
        candidature[statut] = "Acceptee"
    )
```

### Mesure 3 : Candidatures refusées
```dax
Candidatures Refusees = 
    CALCULATE(
        COUNTROWS(candidature),
        candidature[statut] = "Refusee"
    )
```

### Mesure 4 : Taux d'acceptation (%)
```dax
Taux Acceptation = 
    DIVIDE(
        CALCULATE(COUNTROWS(candidature), candidature[statut] = "Acceptee"),
        COUNTROWS(candidature),
        0
    ) * 100
```

### Mesure 5 : Nombre de postes ouverts
```dax
Postes Ouverts = 
    CALCULATE(
        SUM(annonce[nombre_postes]),
        annonce[statut] = "Ouverte"
    )
```

### Mesure 6 : Nombre d'offres actives
```dax
Offres Actives = 
    CALCULATE(
        COUNTROWS(annonce),
        annonce[statut] IN {"Ouverte", "En cours"}
    )
```

### Mesure 7 : Note moyenne des entretiens
```dax
Note Moyenne Entretien = AVERAGE(entretien[note])
```

### Mesure 8 : Délai moyen de recrutement (jours)
```dax
Delai Moyen Recrutement = 
    AVERAGEX(
        FILTER(annonce, annonce[statut] = "Fermee"),
        DATEDIFF(annonce[date_publication], annonce[date_cloture], DAY)
    )
```

### Mesure 9 : Entretiens favorables (%)
```dax
Taux Entretiens Favorables = 
    DIVIDE(
        CALCULATE(COUNTROWS(entretien), entretien[resultat] = "Favorable"),
        COUNTROWS(entretien),
        0
    ) * 100
```

---

## 📊 Visuels à créer — Instructions détaillées

### Visuel 1 : KPI — Offres actives

1. Cliquer sur une zone vide du canevas
2. Dans le volet **Visualisations**, sélectionner **Carte** (icône avec un chiffre)
3. Faire glisser la mesure `Offres Actives` dans le champ **Champs**
4. **Format** → **Étiquette de légende** → Texte : `Offres actives`
5. **Format** → **Étiquette de données** → Taille : `28pt`, Couleur : `#1B4F72`
6. Positionner en haut à gauche, taille : `200 x 100 px`

### Visuel 2 : KPI — Total candidatures

1. Même procédure que ci-dessus avec la mesure `Total Candidatures`
2. Étiquette : `Candidatures reçues`
3. Positionner à droite du KPI précédent

### Visuel 3 : KPI — Taux d'acceptation

1. Carte avec la mesure `Taux Acceptation`
2. **Format** → **Étiquette de données** → Format d'affichage : ajouter `%` manuellement dans le nom de la mesure ou utiliser FORMAT
3. Couleur conditionnelle : vert si > 30%, orange si 15-30%, rouge si < 15%

**Astuce couleur conditionnelle :**
```dax
Couleur Taux Acceptation = 
    IF([Taux Acceptation] >= 30, "#27AE60",
        IF([Taux Acceptation] >= 15, "#F39C12", "#E74C3C")
    )
```

### Visuel 4 : KPI — Délai moyen recrutement

1. Carte avec la mesure `Delai Moyen Recrutement`
2. Étiquette : `Délai moyen (jours)`

---

### Visuel 5 : Funnel de Recrutement (Entonnoir)

> Montre le pipeline : Reçue → Présélectionnée → Entretien → Acceptée/Refusée

1. Sélectionner le visuel **Entonnoir** dans le volet Visualisations
2. Configurer :
   - **Catégorie** : `candidature[statut]`
   - **Valeurs** : `Total Candidatures` (ou `Count of id_candidature`)
3. **Format** :
   - Couleurs de données : Reçue → `#85C1E9`, Preselectionnee → `#2E86C1`, Entretien → `#1B4F72`, Acceptee → `#27AE60`, Refusee → `#E74C3C`
   - Étiquettes de données : **Activé**, afficher valeur + pourcentage
4. Taille : `350 x 300 px`, positionner en bas à gauche

**Résultat attendu :**
```
    ┌────────────── Recue (8) ──────────────┐
    │                                        │
    └──┌──── Preselectionnee (4) ────┐──────┘
       │                              │
       └──┌── Entretien (2) ──┐──────┘
          │                    │
          └── Acceptee (13) ──┘
              Refusee (8)
```

---

### Visuel 6 : Candidatures par Département (Barres empilées)

> Montre la répartition des candidatures par département et par statut

1. Sélectionner **Graphique à barres empilées**
2. Configurer :
   - **Axe Y** : `departement[nom]`
   - **Axe X** : `Count of id_candidature`
   - **Légende** : `candidature[statut]`
3. **Format** :
   - Couleurs par statut (voir palette ci-dessus)
   - Étiquettes de données : **Activé**
   - Titre : `Candidatures par département`
4. Taille : `350 x 300 px`

---

### Visuel 7 : Offres par Type de Contrat (Camembert/Donut)

1. Sélectionner **Graphique en anneau (Donut)**
2. Configurer :
   - **Légende** : `annonce[type_contrat]`
   - **Valeurs** : `Count of id_annonce`
3. **Format** :
   - Couleurs : CDI → `#1B4F72`, CDD → `#2E86C1`, Stage → `#85C1E9`, Freelance → `#F39C12`
   - Position de la légende : **En bas**
   - Titre : `Offres par type de contrat`
4. Taille : `300 x 250 px`

---

### Visuel 8 : Notes Moyennes par Poste (Barres horizontales)

1. Sélectionner **Graphique à barres groupées**
2. Configurer :
   - **Axe Y** : `annonce[poste]`
   - **Axe X** : `Note Moyenne Entretien`
3. **Format** :
   - Couleur des barres : `#2E86C1`
   - Étiquettes de données : **Activé**, format `0.00`
   - Titre : `Note moyenne entretien par poste`
   - Axe X : Min = 0, Max = 20

---

### Visuel 9 : Tableau des Entretiens (Matrice)

1. Sélectionner le visuel **Tableau**
2. Configurer les colonnes :
   - `candidat[Nom Complet Candidat]`
   - `annonce[poste]`
   - `entretien[date_entretien]`
   - `entretien[type_entretien]`
   - `entretien[note]`
   - `entretien[resultat]`
3. **Format** :
   - Tri par `entretien[date_entretien]` décroissant
   - Mise en forme conditionnelle sur `note` : gradient vert (>15) → orange (10-15) → rouge (<10)
   - Mise en forme conditionnelle sur `resultat` : Favorable → vert, Defavorable → rouge
   - Titre : `Détails des entretiens`

**Pour la mise en forme conditionnelle :**
1. Cliquer sur la colonne `note` dans Valeurs → **...** → **Mise en forme conditionnelle** → **Couleur d'arrière-plan**
2. Règles : Si valeur ≥ 15 → vert `#27AE60`, si ≥ 10 → orange `#F39C12`, sinon → rouge `#E74C3C`

---

### Visuel 10 : Top 5 Candidats (Tableau trié)

1. Sélectionner **Tableau**
2. Colonnes :
   - `candidat[Nom Complet Candidat]`
   - `candidat[niveau_etude]`
   - `candidat[experience_annees]`
   - `candidature[note_evaluation]`
   - `candidature[statut]`
3. Filtre visuel : **Top N** = 5 par `note_evaluation` décroissant
4. Titre : `Top 5 candidats`

---

### Filtres (Slicers) — En haut à droite de la page

#### Slicer 1 : Département
1. Sélectionner **Segment (Slicer)**
2. Champ : `departement[nom]`
3. Style : **Liste déroulante**

#### Slicer 2 : Statut annonce
1. Segment avec `annonce[statut]`
2. Style : **Boutons**

#### Slicer 3 : Période (date publication)
1. Segment avec `annonce[date_publication]`
2. Style : **Plage de dates** (entre deux dates)

---

# Page 2 — Gestion des Employés

## 📋 Objectif de la page

Vue complète des effectifs, performances, congés, absences et formations.

## 📐 Disposition de la page

```
┌─────────────────────────────────────────────────────────────────┐
│  👥 GESTION DES EMPLOYÉS                                        │
├─────────┬─────────┬─────────┬─────────┬────────────────────────┤
│  KPI 1  │  KPI 2  │  KPI 3  │  KPI 4  │  FILTRE Département   │
│ Effectif│ Ancien- │ Perfor- │Turnover │  FILTRE Sexe           │
│  actif  │ neté    │ mance   │   (%)   │  FILTRE Contrat        │
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

## 🔢 Mesures DAX

### Mesure 1 : Effectif actif
```dax
Effectif Actif = 
    CALCULATE(COUNTROWS(employe), employe[statut] = "Actif")
```

### Mesure 2 : Effectif total
```dax
Effectif Total = COUNTROWS(employe)
```

### Mesure 3 : Ancienneté moyenne (années)
```dax
Anciennete Moyenne = 
    AVERAGEX(
        FILTER(employe, employe[statut] = "Actif"),
        DATEDIFF(employe[date_embauche], TODAY(), YEAR)
    )
```

### Mesure 4 : Performance moyenne
```dax
Performance Moyenne = AVERAGE(performance[note_globale])
```

### Mesure 5 : Objectifs moyens atteints (%)
```dax
Objectifs Moyens = AVERAGE(performance[objectifs_atteints])
```

### Mesure 6 : Turnover (%)
```dax
Turnover = 
    DIVIDE(
        CALCULATE(COUNTROWS(employe), employe[statut] <> "Actif"),
        COUNTROWS(employe),
        0
    ) * 100
```

### Mesure 7 : Taux de promotion (%)
```dax
Taux Promotion = 
    DIVIDE(
        CALCULATE(COUNTROWS(performance), performance[recommandation] = "Promotion"),
        COUNTROWS(performance),
        0
    ) * 100
```

### Mesure 8 : Nombre total de jours de congé pris
```dax
Total Jours Conge = 
    CALCULATE(
        SUM(conge[nombre_jours]),
        conge[statut] = "Approuve"
    )
```

### Mesure 9 : Nombre de formations terminées
```dax
Formations Terminees = 
    CALCULATE(COUNTROWS(formation), formation[statut] = "Terminee")
```

### Mesure 10 : Coût total des formations
```dax
Cout Total Formations = SUM(formation[cout])
```

### Mesure 11 : Ratio Hommes/Femmes
```dax
Ratio HF = 
    VAR Hommes = CALCULATE(COUNTROWS(employe), employe[sexe] = "Masculin")
    VAR Femmes = CALCULATE(COUNTROWS(employe), employe[sexe] = "Feminin")
    RETURN Hommes & "H / " & Femmes & "F"
```

---

## 📊 Visuels à créer

### Visuel 1 : KPI — Effectif actif (Carte)
- Mesure : `Effectif Actif`
- Étiquette : `Effectif actif`
- Taille texte : `32pt`

### Visuel 2 : KPI — Ancienneté moyenne (Carte)
- Mesure : `Anciennete Moyenne`
- Étiquette : `Ancienneté moy. (ans)`
- Format : `0.0`

### Visuel 3 : KPI — Performance moyenne (Carte)
- Mesure : `Performance Moyenne`
- Étiquette : `Note performance`
- Format : `0.00 / 20`

### Visuel 4 : KPI — Turnover (Carte)
- Mesure : `Turnover`
- Étiquette : `Turnover %`
- Couleur conditionnelle : vert < 10%, orange 10-20%, rouge > 20%

---

### Visuel 5 : Effectif par Département (Barres horizontales)

1. **Graphique à barres groupées**
2. Configuration :
   - **Axe Y** : `departement[nom]`
   - **Axe X** : `Effectif Actif` ou `Count of id_employe`
3. Format :
   - Couleur : `#2E86C1`
   - Étiquettes de données : **Activé**
   - Titre : `Effectif par département`
4. **Interactivité** : cliquer sur une barre filtre tous les autres visuels

---

### Visuel 6 : Répartition Hommes/Femmes (Donut)

1. **Graphique en anneau**
2. Configuration :
   - **Légende** : `employe[sexe]`
   - **Valeurs** : `Count of id_employe`
3. Format :
   - Masculin → `#2E86C1`, Feminin → `#E74C3C`
   - Étiquettes : Valeur + Pourcentage
   - Titre : `Répartition H/F`

---

### Visuel 7 : Types de Contrat (Camembert)

1. **Graphique en secteurs**
2. Configuration :
   - **Légende** : `employe[type_contrat]`
   - **Valeurs** : `Count of id_employe`
3. Couleurs : CDI → `#1B4F72`, CDD → `#F39C12`, Stage → `#85C1E9`
4. Titre : `Types de contrat`

---

### Visuel 8 : Évolution des Performances (Courbes)

> Montre l'évolution de la note moyenne par trimestre

1. **Graphique en courbes**
2. Configuration :
   - **Axe X** : `performance[periode]`
   - **Valeurs** : `Performance Moyenne`
3. Pour voir par employé, ajouter **Légende** : `employe[Nom Complet]`
4. Format :
   - Marqueurs : **Activé**
   - Étiquettes de données : **Activé**
   - Axe Y : Min = 0, Max = 20
   - Titre : `Évolution des performances par trimestre`

**Astuce :** Trier l'axe X par ordre chronologique :
- Cliquer sur le visuel → **...** → **Trier par** → `date_evaluation` → **Ordre croissant**

---

### Visuel 9 : Congés par Type (Donut)

1. **Graphique en anneau**
2. Configuration :
   - **Légende** : `conge[type_conge]`
   - **Valeurs** : `SUM(conge[nombre_jours])` (filtré sur statut = "Approuve")
3. Couleurs : Annuel → `#2E86C1`, Maladie → `#E74C3C`, Maternite → `#9B59B6`, Paternite → `#3498DB`, Sans solde → `#95A5A6`, Formation → `#F39C12`, Exceptionnel → `#1ABC9C`
4. Titre : `Congés approuvés par type`

---

### Visuel 10 : Formations par Statut (Barres empilées)

1. **Graphique à colonnes empilées**
2. Configuration :
   - **Axe X** : `departement[nom]` (via relation employe)
   - **Valeurs** : `Count of id_formation`
   - **Légende** : `formation[statut]`
3. Couleurs : Terminee → `#27AE60`, En cours → `#F39C12`, Planifiee → `#2E86C1`, Annulee → `#E74C3C`
4. Titre : `Formations par département et statut`

---

### Visuel 11 : Tableau détaillé des Employés

1. **Tableau**
2. Colonnes :
   - `employe[matricule]`
   - `employe[Nom Complet]`
   - `departement[nom]`
   - `employe[poste]`
   - `employe[type_contrat]`
   - `employe[date_embauche]`
   - `employe[salaire_base]` (format monétaire Ariary)
   - `employe[statut]`
3. Mise en forme conditionnelle :
   - `statut` : Actif → fond vert, Inactif → fond gris, Suspendu → fond orange
4. **Tri** par `matricule` croissant
5. Titre : `Liste des employés`

---

### Filtres (Slicers)

| Slicer | Champ | Style |
|--------|-------|-------|
| Département | `departement[nom]` | Liste déroulante |
| Sexe | `employe[sexe]` | Boutons |
| Type contrat | `employe[type_contrat]` | Boutons |
| Période évaluation | `performance[periode]` | Liste déroulante |

---

# Page 3 — Gestion de la Paie

## 📋 Objectif de la page

Suivi de la masse salariale, des salaires nets/bruts, des déductions (CNaPS, OSTIE, IRSA), et des bulletins de paie.

## 📐 Disposition de la page

```
┌─────────────────────────────────────────────────────────────────┐
│  💰 GESTION DE LA PAIE                                          │
├─────────┬─────────┬─────────┬─────────┬────────────────────────┤
│  KPI 1  │  KPI 2  │  KPI 3  │  KPI 4  │  FILTRE Mois/Année    │
│ Masse   │ Masse   │ Total   │ Salaire │  FILTRE Département   │
│ brute   │ nette   │ déduc.  │ moy net │  FILTRE Employé       │
├─────────┴─────────┴─────────┴─────────┴────────────────────────┤
│                                                                 │
│  Masse salariale mensuelle — Brut vs Net (Combo courbe+barres) │
│                                                                 │
├─────────────────────┬─────────────────┬────────────────────────┤
│                     │                 │                        │
│  Masse salariale    │  Répartition    │   Coût HS mensuel     │
│  par département    │  des déductions │   (Barres)            │
│  (Barres empilées)  │  (Donut)        │                       │
├─────────────────────┼─────────────────┼────────────────────────┤
│                     │                 │                        │
│  Top 10 salaires    │  Primes par     │   Ratio déductions    │
│  (Tableau trié)     │  département    │   / brut (Jauge)      │
│                     │  (TreeMap)      │                        │
└─────────────────────┴─────────────────┴────────────────────────┘
```

---

## 🔢 Mesures DAX

### Mesure 1 : Masse salariale brute
```dax
Masse Salariale Brute = SUM(paie[salaire_brut])
```

### Mesure 2 : Masse salariale nette
```dax
Masse Salariale Nette = SUM(paie[salaire_net])
```

### Mesure 3 : Total des déductions
```dax
Total Deductions = SUM(paie[total_deductions])
```

### Mesure 4 : Salaire moyen net
```dax
Salaire Moyen Net = AVERAGE(paie[salaire_net])
```

### Mesure 5 : Salaire moyen brut
```dax
Salaire Moyen Brut = AVERAGE(paie[salaire_brut])
```

### Mesure 6 : Coût total heures supplémentaires
```dax
Cout HS Total = SUM(paie[heures_sup_montant])
```

### Mesure 7 : Total primes
```dax
Total Primes = SUM(paie[primes])
```

### Mesure 8 : Part CNaPS (dans les déductions)
```dax
Part CNaPS = 
    CALCULATE(
        SUM(impotdeduction[montant]),
        impotdeduction[type_deduction] = "CNaPS"
    )
```

### Mesure 9 : Part OSTIE
```dax
Part OSTIE = 
    CALCULATE(
        SUM(impotdeduction[montant]),
        impotdeduction[type_deduction] = "OSTIE"
    )
```

### Mesure 10 : Part IRSA
```dax
Part IRSA = 
    CALCULATE(
        SUM(impotdeduction[montant]),
        impotdeduction[type_deduction] = "IRSA"
    )
```

### Mesure 11 : Ratio déductions / brut (%)
```dax
Ratio Deductions Brut = 
    DIVIDE(
        [Total Deductions],
        [Masse Salariale Brute],
        0
    ) * 100
```

### Mesure 12 : Masse salariale formatée (en millions Ar)
```dax
Masse Brute Millions = 
    FORMAT([Masse Salariale Brute] / 1000000, "0.00") & " M Ar"
```

---

## 📊 Visuels à créer

### Visuel 1–4 : KPIs (4 Cartes en haut)

| KPI | Mesure | Étiquette | Format |
|-----|--------|-----------|--------|
| 1 | `Masse Salariale Brute` | Masse brute | `#,##0 Ar` |
| 2 | `Masse Salariale Nette` | Masse nette | `#,##0 Ar` |
| 3 | `Total Deductions` | Déductions | `#,##0 Ar` |
| 4 | `Salaire Moyen Net` | Salaire moy. net | `#,##0 Ar` |

---

### Visuel 5 : Masse Salariale Mensuelle — Brut vs Net (Combo chart)

1. Sélectionner **Graphique combiné (barres + courbe)**
2. Configuration :
   - **Axe X partagé** : `paie[Periode Complete]` ou `paie[mois]`
   - **Valeurs colonne** : `Masse Salariale Brute`
   - **Valeurs ligne** : `Masse Salariale Nette`
3. Format :
   - Colonnes : `#2E86C1` (brut)
   - Ligne : `#27AE60` (net)
   - Marqueurs de ligne : **Activé**
   - Étiquettes de données : **Activé** sur les colonnes
   - Titre : `Masse salariale mensuelle (Brut vs Net)`

**Pour trier chronologiquement :** Trier par `paie[mois]` croissant

---

### Visuel 6 : Masse Salariale par Département (Barres empilées)

1. **Graphique à barres empilées**
2. Configuration :
   - **Axe Y** : `departement[nom]`
   - **Axe X** : `Masse Salariale Brute`
   - (Optionnel) **Légende** : `paie[Libelle Mois]` pour voir la décomposition mensuelle
3. Couleurs : palette bleu gradient
4. Étiquettes de données : **Activé**
5. Titre : `Masse salariale par département`

---

### Visuel 7 : Répartition des Déductions (Donut)

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
3. Couleur : `#F39C12`
4. Titre : `Coût HS mensuel`

---

### Visuel 9 : Top 10 Salaires (Tableau trié)

1. **Tableau**
2. Colonnes :
   - `employe[Nom Complet]`
   - `departement[nom]`
   - `employe[poste]`
   - `paie[salaire_brut]`
   - `paie[salaire_net]`
   - `paie[total_deductions]`
3. Filtre visuel **Top N** = 10 par `salaire_brut` décroissant
4. Mise en forme conditionnelle : barres de données sur `salaire_brut`
5. Titre : `Top 10 salaires bruts`

---

### Visuel 10 : Primes par Département (TreeMap)

1. **Treemap**
2. Configuration :
   - **Groupe** : `departement[nom]`
   - **Valeurs** : `Total Primes`
3. Couleur : gradient bleu
4. Titre : `Primes distribuées par département`

---

### Visuel 11 : Ratio Déductions/Brut (Jauge)

1. **Jauge**
2. Configuration :
   - **Valeur** : `Ratio Deductions Brut`
   - **Valeur minimale** : 0
   - **Valeur maximale** : 30
   - **Valeur cible** : 15 (objectif)
3. Couleurs : vert < 15%, orange 15-20%, rouge > 20%
4. Titre : `Ratio déductions / brut (%)`

---

### Filtres (Slicers)

| Slicer | Champ | Style |
|--------|-------|-------|
| Mois | `paie[Libelle Mois]` | Liste déroulante |
| Année | `paie[annee]` | Boutons |
| Département | `departement[nom]` | Liste déroulante |
| Employé | `employe[Nom Complet]` | Recherche |

---

# Page 4 — Gestion des Présences

## 📋 Objectif de la page

Suivi quotidien des heures de travail, détection des retards et absences, rapports de présence.

## 📐 Disposition de la page

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
│  TABLEAU : Détail présences du jour/semaine sélectionnée       │
└────────────────────────────────────────────────────────────────┘
```

---

## 🔢 Mesures DAX

### Mesure 1 : Taux de présence global (%)
```dax
Taux Presence = 
    DIVIDE(
        CALCULATE(COUNTROWS(presence), presence[statut] = "Present"),
        COUNTROWS(presence),
        0
    ) * 100
```

### Mesure 2 : Nombre de retards
```dax
Nb Retards = 
    CALCULATE(COUNTROWS(presence), presence[statut] = "Retard")
```

### Mesure 3 : Total heures travaillées
```dax
Total Heures Travaillees = SUM(presence[heures_travaillees])
```

### Mesure 4 : Heures moyennes par jour
```dax
Heures Moyennes Jour = AVERAGE(presence[heures_travaillees])
```

### Mesure 5 : Taux d'absentéisme (%)
```dax
Taux Absenteisme = 
    DIVIDE(
        CALCULATE(COUNTROWS(presence), presence[statut] = "Absent"),
        COUNTROWS(presence),
        0
    ) * 100
```

### Mesure 6 : Jours de congé (dans les présences)
```dax
Jours Conge Presence = 
    CALCULATE(COUNTROWS(presence), presence[statut] = "Conge")
```

### Mesure 7 : Nombre absences injustifiées
```dax
Absences Injustifiees = 
    CALCULATE(COUNTROWS(absence), absence[type_absence] = "Injustifiee")
```

### Mesure 8 : Nombre absences justifiées
```dax
Absences Justifiees = 
    CALCULATE(COUNTROWS(absence), absence[type_absence] = "Justifiee")
```

### Mesure 9 : Total heures d'absence
```dax
Total Heures Absence = SUM(absence[duree_heures])
```

### Mesure 10 : Présents aujourd'hui
```dax
Presents Aujourdhui = 
    CALCULATE(
        COUNTROWS(presence),
        presence[statut] = "Present",
        presence[date_presence] = TODAY()
    )
```

---

## 📊 Visuels à créer

### Visuel 1–4 : KPIs

| KPI | Mesure | Étiquette | Couleur conditionnelle |
|-----|--------|-----------|----------------------|
| 1 | `Taux Presence` | Taux présence (%) | ≥90% vert, 80-90% orange, <80% rouge |
| 2 | `Nb Retards` | Retards | <5 vert, 5-15 orange, >15 rouge |
| 3 | `Total Heures Travaillees` | Heures totales | Bleu |
| 4 | `Taux Absenteisme` | Absentéisme (%) | <5% vert, 5-10% orange, >10% rouge |

---

### Visuel 5 : Taux de Présence par Département (Barres groupées)

1. **Graphique à barres groupées**
2. Configuration :
   - **Axe Y** : `departement[nom]`
   - **Axe X** : `Taux Presence`
3. Format :
   - Couleur : `#27AE60`
   - Étiquettes : Activé, format `0.0%`
   - Axe X : Min = 0, Max = 100
   - Ligne de référence à 90% (objectif) → **Analytics** → **Ligne constante** = 90
4. Titre : `Taux de présence par département`

---

### Visuel 6 : Présence par Statut (Donut)

1. **Graphique en anneau**
2. Configuration :
   - **Légende** : `presence[statut]`
   - **Valeurs** : `Count of id_presence`
3. Couleurs :
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

### Visuel 8 : Heatmap de Présence (Matrice)

> Matrice croisant les employés et les dates, colorée selon le statut

1. **Matrice**
2. Configuration :
   - **Lignes** : `employe[Nom Complet]`
   - **Colonnes** : `presence[date_presence]`
   - **Valeurs** : `presence[statut]`
3. **Mise en forme conditionnelle** → Couleur d'arrière-plan :
   - Basée sur des règles :
     - "Present" → `#27AE60` (vert)
     - "Absent" → `#E74C3C` (rouge)
     - "Retard" → `#F39C12` (orange)
     - "Conge" → `#2E86C1` (bleu)
4. Titre : `Calendrier de présence`

**Alternative si la matrice est trop dense :** Utiliser une **matrice** avec :
- Lignes : `employe[Nom Complet]`
- Colonnes : Jour de la semaine (`WEEKDAY`)
- Valeurs : Nombre de présences par statut

---

### Visuel 9 : Retards par Employé (Barres horizontales)

1. **Graphique à barres groupées**
2. Configuration :
   - **Axe Y** : `employe[Nom Complet]`
   - **Axe X** : `Nb Retards`
3. Tri : décroissant par nombre de retards
4. Couleur : `#F39C12`
5. Titre : `Nombre de retards par employé`
6. Filtre visuel : **Top N** = 10

---

### Visuel 10 : Tendance des Absences par Mois (Courbe)

1. **Graphique en courbes**
2. Configuration :
   - **Axe X** : `absence[date_absence]` (granularité **Mois**)
   - **Valeurs** : `Count of id_absence`
3. Format :
   - Marqueurs : **Activé**
   - Couleur : `#E74C3C`
   - Titre : `Tendance mensuelle des absences`

---

### Visuel 11 : Tableau détaillé des Présences

1. **Tableau**
2. Colonnes :
   - `employe[Nom Complet]`
   - `presence[date_presence]`
   - `presence[heure_arrivee]`
   - `presence[heure_depart]`
   - `presence[heures_travaillees]`
   - `presence[statut]`
   - `presence[commentaire]`
3. Mise en forme conditionnelle sur `statut`
4. Titre : `Détail des présences`

---

### Filtres (Slicers)

| Slicer | Champ | Style |
|--------|-------|-------|
| Mois | `presence[date_presence]` | Plage de dates |
| Département | `departement[nom]` | Liste déroulante |
| Employé | `employe[Nom Complet]` | Recherche |
| Statut | `presence[statut]` | Boutons |

---

# Page 5 — Gestion des Heures Supplémentaires

## 📋 Objectif de la page

Suivi, calcul et gestion des demandes d'heures supplémentaires, avec rapports détaillés.

## 📐 Disposition de la page

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

## 🔢 Mesures DAX

### Mesure 1 : Total heures supplémentaires
```dax
Total HS Heures = SUM(heuressupplementaires[nombre_heures])
```

### Mesure 2 : Coût total HS
```dax
Cout Total HS = SUM(heuressupplementaires[montant_calcule])
```

### Mesure 3 : HS en attente (nombre de demandes)
```dax
HS En Attente = 
    CALCULATE(
        COUNTROWS(heuressupplementaires),
        heuressupplementaires[statut] = "En attente"
    )
```

### Mesure 4 : Moyenne HS par employé
```dax
Moyenne HS Par Employe = 
    AVERAGEX(
        VALUES(heuressupplementaires[id_employe]),
        CALCULATE(SUM(heuressupplementaires[nombre_heures]))
    )
```

### Mesure 5 : HS approuvées non payées (montant)
```dax
HS A Payer = 
    CALCULATE(
        SUM(heuressupplementaires[montant_calcule]),
        heuressupplementaires[statut] = "Approuvee"
    )
```

### Mesure 6 : HS payées (montant)
```dax
HS Payees = 
    CALCULATE(
        SUM(heuressupplementaires[montant_calcule]),
        heuressupplementaires[statut] = "Payee"
    )
```

### Mesure 7 : Ratio HS / Masse salariale (%)
```dax
Ratio HS Masse = 
    DIVIDE(
        [Cout Total HS],
        [Masse Salariale Brute],
        0
    ) * 100
```

### Mesure 8 : Nombre total de demandes HS
```dax
Nb Demandes HS = COUNTROWS(heuressupplementaires)
```

### Mesure 9 : HS au taux 150%
```dax
HS Taux 150 = 
    CALCULATE(
        SUM(heuressupplementaires[nombre_heures]),
        heuressupplementaires[taux_majoration] = 1.50
    )
```

### Mesure 10 : HS au taux 200%
```dax
HS Taux 200 = 
    CALCULATE(
        SUM(heuressupplementaires[nombre_heures]),
        heuressupplementaires[taux_majoration] = 2.00
    )
```

---

## 📊 Visuels à créer

### Visuel 1–4 : KPIs

| KPI | Mesure | Étiquette |
|-----|--------|-----------|
| 1 | `Total HS Heures` | Total heures sup. |
| 2 | `Cout Total HS` | Coût total HS (Ar) |
| 3 | `HS En Attente` | Demandes en attente |
| 4 | `Moyenne HS Par Employe` | Moy. HS / employé |

---

### Visuel 5 : HS par Mois — Heures + Montant (Combo chart)

1. **Graphique combiné**
2. Configuration :
   - **Axe X** : `heuressupplementaires[date_hs]` (granularité **Mois**)
   - **Valeurs colonne** : `Total HS Heures`
   - **Valeurs ligne** : `Cout Total HS`
3. Format :
   - Colonnes : `#2E86C1`
   - Ligne : `#E74C3C`
   - 2ème axe Y pour le montant
   - Marqueurs : **Activé**
   - Titre : `Heures sup. et coût par mois`

---

### Visuel 6 : HS par Département (Barres)

1. **Graphique à barres groupées**
2. Configuration :
   - **Axe Y** : `departement[nom]`
   - **Axe X** : `Total HS Heures`
3. Couleur : `#1B4F72`
4. Étiquettes : **Activé**
5. Titre : `Heures sup. par département`

---

### Visuel 7 : Répartition par Taux de Majoration (Donut)

1. **Graphique en anneau**
2. Configuration :
   - **Légende** : `heuressupplementaires[taux_majoration]`
   - **Valeurs** : `Total HS Heures`
3. Créer une colonne calculée pour libellé :
```dax
Libelle Taux = 
    IF(heuressupplementaires[taux_majoration] = 1.50, "130-150% (jour)", "200% (nuit/dimanche)")
```
4. Couleurs : 150% → `#2E86C1`, 200% → `#E74C3C`
5. Titre : `Répartition par taux de majoration`

---

### Visuel 8 : Statut des Demandes HS (Barres empilées)

1. **Graphique à colonnes empilées**
2. Configuration :
   - **Axe X** : `heuressupplementaires[date_hs]` (granularité **Mois**)
   - **Valeurs** : `Nb Demandes HS` (ou Count)
   - **Légende** : `heuressupplementaires[statut]`
3. Couleurs :
   - En attente → `#F39C12`
   - Approuvee → `#2E86C1`
   - Payee → `#27AE60`
   - Refusee → `#E74C3C`
4. Titre : `Statut des demandes HS par mois`

---

### Visuel 9 : Top Employés HS (Tableau trié)

1. **Tableau**
2. Colonnes :
   - `employe[Nom Complet]`
   - `departement[nom]`
   - `Total HS Heures`
   - `Cout Total HS`
   - (dernier motif : `heuressupplementaires[motif]`)
3. Tri : `Total HS Heures` décroissant
4. Filtre visuel : **Top N** = 10
5. Mise en forme conditionnelle : barres de données sur `Total HS Heures`
6. Titre : `Top 10 employés en heures supplémentaires`

---

### Visuel 10 : Ratio HS / Masse Salariale (Jauge)

1. **Jauge**
2. Configuration :
   - **Valeur** : `Ratio HS Masse`
   - **Min** : 0
   - **Max** : 10
   - **Cible** : 5 (objectif à ne pas dépasser)
3. Couleurs : < 3% vert, 3-5% orange, > 5% rouge
4. Titre : `Ratio HS / Masse salariale (%)`

---

### Filtres (Slicers)

| Slicer | Champ | Style |
|--------|-------|-------|
| Période | `heuressupplementaires[date_hs]` | Plage de dates |
| Département | `departement[nom]` | Liste déroulante |
| Statut HS | `heuressupplementaires[statut]` | Boutons |
| Taux majoration | `heuressupplementaires[taux_majoration]` | Boutons |

---

# Page 6 — Vue des Configurations

## 📋 Objectif de la page

Afficher les paramètres de configuration du système RH malgache : cotisations, barème IRSA, SMIG, majorations. C'est une page de référence.

## 📐 Disposition de la page

```
┌─────────────────────────────────────────────────────────────────┐
│  ⚙️ CONFIGURATIONS RH MADAGASCAR                                │
├─────────────────────────────┬───────────────────────────────────┤
│                             │                                   │
│  Tableau Cotisations        │   Barème IRSA                     │
│  Sociales                   │   (Barres horizontales)           │
│  (CNaPS + OSTIE)            │                                   │
│                             │                                   │
├─────────────────────────────┼───────────────────────────────────┤
│                             │                                   │
│  Répartition réelle des     │   Comparaison SMIG vs            │
│  déductions (tous employés) │   Salaires réels (Jauge)         │
│  (Camembert)                │                                   │
│                             │                                   │
├─────────────────────────────┼───────────────────────────────────┤
│                             │                                   │
│  Simulation IRSA            │   Majorations HS                  │
│  (Tableau interactif)       │   (Tableau de référence)          │
│                             │                                   │
└─────────────────────────────┴───────────────────────────────────┘
```

---

## 🔢 Tables manuelles de configuration

Pour cette page, on crée des **tables manuelles** dans Power BI (pas depuis PostgreSQL) :

### Table 1 : Cotisations sociales

1. **Accueil** → **Entrer des données**
2. Créer la table `ConfigCotisations` :

| Cotisation | Part Employe (%) | Part Employeur (%) | Total (%) |
|-----------|-----------------|-------------------|----------|
| CNaPS | 1.0 | 13.0 | 14.0 |
| OSTIE | 1.0 | 5.0 | 6.0 |
| Total | 2.0 | 18.0 | 20.0 |

### Table 2 : Barème IRSA

1. **Accueil** → **Entrer des données**
2. Créer la table `ConfigIRSA` :

| Tranche | De (Ar) | A (Ar) | Taux (%) |
|---------|---------|--------|----------|
| Tranche 1 | 0 | 350000 | 0 |
| Tranche 2 | 350001 | 400000 | 5 |
| Tranche 3 | 400001 | 500000 | 10 |
| Tranche 4 | 500001 | 600000 | 15 |
| Tranche 5 | 600001 | 4000000 | 20 |
| Tranche 6 | 4000001 | 999999999 | 25 |

### Table 3 : Majorations HS

1. **Accueil** → **Entrer des données**
2. Créer la table `ConfigMajorationHS` :

| Periode | Taux Majoration (%) | Description |
|---------|-------------------|-------------|
| Jour ouvrable (≤8h HS) | 130 | 8 premières heures supplémentaires |
| Jour ouvrable (>8h HS) | 150 | Au-delà de 8 heures supplémentaires |
| Nuit (21h-5h) | 150 | Travail de nuit |
| Dimanche / Jour férié | 200 | Dimanche et jours fériés |
| Nuit dimanche / férié | 200 | Nuit + dimanche ou jour férié |

### Table 4 : Paramètres généraux

1. **Accueil** → **Entrer des données**
2. Créer la table `ConfigGeneral` :

| Parametre | Valeur | Unite | Description |
|-----------|--------|-------|-------------|
| SMIG | 350000 | Ar/mois | Salaire minimum |
| Heures mensuelles | 173.33 | heures | Durée légale mensuelle |
| Congés annuels | 30 | jours | Droit congé annuel |
| Congé mensuel acquis | 2.5 | jours | Acquisition mensuelle |
| Max absences/mois | 3 | jours | Seuil d'alerte |
| Max retards/mois | 2 | jours | Seuil d'alerte |
| HS max/semaine | 20 | heures | Plafond hebdomadaire |
| HS max/mois | 80 | heures | Plafond mensuel |
| Heure retard | 08:00 | heure | Seuil de retard |
| Heure absence | 09:00 | heure | Seuil d'absence |
| Validité congés | 3 | ans | Report maximum |

---

## 🔢 Mesures DAX spécifiques

### Mesure 1 : SMIG
```dax
SMIG = 350000
```

### Mesure 2 : Employés au SMIG (salaire ≤ SMIG)
```dax
Employes Au SMIG = 
    CALCULATE(
        COUNTROWS(employe),
        employe[salaire_base] <= 350000
    )
```

### Mesure 3 : Employés au-dessus du SMIG
```dax
Employes Au Dessus SMIG = 
    CALCULATE(
        COUNTROWS(employe),
        employe[salaire_base] > 350000
    )
```

### Mesure 4 : Salaire minimum dans l'entreprise
```dax
Salaire Min Entreprise = MIN(employe[salaire_base])
```

### Mesure 5 : Salaire maximum dans l'entreprise
```dax
Salaire Max Entreprise = MAX(employe[salaire_base])
```

### Mesure 6 : CNaPS total (part employé)
```dax
CNaPS Total Employe = 
    CALCULATE(SUM(impotdeduction[montant]), impotdeduction[type_deduction] = "CNaPS")
```

### Mesure 7 : OSTIE total (part employé)
```dax
OSTIE Total Employe = 
    CALCULATE(SUM(impotdeduction[montant]), impotdeduction[type_deduction] = "OSTIE")
```

### Mesure 8 : IRSA total
```dax
IRSA Total = 
    CALCULATE(SUM(impotdeduction[montant]), impotdeduction[type_deduction] = "IRSA")
```

### Mesure 9 : Simulation IRSA (pour un salaire donné via paramètre)

Créer un **paramètre What-If** :
1. **Modélisation** → **Nouveau paramètre** → **Paramètre numérique**
2. Nom : `Salaire Simulation`
3. Min : 300000, Max : 5000000, Pas : 50000, Défaut : 550000
4. Cocher **Ajouter un segment à cette page**

Puis créer la mesure :
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

### Mesure 10 : Salaire net simulé
```dax
Salaire Net Simule = 
    VAR Salaire = SELECTEDVALUE('Salaire Simulation'[Salaire Simulation])
    VAR CNaPS = Salaire * 0.01
    VAR OSTIE = Salaire * 0.01
    VAR IRSA = [IRSA Simule]
    RETURN Salaire - CNaPS - OSTIE - IRSA
```

---

## 📊 Visuels à créer

### Visuel 1 : Tableau Cotisations Sociales

1. **Tableau**
2. Source : `ConfigCotisations`
3. Colonnes : Cotisation, Part Employe (%), Part Employeur (%), Total (%)
4. Format : fond en-tête `#1B4F72`, texte blanc
5. Titre : `📋 Cotisations Sociales (CNaPS + OSTIE)`

---

### Visuel 2 : Barème IRSA (Barres horizontales)

1. **Graphique à barres groupées**
2. Source : `ConfigIRSA`
3. Configuration :
   - **Axe Y** : `ConfigIRSA[Tranche]`
   - **Axe X** : `ConfigIRSA[Taux (%)]`
4. Couleurs : gradient du vert clair (0%) au rouge foncé (25%)
5. Étiquettes de données : afficher le `Taux (%)`
6. Titre : `📊 Barème IRSA progressif`

---

### Visuel 3 : Répartition Réelle des Déductions (Camembert)

1. **Graphique en secteurs**
2. Source : table `impotdeduction` (données réelles)
3. Configuration :
   - **Légende** : `impotdeduction[type_deduction]`
   - **Valeurs** : `SUM(impotdeduction[montant])`
4. Couleurs : CNaPS → `#1B4F72`, OSTIE → `#2E86C1`, IRSA → `#E74C3C`
5. Titre : `Répartition réelle des déductions (tous employés)`

---

### Visuel 4 : Comparaison SMIG vs Salaires (Jauge + indicateurs)

**Option A — Jauge :**
1. **Jauge**
2. Configuration :
   - **Valeur** : `Salaire Min Entreprise`
   - **Min** : 0
   - **Max** : `Salaire Max Entreprise`
   - **Cible** : `SMIG` (350000)
3. Titre : `Salaire min. entreprise vs SMIG`

**Option B — Carte multi-ligne :**
1. **Carte à plusieurs lignes**
2. Champs :
   - `SMIG`
   - `Salaire Min Entreprise`
   - `Salaire Max Entreprise`
3. Titre : `Comparaison salaires`

---

### Visuel 5 : Simulateur IRSA (Section interactive)

1. Le **Slicer** du paramètre `Salaire Simulation` (curseur horizontal)
2. **3 cartes** affichant :
   - `Salaire Simulation` → "Salaire brut simulé"
   - `IRSA Simule` → "IRSA calculé"
   - `Salaire Net Simule` → "Salaire net estimé"
3. **Graphique à colonnes** montrant la décomposition :
   - Axe X : Labels ("CNaPS", "OSTIE", "IRSA", "Net")
   - Valeurs : montants respectifs

**Décomposition DAX pour graphique :**
```dax
-- Créer une table calculée pour la décomposition
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

Puis créer une mesure :
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

---

### Visuel 6 : Majorations HS (Tableau de référence)

1. **Tableau**
2. Source : `ConfigMajorationHS`
3. Colonnes : Periode, Taux Majoration (%), Description
4. Format : lignes alternées en gris clair
5. Titre : `⏰ Taux de majoration des heures supplémentaires`

---

### Visuel 7 : Paramètres Généraux (Tableau)

1. **Tableau**
2. Source : `ConfigGeneral`
3. Colonnes : Parametre, Valeur, Unite, Description
4. Format : en-tête `#1B4F72`, fond alternance gris/blanc
5. Titre : `📋 Paramètres généraux RH`

---

### Filtres — Aucun filtre nécessaire

Cette page est une page de **référence statique**. Pas besoin de Slicers.
Seul le **curseur Salaire Simulation** est interactif pour le simulateur IRSA.

---

# 📝 Checklist Finale

## Vérifications avant publication

- [ ] **Toutes les relations** sont correctement configurées dans le modèle
- [ ] **Les mesures DAX** sont créées et fonctionnent (tester avec un tableau simple)
- [ ] **Les colonnes calculées** (Nom Complet, Ancienneté, Tranche Age, etc.) sont créées
- [ ] **Le thème de couleurs** est appliqué uniformément
- [ ] **Les titres** de chaque page sont clairs et visibles
- [ ] **Les slicers** fonctionnent et filtrent tous les visuels de la page
- [ ] **Les mises en forme conditionnelles** sont appliquées (couleurs selon valeurs)
- [ ] **Les formats numériques** sont corrects (Ariary, %, heures)
- [ ] **L'interactivité** entre visuels fonctionne (cliquer sur un graphique filtre les autres)
- [ ] **Les données** sont à jour (actualiser si nécessaire)

## Interactions entre visuels

Pour configurer les interactions :
1. Sélectionner un visuel → **Format** → **Modifier les interactions**
2. Pour chaque autre visuel, choisir :
   - 🔗 **Filtrer** : le visuel est filtré par la sélection
   - 🔗 **Mettre en surbrillance** : le visuel met en surbrillance les données correspondantes
   - ⛔ **Aucune** : le visuel n'est pas affecté

**Recommandation :** 
- Les KPIs doivent être **filtrés** par les slicers
- Les graphiques doivent se **filtrer mutuellement** (interaction cross-filter)
- Les tableaux doivent être **filtrés** par tous les graphiques

## Navigation entre pages

1. Ajouter un **bouton** de navigation en bas de chaque page
2. **Insérer** → **Boutons** → **Navigation** → **Signet de page**
3. Créer 6 boutons avec les noms des pages
4. Configurer chaque bouton : **Action** → **Navigation de page** → sélectionner la page cible

---

# 🎯 Résumé des Pages

| Page | Nom | Tables utilisées | Nb mesures DAX | Nb visuels |
|------|-----|-----------------|----------------|------------|
| 1 | Recrutement | departement, annonce, candidature, candidat, entretien | 9 | 10 + 3 slicers |
| 2 | Employés | employe, departement, performance, conge, formation, dossieremploye | 11 | 11 + 4 slicers |
| 3 | Paie | paie, employe, departement, impotdeduction | 12 | 11 + 4 slicers |
| 4 | Présences | presence, absence, employe, departement | 10 | 11 + 4 slicers |
| 5 | Heures Sup | heuressupplementaires, employe, departement, paie | 10 | 10 + 4 slicers |
| 6 | Configurations | Tables manuelles + impotdeduction, employe | 10 | 7 + 1 curseur |
| **Total** | | **18 tables** | **62 mesures** | **60+ visuels** |

---

*Tutoriel créé pour le projet RH-PowerBI — S5 — Ressources Humaines — Madagascar — 2025*
