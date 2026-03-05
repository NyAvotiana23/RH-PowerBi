# Documentation des Configurations — Application RH Madagascar

> Ce document décrit l'ensemble des paramètres de configuration utilisés dans l'application RH, conformément à la législation malgache et aux pratiques locales en vigueur.

---

## Table des matières

1. [Cotisations Sociales](#1-cotisations-sociales-unité-1)
2. [Salaire Minimum](#2-salaire-minimum-unité-2)
3. [Congés et Absences](#3-congés-et-absences-unité-3)
4. [Temps de Travail](#4-temps-de-travail-unité-4)
5. [Validité des Congés](#5-validité-des-congés-unité-5)
6. [Pointage et Heures Supplémentaires](#6-pointage-et-heures-supplémentaires-unité-6)
7. [Barème IRSA](#7-barème-irsa-impôt-sur-les-revenus-salariaux-et-assimilés)

---

## 1. Cotisations Sociales (Unité 1)

Ces paramètres définissent les taux de cotisations obligatoires appliqués aux salaires, partagés entre l'employé et l'entreprise.

### CNAPS — Caisse Nationale de Prévoyance Sociale

La CNAPS est l'organisme de sécurité sociale à Madagascar, couvrant notamment les risques vieillesse, invalidité et décès.

| Paramètre | Valeur | Description |
|---|---|---|
| `TAUX_CNAPS_EMPLOYE` | **1,0 %** | Part salariale de la cotisation CNAPS |
| `TAUX_CNAPS_ENTREPRISE` | **13,0 %** | Part patronale de la cotisation CNAPS |

> **Total CNAPS :** 14 % du salaire brut, dont 13 % à la charge de l'employeur et 1 % à la charge du salarié.

---

### OSTIE — Organisation Sanitaire Tananarivienne Inter-Entreprises

L'OSTIE assure la couverture médicale et sanitaire des employés du secteur privé.

| Paramètre | Valeur | Description |
|---|---|---|
| `TAUX_OSTIE_EMPLOYE` | **1,0 %** | Part salariale de la cotisation OSTIE |
| `TAUX_OSTIE_ENTREPRISE` | **5,0 %** | Part patronale de la cotisation OSTIE |

> **Total OSTIE :** 6 % du salaire brut, dont 5 % à la charge de l'employeur et 1 % à la charge du salarié.

---

### Majoration des Heures Supplémentaires

| Paramètre | Valeur | Description |
|---|---|---|
| `MAJORATION_HEURES_SUP` | **30 %** | Majoration appliquée au taux horaire pour les heures supplémentaires |

> Conformément au Code du travail malgache, les heures effectuées au-delà du seuil légal sont rémunérées avec une majoration minimale de 30 %.

---

## 2. Salaire Minimum (Unité 2)

| Paramètre | Valeur | Description |
|---|---|---|
| `SALAIRE_MINIMUM` | **350 000 Ar** | Salaire Minimum d'Interprofessionnel Garanti (SMIG) à Madagascar |

> Le SMIG est le seuil légal de rémunération mensuelle en dessous duquel aucun salarié ne peut être payé. Ce montant est fixé par décret gouvernemental et peut être révisé périodiquement.

---

## 3. Congés et Absences (Unité 3)

Cette section regroupe les règles de gestion des congés payés et des limites d'absences autorisées.

### Congés Payés Annuels

| Paramètre | Valeur | Description |
|---|---|---|
| `JOURS_CONGE_ANNUEL` | **30 jours** | Nombre total de jours de congé payé acquis par an |
| `CONGE_MAX_ANNUEL` | **30 jours** | Plafond maximal de congés pouvant être pris sur l'année |
| `CONGE_MAX_MENSUEL` | **2,5 jours** | Acquisition mensuelle de congés (30 jours ÷ 12 mois) |

> L'acquisition des congés se fait à raison de **2,5 jours par mois travaillé**, soit 30 jours par année complète, conformément au Code du travail malgache.

---

### Limites d'Absences et de Retards

| Paramètre | Valeur | Description |
|---|---|---|
| `MAX_JOURS_ABSCENCE_MOIS` | **3 jours** | Nombre maximum de jours d'absence autorisés par mois |
| `MAX_JOURS_RETARD_MOIS` | **2 jours** | Nombre maximum de jours de retard tolérés par mois |

> Au-delà de ces seuils, les absences ou retards peuvent faire l'objet de retenues sur salaire ou de mesures disciplinaires selon le règlement intérieur de l'entreprise.

---

## 4. Temps de Travail (Unité 4)

| Paramètre | Valeur | Description |
|---|---|---|
| `HEURES_TRAVAIL_MENSUEL` | **173,33 h** | Durée légale de travail mensuelle |

> Ce chiffre correspond à **40 heures par semaine × 52 semaines ÷ 12 mois = 173,33 heures/mois**. Il sert de base au calcul du taux horaire à partir du salaire mensuel brut.

**Exemple de calcul du taux horaire :**
```
Taux horaire = Salaire mensuel brut ÷ 173,33
```

---

## 5. Validité des Congés (Unité 5)

| Paramètre | Valeur | Description |
|---|---|---|
| `CONGE_MAX_VALIDITE` | **3 ans** | Durée maximale de validité des congés non pris |

> Les congés acquis et non utilisés sont reportables pendant **3 années**. Passé ce délai, les jours de congé non consommés peuvent être perdus ou soumis à des règles spécifiques définies par l'entreprise.

---

## 6. Pointage et Heures Supplémentaires (Unité 6)

### Règles de Pointage

| Paramètre | Valeur | Description |
|---|---|---|
| `HEURE_POINTAGE_RETARD` | **08:00** | Heure de référence — au-delà, l'employé est considéré en retard |
| `HEURE_POINTAGE_ABSCENT` | **09:00** | Heure de référence — au-delà, l'employé est considéré absent |

> - Arrivée **avant 08:00** → Présence normale
> - Arrivée **entre 08:00 et 09:00** → Retard
> - Arrivée **après 09:00** → Absence comptabilisée pour la journée

---

### Plafonds d'Heures Supplémentaires

| Paramètre | Valeur | Description |
|---|---|---|
| `TOTAL_HEURE_SUP_SEMAINE` | **20 h** | Plafond hebdomadaire d'heures supplémentaires |
| `TOTAL_HEURE_SUP_MOIS` | **80 h** | Plafond mensuel d'heures supplémentaires |

> Ces plafonds permettent de contrôler la charge de travail et d'assurer la conformité légale. Tout dépassement doit faire l'objet d'une autorisation préalable et d'un suivi RH rigoureux.

---

## 7. Barème IRSA — Impôt sur les Revenus Salariaux et Assimilés

L'IRSA est l'impôt prélevé à la source sur les salaires à Madagascar. Il est calculé de manière **progressive** selon les tranches suivantes :

| Tranche | Revenu mensuel imposable | Taux |
|---|---|---|
| Tranche 1 | De **0** à **350 000 Ar** | **0 %** (exonéré) |
| Tranche 2 | De **350 001** à **400 000 Ar** | **5 %** |
| Tranche 3 | De **400 001** à **500 000 Ar** | **10 %** |
| Tranche 4 | De **500 001** à **600 000 Ar** | **15 %** |
| Tranche 5 | De **600 001** à **4 000 000 Ar** | **20 %** |
| Tranche 6 | Au-delà de **4 000 001 Ar** | **25 %** |

> **Note :** Le taux s'applique uniquement à la **portion du revenu comprise dans chaque tranche**, et non au revenu total (imposition progressive).

### Exemple de calcul IRSA

Pour un salaire imposable de **550 000 Ar** :

| Tranche | Montant dans la tranche | Taux | IRSA |
|---|---|---|---|
| 0 – 350 000 | 350 000 Ar | 0 % | 0 Ar |
| 350 001 – 400 000 | 49 999 Ar | 5 % | 2 500 Ar |
| 400 001 – 500 000 | 99 999 Ar | 10 % | 10 000 Ar |
| 500 001 – 550 000 | 49 999 Ar | 15 % | 7 500 Ar |
| **Total IRSA** | | | **20 000 Ar** |

---

## Résumé des Charges Sociales

| Cotisation | Employé | Entreprise | Total |
|---|---|---|---|
| CNAPS | 1 % | 13 % | 14 % |
| OSTIE | 1 % | 5 % | 6 % |
| **Total charges sociales** | **2 %** | **18 %** | **20 %** |

> Ces taux s'appliquent sur le **salaire brut** de l'employé. L'IRSA est ensuite calculé sur le salaire net imposable après déduction des cotisations salariales.

---

*Document généré automatiquement à partir des paramètres de configuration de l'application RH — Madagascar.*