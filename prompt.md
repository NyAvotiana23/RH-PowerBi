# Ressource Humaine (Madagascar) : 

## Fonctionnalites :
    - 1) Gestion Recruitement par departement : 
        - a) Publication d'offres d'emploi
        - b) Tri des candidatures
        - c) Planification des entretiens
        - d) Suivi des candidats
    - 2) Gestion des employés :
        - a) Gestion des dossiers des employés 
        - b) Suivi des performances
        - c) Gestion des congés et absences
        - d) Formation et développement
    - 3) Gestion de la paie :
        - a) Calcul des salaires
        - b) Gestion des avantages sociaux
        - c) Gestion des impôts et des déductions
        - d) Génération de bulletins de paie
    - 4) Gestion des presences :
        - a) Suivi des heures de travail
        - b) Gestion des horaires
        - c) Gestion des absences et des retards
        - d) Génération de rapports de présence
    - 5) Gestion des Heures Supplémentaires :
        - a) Suivi des heures supplémentaires
        - b) Calcul des heures supplémentaires
        - c) Gestion des demandes d'heures supplémentaires
        - d) Génération de rapports d'heures supplémentaires

## Attente : 
    Script de base de donnes des tables en PostgreSql pour les fonctionnalités mentionnées ci-dessus.
    Base de donnees simple pour une application de gestion des ressources humaines
    Base de donnees pour un dashboard sur PowerBI (donc but pour les statistiques, les rapports, suivi)
    Donne dynamique relationnels, (tout de suite des donnes concretes,valides,bien calcule, pas de données statiques, pour les statistiques et les rapports)


## Tables : 
    Departement, Annonce, Candidature, Entretien, Candidat,
    Employe, DossierEmploye(une colonne Json pour les details), Performance,
    Conge, Absence, Formation, Paie, AvantageSocial,
    ImpotDeduction, BulletinPaie,
    Presence, Horaire,
    HeuresSupplementaires

## Livrables : 
    - Script de base de données en PostgreSQL pour les tables mentionnées ci-dessus, avec des données d'exemple pour chaque table.
    - Script de reinitialisation de la base de données pour permettre une utilisation immédiate.
    - Fichier de documentation expliquant la structure de la base de données, les relations entre les tables, et des exemples de requêtes pour extraire des statistiques et des rapports pertinents pour PowerBI en .md
    - Les données d'exemple doivent être réalistes et cohérentes, permettant ainsi une utilisation immédiate pour les statistiques et les rapports dans PowerBI.
    - Les relations entre les tables doivent être clairement définies pour assurer l'intégrité des données et faciliter les requêtes pour les analyses.

## Pour chacun des fonctionnalites :
    - Donner les details
    - Faire le tutoriel PowerBI pour les statistiques et les rapports, avec des exemples de visualisations pertinentes pour chaque fonctionnalité.
    - Graphique filtrables pour permettre une analyse approfondie des données.
    - Utilisation de mesures DAX pour calculer des indicateurs clés de performance (KPI) pertinents pour chaque fonctionnalité.
    - Création de rapports interactifs et de tableaux de bord pour permettre aux utilisateurs de suivre les performances et les tendances dans chaque domaine de la gestion des ressources humaines.