# 📊 Power BI — Setup Commun & Configuration Initiale
### Projet RH Madagascar — Base `rh_madagascar`

> Ce fichier est le **point de départ obligatoire** avant de travailler sur n'importe quelle page du dashboard. Il couvre la connexion à la base de données, la vérification du modèle de données, les colonnes calculées globales, et la charte graphique.

---

## Table des matières

1. [Prérequis](#1-prérequis)
2. [Connexion à PostgreSQL](#2-connexion-à-postgresql)
3. [Chargement des tables](#3-chargement-des-tables)
4. [Vérification du modèle de données — Relations](#4-vérification-du-modèle-de-données--relations)
5. [Colonnes calculées globales](#5-colonnes-calculées-globales)
6. [Charte graphique & Thème de couleurs](#6-charte-graphique--thème-de-couleurs)
7. [Checklist finale avant de commencer](#7-checklist-finale-avant-de-commencer)

---

## 1. Prérequis

Avant de lancer Power BI, s'assurer que les éléments suivants sont en place :

| Élément | Détail |
|---------|--------|
| **Power BI Desktop** | Version gratuite depuis [powerbi.microsoft.com](https://powerbi.microsoft.com) |
| **PostgreSQL** | En cours d'exécution avec la base `rh_madagascar` créée |
| **Scripts SQL exécutés** | `script.sql` (structure) + `data.sql` (données) exécutés dans l'ordre |
| **Connecteur Npgsql** | Inclus dans les versions récentes de Power BI. Sinon, installer depuis [github.com/npgsql](https://github.com/npgsql/npgsql) |

> ⚠️ **Important :** Exécuter `reset.sql` uniquement si l'on veut repartir de zéro. Ce script supprime toutes les tables.

---

## 2. Connexion à PostgreSQL

Suivre ces étapes dans Power BI Desktop :

**Étape 1 — Ouvrir la source de données**

1. Lancer **Power BI Desktop**
2. Aller dans l'onglet **Accueil** → cliquer sur **Obtenir les données** → **Plus...**
3. Dans la fenêtre de recherche, taper `PostgreSQL`
4. Sélectionner **Base de données PostgreSQL** → cliquer **Se connecter**

**Étape 2 — Paramètres de connexion**

Renseigner les informations suivantes dans la fenêtre qui s'ouvre :

| Champ | Valeur à saisir |
|-------|----------------|
| **Serveur** | `localhost` (ou l'adresse IP du serveur si distant) |
| **Base de données** | `rh_madagascar` |
| **Mode de connectivité** | `Importer` *(recommandé pour les performances)* |

Cliquer **OK**, puis saisir les identifiants PostgreSQL (ex : `postgres` / votre mot de passe).

> 💡 **Remarque :** Le mode `Importer` copie les données dans Power BI pour des performances optimales. Le mode `DirectQuery` convient si la base est très volumineuse et actualisée en temps réel.

---

## 3. Chargement des tables

Dans la fenêtre **Navigateur** qui apparaît, cocher **toutes** les tables suivantes :

| Table | Description |
|-------|-------------|
| ☑ `absence` | Enregistrements des absences des employés |
| ☑ `annonce` | Offres d'emploi publiées par département |
| ☑ `avantagesocial` | Avantages en nature et primes spéciales |
| ☑ `bulletinpaie` | Bulletins de paie générés |
| ☑ `candidat` | Informations sur les candidats |
| ☑ `candidature` | Candidatures reçues par annonce |
| ☑ `conge` | Demandes et soldes de congé |
| ☑ `departement` | Liste des départements de l'entreprise |
| ☑ `dossieremploye` | Dossiers détaillés (avec champ JSON) |
| ☑ `employe` | Table centrale des employés |
| ☑ `entretien` | Entretiens planifiés et résultats |
| ☑ `formation` | Formations suivies par les employés |
| ☑ `heuressupplementaires` | Demandes et paiement des heures sup. |
| ☑ `horaire` | Horaires de travail définis |
| ☑ `impotdeduction` | Déductions : CNaPS, OSTIE, IRSA |
| ☑ `paie` | Fiches de paie mensuelles |
| ☑ `performance` | Évaluations de performance |
| ☑ `presence` | Pointage journalier des employés |

Cliquer **Charger** pour importer toutes les tables.

---

## 4. Vérification du modèle de données — Relations

Une fois les données chargées, aller dans l'onglet **Modèle** (icône diagramme dans la barre latérale gauche) pour vérifier les relations.

### Relations attendues

Power BI devrait détecter automatiquement la plupart des relations. Vérifier qu'elles sont toutes présentes :

| Table source | Champ FK | → | Table destination | Champ PK | Type |
|---|---|---|---|---|---|
| `employe` | `id_departement` | → | `departement` | `id_departement` | N:1 |
| `employe` | `id_candidat` | → | `candidat` | `id_candidat` | N:1 |
| `annonce` | `id_departement` | → | `departement` | `id_departement` | N:1 |
| `candidature` | `id_candidat` | → | `candidat` | `id_candidat` | N:1 |
| `candidature` | `id_annonce` | → | `annonce` | `id_annonce` | N:1 |
| `entretien` | `id_candidature` | → | `candidature` | `id_candidature` | N:1 |
| `dossieremploye` | `id_employe` | → | `employe` | `id_employe` | **1:1** |
| `performance` | `id_employe` | → | `employe` | `id_employe` | N:1 |
| `conge` | `id_employe` | → | `employe` | `id_employe` | N:1 |
| `absence` | `id_employe` | → | `employe` | `id_employe` | N:1 |
| `formation` | `id_employe` | → | `employe` | `id_employe` | N:1 |
| `horaire` | `id_employe` | → | `employe` | `id_employe` | N:1 |
| `presence` | `id_employe` | → | `employe` | `id_employe` | N:1 |
| `heuressupplementaires` | `id_employe` | → | `employe` | `id_employe` | N:1 |
| `paie` | `id_employe` | → | `employe` | `id_employe` | N:1 |
| `avantagesocial` | `id_employe` | → | `employe` | `id_employe` | N:1 |
| `impotdeduction` | `id_paie` | → | `paie` | `id_paie` | N:1 |
| `bulletinpaie` | `id_paie` | → | `paie` | `id_paie` | **1:1** |

### Comment créer une relation manquante

Si une relation n'a pas été détectée automatiquement :

1. Dans la vue **Modèle**, repérer les deux tables concernées
2. Cliquer-glisser le champ source (ex : `employe.id_departement`) vers le champ destination (ex : `departement.id_departement`)
3. Une ligne de relation apparaît entre les deux tables
4. Double-cliquer sur la ligne pour vérifier la cardinalité (**N:1** ou **1:1**)

> ⚠️ **Attention :** Ne pas créer de relations en doublon. Si une relation existe déjà (ligne grisée), la supprimer avant d'en créer une nouvelle.

---

## 5. Colonnes calculées globales

Ces colonnes sont créées **une seule fois** et utilisées dans toutes les pages du dashboard. Pour créer une colonne calculée : aller dans **Modélisation** → **Nouvelle colonne**.

### 5.1 Table `employe` — Nom complet

```dax
Nom Complet = employe[nom] & " " & employe[prenom]
```

> Affiche le nom complet de chaque employé. Utilisé dans tous les tableaux et slicers.

---

### 5.2 Table `employe` — Ancienneté en années

```dax
Anciennete = DATEDIFF(employe[date_embauche], TODAY(), YEAR)
```

> Calcule le nombre d'années depuis la date d'embauche jusqu'à aujourd'hui. Utilisé pour les analyses de fidélisation et les tranches d'ancienneté.

---

### 5.3 Table `employe` — Tranche d'âge

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

> Regroupe les employés par tranches d'âge pour les analyses démographiques.

---

### 5.4 Table `candidat` — Nom complet candidat

```dax
Nom Complet Candidat = candidat[nom] & " " & candidat[prenom]
```

> Affiche le nom complet des candidats. Utilisé dans la page Recrutement.

---

### 5.5 Table `paie` — Libellé du mois

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

> Convertit le numéro de mois (1-12) en son libellé français. Utilisé dans les axes des graphiques de la page Paie.

---

### 5.6 Table `paie` — Période complète

```dax
Periode Complete = paie[Libelle Mois] & " " & FORMAT(paie[annee], "0")
```

> Crée une étiquette lisible de la période, ex : `"Janvier 2025"`. Utilisé comme axe temporel dans les graphiques de paie.

> ⚠️ Cette colonne dépend de la colonne `Libelle Mois` ci-dessus. La créer en dernier.

---

## 6. Charte graphique & Thème de couleurs

### 6.1 Appliquer le thème personnalisé

1. Aller dans l'onglet **Affichage**
2. Cliquer sur **Thèmes** → **Personnaliser le thème actuel**
3. Appliquer les couleurs suivantes :

| Rôle | Couleur | Code Hex | Usage |
|------|---------|----------|-------|
| Couleur principale 1 | Bleu foncé | `#1B4F72` | En-têtes, accents forts |
| Couleur principale 2 | Bleu moyen | `#2E86C1` | Graphiques principaux |
| Couleur principale 3 | Bleu clair | `#85C1E9` | Graphiques secondaires |
| Couleur principale 4 | Vert | `#27AE60` | Indicateurs positifs (présence, approbation) |
| Couleur principale 5 | Rouge | `#E74C3C` | Indicateurs négatifs (absence, refus) |
| Couleur principale 6 | Orange | `#F39C12` | Alertes, en attente, retards |
| Arrière-plan de page | Gris clair | `#ECF0F1` | Fond de toutes les pages |
| Texte | Noir foncé | `#2C3E50` | Tous les textes |

### 6.2 Conventions de couleurs par statut

Ces conventions sont utilisées de manière cohérente dans tout le dashboard :

| Statut | Couleur | Code Hex |
|--------|---------|----------|
| Actif / Présent / Approuvé / Terminé | Vert | `#27AE60` |
| En attente / En cours / Retard | Orange | `#F39C12` |
| Inactif / Absent / Refusé / Annulé | Rouge | `#E74C3C` |
| Neutre / Information | Bleu | `#2E86C1` |

### 6.3 Formats numériques standards

Configurer ces formats dans **Format** → **Étiquettes de données** selon le type de donnée :

| Type de donnée | Format à appliquer |
|----------------|-------------------|
| Montants en Ariary | `#,##0 Ar` |
| Pourcentages | `0.0%` ou `0.0 %` |
| Heures | `0.00 h` |
| Notes / scores | `0.00` |
| Dates | `dd/MM/yyyy` |

---

## 7. Checklist finale avant de commencer

Avant de travailler sur les pages du dashboard, vérifier que chaque point est coché :

- [ ] Power BI Desktop est installé et à jour
- [ ] PostgreSQL tourne avec la base `rh_madagascar`
- [ ] Les scripts `script.sql` et `data.sql` ont été exécutés avec succès
- [ ] La connexion à PostgreSQL est établie dans Power BI
- [ ] Les **18 tables** sont bien chargées dans Power BI
- [ ] Toutes les **relations** sont vérifiées dans la vue Modèle
- [ ] Les **6 colonnes calculées** globales sont créées (`Nom Complet`, `Anciennete`, `Tranche Age`, `Nom Complet Candidat`, `Libelle Mois`, `Periode Complete`)
- [ ] Le **thème de couleurs** est appliqué

---

## Navigation vers les autres pages

| Fichier | Contenu |
|---------|---------|
| `01_recrutement.md` | Page 1 — Gestion du Recrutement par Département |
| `02_employes.md` | Page 2 — Gestion des Employés |
| `03_paie.md` | Page 3 — Gestion de la Paie |
| `04_presences.md` | Page 4 — Gestion des Présences |
| `05_heures_supplementaires.md` | Page 5 — Gestion des Heures Supplémentaires |
| `06_configurations.md` | Page 6 — Vue des Configurations |

---

*Tutoriel RH-PowerBI — Projet S5 — Ressources Humaines — Madagascar — 2025*