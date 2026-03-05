-- ============================================================
-- DONNEES D'EXEMPLE - BASE RH MADAGASCAR
-- Donnees realistes, coherentes et calculees pour PowerBI
-- ============================================================

-- ============================================================
-- 1. DEPARTEMENTS (6 departements)
-- ============================================================
INSERT INTO Departement (nom, description, responsable, date_creation, actif)
VALUES ('Ressources Humaines', 'Gestion du personnel et recrutement', 'RAKOTO Hery', '2020-01-15', TRUE),
       ('Informatique', 'Developpement et maintenance IT', 'ANDRIANARISOA Faly', '2020-01-15', TRUE),
       ('Finance', 'Comptabilite et gestion financiere', 'RAZAFINDRAKOTO Miora', '2020-01-15', TRUE),
       ('Commercial', 'Ventes et relations clients', 'RAHERIMANDIMBY Tiana', '2020-02-01', TRUE),
       ('Logistique', 'Gestion des stocks et livraisons', 'RANDRIANASOLO Vonjy', '2020-03-01', TRUE),
       ('Marketing', 'Communication et strategie marketing', 'RATSIMBAZAFY Lova', '2021-06-01', TRUE);

-- ============================================================
-- 2. CANDIDATS (20 candidats)
-- ============================================================
INSERT INTO Candidat (nom, prenom, email, telephone, adresse, date_naissance, sexe, niveau_etude, experience_annees,
                      cv_url, date_inscription)
VALUES ('RABEARIVELO', 'Hasina', 'hasina.rabearivelo@gmail.com', '+261 34 12 345 01',
        'Lot IB 45 Analakely, Antananarivo', '1992-03-15', 'Masculin', 'Licence', 4, '/cv/rabearivelo_h.pdf',
        '2024-06-01'),
       ('RASOANAIVO', 'Volatiana', 'volatiana.raso@gmail.com', '+261 33 22 456 02',
        'Lot III F 12 Ankorondrano, Antananarivo', '1995-07-22', 'Feminin', 'Master', 2, '/cv/rasoanaivo_v.pdf',
        '2024-06-05'),
       ('ANDRIAMAHEFA', 'Toky', 'toky.andriamahefa@yahoo.fr', '+261 32 45 789 03', 'Villa 8 Ivandry, Antananarivo',
        '1990-11-08', 'Masculin', 'Ingenieur', 6, '/cv/andriamahefa_t.pdf', '2024-06-10'),
       ('RAZAFINDRABE', 'Nomena', 'nomena.razafindrabe@gmail.com', '+261 34 67 012 04',
        'Lot 22 Ambohimanarina, Antananarivo', '1993-01-30', 'Feminin', 'Master', 3, '/cv/razafindrabe_n.pdf',
        '2024-07-01'),
       ('RAKOTONIRINA', 'Ando', 'ando.rakotonirina@gmail.com', '+261 33 89 234 05', 'Lot IVG 78 Antsirabe',
        '1991-05-12', 'Masculin', 'Licence', 5, '/cv/rakotonirina_a.pdf', '2024-07-15'),
       ('RAHERIMANANTSOA', 'Fara', 'fara.raherimanantsoa@gmail.com', '+261 34 11 567 06', 'Lot 5 Ambatondrazaka',
        '1994-09-25', 'Feminin', 'BTS', 2, '/cv/raherimanantsoa_f.pdf', '2024-08-01'),
       ('RANDRIANARIVONY', 'Lanto', 'lanto.randrianarivony@yahoo.fr', '+261 32 33 890 07',
        'Lot II J 34 Behoririka, Antananarivo', '1988-12-03', 'Masculin', 'Master', 8, '/cv/randrianarivony_l.pdf',
        '2024-08-10'),
       ('RASOANANDRASANA', 'Mamy', 'mamy.rasoanandrasana@gmail.com', '+261 34 55 123 08', 'Lot 67 Fianarantsoa',
        '1996-04-18', 'Feminin', 'Licence', 1, '/cv/rasoanandrasana_m.pdf', '2024-08-20'),
       ('RAVALOMANANA', 'Njaka', 'njaka.ravalomanana@gmail.com', '+261 33 77 456 09', 'Lot IB 99 67Ha, Antananarivo',
        '1989-08-07', 'Masculin', 'Ingenieur', 7, '/cv/ravalomanana_n.pdf', '2024-09-01'),
       ('ANDRIANJAFY', 'Soa', 'soa.andrianjafy@gmail.com', '+261 34 99 789 10', 'Lot 11 Mahajanga', '1997-02-14',
        'Feminin', 'BTS', 1, '/cv/andrianjafy_s.pdf', '2024-09-15'),
       ('RAKOTOARISOA', 'Haja', 'haja.rakotoarisoa@gmail.com', '+261 32 12 111 11', 'Lot VA 56 Itaosy, Antananarivo',
        '1993-06-20', 'Masculin', 'Licence', 3, '/cv/rakotoarisoa_h.pdf', '2024-10-01'),
       ('RANAIVOSOA', 'Bako', 'bako.ranaivosoa@gmail.com', '+261 33 34 222 12', 'Lot 44 Toamasina', '1995-10-11',
        'Feminin', 'Master', 2, '/cv/ranaivosoa_b.pdf', '2024-10-10'),
       ('RAZAFIMANDIMBY', 'Tojo', 'tojo.razafimandimby@yahoo.fr', '+261 34 56 333 13',
        'Lot IVB 23 Ambohijatovo, Antananarivo', '1991-03-28', 'Masculin', 'Master', 5, '/cv/razafimandimby_t.pdf',
        '2024-10-20'),
       ('RASOARIMALALA', 'Hanitra', 'hanitra.rasoarimalala@gmail.com', '+261 32 78 444 14', 'Lot 88 Antsirabe',
        '1994-07-05', 'Feminin', 'Ingenieur', 3, '/cv/rasoarimalala_h.pdf', '2024-11-01'),
       ('ANDRIANAIVO', 'Tahiry', 'tahiry.andrianaivo@gmail.com', '+261 33 90 555 15',
        'Lot III K 67 Ankadifotsy, Antananarivo', '1990-12-16', 'Masculin', 'Master', 6, '/cv/andrianaivo_t.pdf',
        '2024-11-10'),
       ('RABEMANANJARA', 'Ony', 'ony.rabemananjara@gmail.com', '+261 34 12 666 16', 'Lot 33 Diego Suarez', '1996-05-22',
        'Feminin', 'Licence', 1, '/cv/rabemananjara_o.pdf', '2024-11-20'),
       ('RAVELOJAONA', 'Manoa', 'manoa.ravelojaona@yahoo.fr', '+261 32 34 777 17',
        'Lot IIA 45 Tsimbazaza, Antananarivo', '1992-09-09', 'Masculin', 'Ingenieur', 4, '/cv/ravelojaona_m.pdf',
        '2024-12-01'),
       ('RANAIVOSON', 'Kanto', 'kanto.ranaivoson@gmail.com', '+261 33 56 888 18', 'Lot 77 Majunga', '1997-01-27',
        'Feminin', 'BTS', 0, '/cv/ranaivoson_k.pdf', '2025-01-05'),
       ('RAKOTOVAO', 'Rina', 'rina.rakotovao@gmail.com', '+261 34 78 999 19', 'Lot IVG 12 Mahamasina, Antananarivo',
        '1993-11-13', 'Masculin', 'Master', 4, '/cv/rakotovao_r.pdf', '2025-01-15'),
       ('RASOANOMENJANAHARY', 'Lalao', 'lalao.rasoanomenjanahary@gmail.com', '+261 32 90 000 20', 'Lot 55 Toliara',
        '1995-04-08', 'Feminin', 'Licence', 2, '/cv/rasoanomenjanahary_l.pdf', '2025-02-01');

-- ============================================================
-- 3. ANNONCES (12 offres d'emploi)
-- ============================================================
INSERT INTO Annonce (id_departement, titre, description, poste, type_contrat, salaire_min, salaire_max,
                     date_publication, date_cloture, statut, nombre_postes)
VALUES (2, 'Developpeur Web Full-Stack', 'Recherchons un developpeur web polyvalent maitrisant React et Node.js',
        'Developpeur Web', 'CDI', 800000, 1500000, '2024-06-01', '2024-07-01', 'Fermee', 2),
       (1, 'Assistant RH', 'Recherchons un assistant pour le departement RH', 'Assistant RH', 'CDD', 500000, 800000,
        '2024-06-15', '2024-07-15', 'Fermee', 1),
       (3, 'Comptable Junior', 'Poste de comptable junior avec experience en comptabilite malgache', 'Comptable', 'CDI',
        600000, 1000000, '2024-07-01', '2024-08-01', 'Fermee', 1),
       (4, 'Commercial Terrain', 'Agent commercial pour la region Analamanga', 'Commercial', 'CDI', 500000, 900000,
        '2024-08-01', '2024-09-01', 'Fermee', 3),
       (2, 'Administrateur Systeme', 'Admin sys Linux/Windows pour infrastructure IT', 'Administrateur Systeme', 'CDI',
        1000000, 1800000, '2024-09-01', '2024-10-01', 'Fermee', 1),
       (5, 'Responsable Logistique', 'Chef d equipe logistique pour entrepot Tana', 'Responsable Logistique', 'CDI',
        900000, 1600000, '2024-09-15', '2024-10-15', 'Fermee', 1),
       (6, 'Community Manager', 'Gestion des reseaux sociaux et creation de contenu', 'Community Manager', 'CDD',
        500000, 800000, '2024-10-01', '2024-11-01', 'Fermee', 1),
       (2, 'Stagiaire Developpeur Mobile', 'Stage en developpement mobile Flutter/React Native', 'Stagiaire Dev Mobile',
        'Stage', 200000, 400000, '2024-11-01', '2024-12-01', 'Fermee', 2),
       (3, 'Analyste Financier', 'Analyste financier senior pour reporting et previsions', 'Analyste Financier', 'CDI',
        1200000, 2000000, '2025-01-01', '2025-02-01', 'Fermee', 1),
       (4, 'Responsable Commercial', 'Responsable equipe commerciale zone Nord', 'Responsable Commercial', 'CDI',
        1000000, 1800000, '2025-01-15', '2025-02-15', 'En cours', 1),
       (1, 'Charge de Formation', 'Responsable formation et developpement des competences', 'Charge de Formation',
        'CDI', 700000, 1200000, '2025-02-01', '2025-03-15', 'Ouverte', 1),
       (6, 'Graphiste Designer', 'Graphiste creatif pour supports marketing', 'Graphiste', 'CDD', 600000, 1000000,
        '2025-02-15', '2025-03-31', 'Ouverte', 1);

-- ============================================================
-- 4. CANDIDATURES (30 candidatures)
-- ============================================================
INSERT INTO Candidature (id_candidat, id_annonce, date_candidature, lettre_motivation, statut, note_evaluation,
                         commentaire)
VALUES (1, 1, '2024-06-05', 'Motive par le developpement web, 4 ans d experience React.', 'Acceptee', 16.50,
        'Excellent profil technique'),
       (3, 1, '2024-06-08', 'Ingenieur full-stack avec 6 ans d experience.', 'Acceptee', 18.00,
        'Profil senior tres solide'),
       (2, 2, '2024-06-20', 'Passionnee par les RH, Master en GRH.', 'Acceptee', 15.00, 'Bon profil academique'),
       (4, 3, '2024-07-05', 'Master en finance, 3 ans en cabinet comptable.', 'Acceptee', 14.50,
        'Experience pertinente'),
       (5, 4, '2024-08-05', 'Experience terrain en vente B2B.', 'Acceptee', 13.00, 'Profil commercial confirme'),
       (6, 4, '2024-08-10', 'Motivee pour le commerce a Madagascar.', 'Acceptee', 12.50, 'Bon contact client'),
       (8, 4, '2024-08-12', 'Jeune diplome motivee pour la vente.', 'Acceptee', 11.00, 'Potentiel a developper'),
       (7, 5, '2024-09-05', 'Admin sys senior, 8 ans Linux/Windows.', 'Acceptee', 17.50, 'Expert technique'),
       (9, 6, '2024-09-20', 'Ingenieur logistique avec 7 ans d experience.', 'Acceptee', 16.00,
        'Profil ideal pour le poste'),
       (10, 7, '2024-10-05', 'Passionnee par les reseaux sociaux.', 'Acceptee', 13.50, 'Creatif et motive'),
       (11, 1, '2024-06-10', 'Developpeur avec 3 ans d experience.', 'Refusee', 10.00, 'Niveau technique insuffisant'),
       (12, 2, '2024-06-22', 'Master en management, interessee par les RH.', 'Refusee', 11.00,
        'Pas assez specialise en RH'),
       (13, 5, '2024-09-08', 'Expert reseaux avec 5 ans d experience.', 'Preselectionnee', 14.00,
        'A evaluer en entretien technique'),
       (14, 8, '2024-11-05', 'Etudiante en informatique, passionnee mobile.', 'Acceptee', 14.00, 'Bon potentiel stage'),
       (15, 9, '2025-01-05', 'Analyste financier senior, 6 ans d experience.', 'Acceptee', 17.00, 'Excellent profil'),
       (16, 7, '2024-10-08', 'Experience en community management.', 'Refusee', 9.50, 'Manque d experience'),
       (17, 8, '2024-11-10', 'Ingenieur mobile Flutter, 4 ans d experience.', 'Acceptee', 15.50,
        'Surqualifie mais motive'),
       (18, 10, '2025-01-20', 'Candidate pour responsable commercial.', 'En attente', NULL,
        'Dossier en cours d evaluation'),
       (19, 11, '2025-02-05', 'Experience en formation professionnelle.', 'Preselectionnee', 14.50,
        'Profil interessant'),
       (20, 12, '2025-02-20', 'Graphiste avec portfolio creatif.', 'Recue', NULL, 'Dossier recu'),
       (5, 10, '2025-01-22', 'Souhait d evolution vers poste commercial.', 'Entretien', 13.50, 'En cours d evaluation'),
       (11, 8, '2024-11-08', 'Interesse par le dev mobile.', 'Refusee', 8.00, 'Niveau insuffisant'),
       (12, 9, '2025-01-08', 'Master finance, 2 ans d experience.', 'Refusee', 12.00, 'Profil trop junior'),
       (13, 3, '2024-07-08', 'Comptabilite et audit, 5 ans.', 'Preselectionnee', 15.00, 'Bon profil mais poste pourvu'),
       (14, 6, '2024-09-22', 'Ingenieur logistique, interessee.', 'Refusee', 10.50, 'Experience non pertinente'),
       (1, 5, '2024-09-10', 'Aussi competent en sysadmin.', 'Refusee', 9.00, 'Profil dev, pas admin sys'),
       (3, 9, '2025-01-10', 'Competences en data analyse.', 'Refusee', 11.50, 'Profil IT, pas finance'),
       (9, 5, '2024-09-12', 'Experience en infrastructure.', 'Preselectionnee', 15.50, 'Bon profil alternatif'),
       (15, 11, '2025-02-08', 'Experience en pedagogie et formation.', 'Entretien', 15.00, 'Profil a approfondir'),
       (20, 11, '2025-02-10', 'Interessee par la formation.', 'Recue', NULL, 'Dossier recu');

-- ============================================================
-- 5. ENTRETIENS (18 entretiens)
-- ============================================================
INSERT INTO Entretien (id_candidature, date_entretien, lieu, type_entretien, evaluateur, note, commentaire, resultat)
VALUES (1, '2024-06-20 09:00:00', 'Bureau RH Analakely', 'Presentiel', 'RAKOTO Hery', 16.00,
        'Tres bon entretien, maitrise technique solide', 'Favorable'),
       (2, '2024-06-22 10:00:00', 'Bureau RH Analakely', 'Technique', 'ANDRIANARISOA Faly', 17.50,
        'Excellent niveau technique, profil senior', 'Favorable'),
       (3, '2024-07-01 14:00:00', 'Bureau RH Analakely', 'Presentiel', 'RAKOTO Hery', 15.00,
        'Bonne presentation, motivee', 'Favorable'),
       (4, '2024-07-15 09:30:00', 'Bureau Finance', 'Presentiel', 'RAZAFINDRAKOTO Miora', 14.00,
        'Competences comptables correctes', 'Favorable'),
       (5, '2024-08-15 10:00:00', 'Bureau Commercial', 'Presentiel', 'RAHERIMANDIMBY Tiana', 13.50,
        'Bon sens commercial', 'Favorable'),
       (6, '2024-08-18 11:00:00', 'Bureau Commercial', 'Telephonique', 'RAHERIMANDIMBY Tiana', 12.00,
        'Motivee mais moins experimentee', 'Favorable'),
       (7, '2024-08-20 14:00:00', 'Bureau Commercial', 'Presentiel', 'RAHERIMANDIMBY Tiana', 11.50,
        'Potentiel a developper', 'Reserve'),
       (8, '2024-09-15 09:00:00', 'Bureau IT', 'Technique', 'ANDRIANARISOA Faly', 18.00,
        'Expert inconteste en admin sys', 'Favorable'),
       (9, '2024-10-01 10:00:00', 'Entrepot Logistique', 'Presentiel', 'RANDRIANASOLO Vonjy', 16.50,
        'Tres bonne experience terrain', 'Favorable'),
       (10, '2024-10-15 14:30:00', 'Bureau Marketing', 'Visio', 'RATSIMBAZAFY Lova', 13.00,
        'Creatif, bonne maitrise reseaux', 'Favorable'),
       (14, '2024-11-15 09:00:00', 'Bureau IT', 'Technique', 'ANDRIANARISOA Faly', 14.00, 'Bon niveau pour un stage',
        'Favorable'),
       (17, '2024-11-20 10:30:00', 'Bureau IT', 'Technique', 'ANDRIANARISOA Faly', 15.00, 'Surqualifie pour le stage',
        'Favorable'),
       (15, '2025-01-15 09:00:00', 'Bureau Finance', 'Presentiel', 'RAZAFINDRAKOTO Miora', 17.00,
        'Excellent profil analyste', 'Favorable'),
       (13, '2024-09-20 14:00:00', 'Bureau IT', 'Technique', 'ANDRIANARISOA Faly', 14.50,
        'Bon profil mais poste deja pourvu', 'Reserve'),
       (7, '2024-08-25 10:00:00', 'Bureau Commercial', 'Presentiel', 'RAHERIMANDIMBY Tiana', 12.00,
        'Second entretien, amelioration', 'Favorable'),
       (19, '2025-02-20 09:00:00', 'Bureau RH Analakely', 'Presentiel', 'RAKOTO Hery', 14.50,
        'Profil interessant pour formation', 'En attente'),
       (21, '2025-02-01 10:00:00', 'Bureau Commercial', 'Visio', 'RAHERIMANDIMBY Tiana', 13.00, 'Evaluation en cours',
        'En attente'),
       (29, '2025-02-25 14:00:00', 'Bureau RH Analakely', 'Presentiel', 'RAKOTO Hery', 15.50,
        'Bonne experience en pedagogie', 'En attente');

-- ============================================================
-- 6. EMPLOYES (15 employes)
-- ============================================================
INSERT INTO Employe (id_departement, matricule, nom, prenom, email, telephone, adresse, date_naissance, sexe, poste,
                     date_embauche, type_contrat, salaire_base, statut, id_candidat)
VALUES (1, 'RH-001', 'RAKOTO', 'Hery', 'hery.rakoto@rh-mg.com', '+261 34 00 001 01', 'Lot IA 12 Isoraka, Antananarivo',
        '1985-03-10', 'Masculin', 'Directeur RH', '2020-01-15', 'CDI', 2500000.00, 'Actif', NULL),
       (2, 'IT-001', 'ANDRIANARISOA', 'Faly', 'faly.andrianarisoa@rh-mg.com', '+261 33 00 002 02',
        'Lot IB 34 Ivandry, Antananarivo', '1987-06-22', 'Masculin', 'Directeur IT', '2020-01-15', 'CDI', 2800000.00,
        'Actif', NULL),
       (3, 'FIN-001', 'RAZAFINDRAKOTO', 'Miora', 'miora.razafindrakoto@rh-mg.com', '+261 34 00 003 03',
        'Villa 5 Ambatobe, Antananarivo', '1986-09-14', 'Feminin', 'Directrice Finance', '2020-01-15', 'CDI',
        2600000.00, 'Actif', NULL),
       (4, 'COM-001', 'RAHERIMANDIMBY', 'Tiana', 'tiana.raherimandimby@rh-mg.com', '+261 32 00 004 04',
        'Lot II A 56 Ankorondrano, Antananarivo', '1984-12-05', 'Masculin', 'Directeur Commercial', '2020-02-01', 'CDI',
        2400000.00, 'Actif', NULL),
       (5, 'LOG-001', 'RANDRIANASOLO', 'Vonjy', 'vonjy.randrianasolo@rh-mg.com', '+261 33 00 005 05',
        'Lot VA 78 Andraharo, Antananarivo', '1988-04-18', 'Masculin', 'Directeur Logistique', '2020-03-01', 'CDI',
        2200000.00, 'Actif', NULL),
       (6, 'MKT-001', 'RATSIMBAZAFY', 'Lova', 'lova.ratsimbazafy@rh-mg.com', '+261 34 00 006 06',
        'Lot III G 90 Tsaralalana, Antananarivo', '1989-08-30', 'Feminin', 'Directrice Marketing', '2021-06-01', 'CDI',
        2300000.00, 'Actif', NULL),
       (2, 'IT-002', 'RABEARIVELO', 'Hasina', 'hasina.rabearivelo@rh-mg.com', '+261 34 12 345 01',
        'Lot IB 45 Analakely, Antananarivo', '1992-03-15', 'Masculin', 'Developpeur Web', '2024-07-15', 'CDI',
        1200000.00, 'Actif', 1),
       (2, 'IT-003', 'ANDRIAMAHEFA', 'Toky', 'toky.andriamahefa@rh-mg.com', '+261 32 45 789 03',
        'Villa 8 Ivandry, Antananarivo', '1990-11-08', 'Masculin', 'Developpeur Senior', '2024-07-15', 'CDI',
        1500000.00, 'Actif', 3),
       (1, 'RH-002', 'RASOANAIVO', 'Volatiana', 'volatiana.rasoanaivo@rh-mg.com', '+261 33 22 456 02',
        'Lot III F 12 Ankorondrano, Antananarivo', '1995-07-22', 'Feminin', 'Assistante RH', '2024-08-01', 'CDD',
        700000.00, 'Actif', 2),
       (3, 'FIN-002', 'RAZAFINDRABE', 'Nomena', 'nomena.razafindrabe@rh-mg.com', '+261 34 67 012 04',
        'Lot 22 Ambohimanarina, Antananarivo', '1993-01-30', 'Feminin', 'Comptable', '2024-08-15', 'CDI', 900000.00,
        'Actif', 4),
       (4, 'COM-002', 'RAKOTONIRINA', 'Ando', 'ando.rakotonirina@rh-mg.com', '+261 33 89 234 05',
        'Lot IVG 78 Antsirabe', '1991-05-12', 'Masculin', 'Commercial Terrain', '2024-09-01', 'CDI', 700000.00, 'Actif',
        5),
       (4, 'COM-003', 'RAHERIMANANTSOA', 'Fara', 'fara.raherimanantsoa@rh-mg.com', '+261 34 11 567 06',
        'Lot 5 Ambatondrazaka', '1994-09-25', 'Feminin', 'Commerciale Terrain', '2024-09-01', 'CDI', 650000.00, 'Actif',
        6),
       (2, 'IT-004', 'RANDRIANARIVONY', 'Lanto', 'lanto.randrianarivony@rh-mg.com', '+261 32 33 890 07',
        'Lot II J 34 Behoririka, Antananarivo', '1988-12-03', 'Masculin', 'Administrateur Systeme', '2024-10-15', 'CDI',
        1600000.00, 'Actif', 7),
       (5, 'LOG-002', 'RAVALOMANANA', 'Njaka', 'njaka.ravalomanana@rh-mg.com', '+261 33 77 456 09',
        'Lot IB 99 67Ha, Antananarivo', '1989-08-07', 'Masculin', 'Responsable Logistique', '2024-11-01', 'CDI',
        1400000.00, 'Actif', 9),
       (6, 'MKT-002', 'ANDRIANJAFY', 'Soa', 'soa.andrianjafy@rh-mg.com', '+261 34 99 789 10', 'Lot 11 Mahajanga',
        '1997-02-14', 'Feminin', 'Community Manager', '2024-11-15', 'CDD', 650000.00, 'Actif', 10);

-- ============================================================
-- 7. DOSSIERS EMPLOYES (15 dossiers avec JSON)
-- ============================================================
INSERT INTO DossierEmploye (id_employe, details, date_creation)
VALUES (1,
        '{"situation_familiale": "Marie", "nombre_enfants": 3, "contact_urgence": {"nom": "RAKOTO Mirana", "telephone": "+261 34 00 100 01"}, "documents": ["CIN", "Diplome Master GRH", "Certificat travail"], "competences": ["Management", "Droit du travail", "Recrutement"], "langues": ["Malagasy", "Francais", "Anglais"], "numero_cin": "101 012 345 678", "nationalite": "Malagasy"}',
        '2020-01-15'),
       (2,
        '{"situation_familiale": "Marie", "nombre_enfants": 2, "contact_urgence": {"nom": "ANDRIANARISOA Vola", "telephone": "+261 33 00 200 02"}, "documents": ["CIN", "Diplome Ingenieur Info", "Certifications AWS"], "competences": ["Java", "Python", "Cloud", "DevOps", "Management"], "langues": ["Malagasy", "Francais", "Anglais"], "numero_cin": "101 023 456 789", "nationalite": "Malagasy"}',
        '2020-01-15'),
       (3,
        '{"situation_familiale": "Celibataire", "nombre_enfants": 0, "contact_urgence": {"nom": "RAZAFINDRAKOTO Jean", "telephone": "+261 34 00 300 03"}, "documents": ["CIN", "Diplome DESCF", "Certificat Expert Comptable"], "competences": ["Comptabilite", "Fiscalite malgache", "Audit", "SAP"], "langues": ["Malagasy", "Francais", "Anglais"], "numero_cin": "101 034 567 890", "nationalite": "Malagasy"}',
        '2020-01-15'),
       (4,
        '{"situation_familiale": "Marie", "nombre_enfants": 4, "contact_urgence": {"nom": "RAHERIMANDIMBY Noro", "telephone": "+261 32 00 400 04"}, "documents": ["CIN", "Diplome Commerce", "Permis de conduire"], "competences": ["Negociation", "Vente B2B", "CRM", "Management equipe"], "langues": ["Malagasy", "Francais"], "numero_cin": "101 045 678 901", "nationalite": "Malagasy"}',
        '2020-02-01'),
       (5,
        '{"situation_familiale": "Marie", "nombre_enfants": 1, "contact_urgence": {"nom": "RANDRIANASOLO Fanja", "telephone": "+261 33 00 500 05"}, "documents": ["CIN", "Diplome Logistique", "Certificat Supply Chain"], "competences": ["Supply Chain", "Gestion stocks", "Transport", "ERP"], "langues": ["Malagasy", "Francais", "Anglais"], "numero_cin": "101 056 789 012", "nationalite": "Malagasy"}',
        '2020-03-01'),
       (6,
        '{"situation_familiale": "Celibataire", "nombre_enfants": 0, "contact_urgence": {"nom": "RATSIMBAZAFY Haja", "telephone": "+261 34 00 600 06"}, "documents": ["CIN", "Diplome Marketing", "Certificat Digital Marketing"], "competences": ["Marketing digital", "SEO", "Publicite", "Strategie"], "langues": ["Malagasy", "Francais", "Anglais"], "numero_cin": "101 067 890 123", "nationalite": "Malagasy"}',
        '2021-06-01'),
       (7,
        '{"situation_familiale": "Celibataire", "nombre_enfants": 0, "contact_urgence": {"nom": "RABEARIVELO Mana", "telephone": "+261 34 12 700 07"}, "documents": ["CIN", "Diplome Licence Info", "Portfolio web"], "competences": ["React", "Node.js", "PostgreSQL", "TypeScript"], "langues": ["Malagasy", "Francais", "Anglais"], "numero_cin": "101 078 901 234", "nationalite": "Malagasy"}',
        '2024-07-15'),
       (8,
        '{"situation_familiale": "Marie", "nombre_enfants": 1, "contact_urgence": {"nom": "ANDRIAMAHEFA Rivo", "telephone": "+261 32 45 800 08"}, "documents": ["CIN", "Diplome Ingenieur Info", "Certifications Java"], "competences": ["Java", "Spring Boot", "React", "Docker", "CI/CD"], "langues": ["Malagasy", "Francais", "Anglais"], "numero_cin": "101 089 012 345", "nationalite": "Malagasy"}',
        '2024-07-15'),
       (9,
        '{"situation_familiale": "Celibataire", "nombre_enfants": 0, "contact_urgence": {"nom": "RASOANAIVO Bema", "telephone": "+261 33 22 900 09"}, "documents": ["CIN", "Diplome Master GRH"], "competences": ["Administration", "Recrutement", "Paie", "Excel"], "langues": ["Malagasy", "Francais"], "numero_cin": "101 090 123 456", "nationalite": "Malagasy"}',
        '2024-08-01'),
       (10,
        '{"situation_familiale": "Celibataire", "nombre_enfants": 0, "contact_urgence": {"nom": "RAZAFINDRABE Haja", "telephone": "+261 34 67 100 10"}, "documents": ["CIN", "Diplome Master Finance", "Certificat comptable"], "competences": ["Comptabilite", "Sage", "Excel avance", "Fiscalite"], "langues": ["Malagasy", "Francais"], "numero_cin": "101 101 234 567", "nationalite": "Malagasy"}',
        '2024-08-15'),
       (11,
        '{"situation_familiale": "Marie", "nombre_enfants": 2, "contact_urgence": {"nom": "RAKOTONIRINA Vero", "telephone": "+261 33 89 110 11"}, "documents": ["CIN", "Diplome Licence Commerce", "Permis conduire"], "competences": ["Vente terrain", "Prospection", "Negociation"], "langues": ["Malagasy", "Francais"], "numero_cin": "101 112 345 678", "nationalite": "Malagasy"}',
        '2024-09-01'),
       (12,
        '{"situation_familiale": "Celibataire", "nombre_enfants": 0, "contact_urgence": {"nom": "RAHERIMANANTSOA Solo", "telephone": "+261 34 11 120 12"}, "documents": ["CIN", "Diplome BTS Commerce"], "competences": ["Vente", "Service client", "Marketing terrain"], "langues": ["Malagasy", "Francais"], "numero_cin": "101 123 456 789", "nationalite": "Malagasy"}',
        '2024-09-01'),
       (13,
        '{"situation_familiale": "Marie", "nombre_enfants": 3, "contact_urgence": {"nom": "RANDRIANARIVONY Nirina", "telephone": "+261 32 33 130 13"}, "documents": ["CIN", "Diplome Master Info", "Certif Linux LPIC", "Certif Windows Server"], "competences": ["Linux", "Windows Server", "Virtualisation", "Securite", "Reseaux"], "langues": ["Malagasy", "Francais", "Anglais"], "numero_cin": "101 134 567 890", "nationalite": "Malagasy"}',
        '2024-10-15'),
       (14,
        '{"situation_familiale": "Marie", "nombre_enfants": 2, "contact_urgence": {"nom": "RAVALOMANANA Zo", "telephone": "+261 33 77 140 14"}, "documents": ["CIN", "Diplome Ingenieur Logistique", "Certificat Supply Chain"], "competences": ["Logistique", "Supply Chain", "Management", "SAP"], "langues": ["Malagasy", "Francais", "Anglais"], "numero_cin": "101 145 678 901", "nationalite": "Malagasy"}',
        '2024-11-01'),
       (15,
        '{"situation_familiale": "Celibataire", "nombre_enfants": 0, "contact_urgence": {"nom": "ANDRIANJAFY Mino", "telephone": "+261 34 99 150 15"}, "documents": ["CIN", "Diplome BTS Communication"], "competences": ["Reseaux sociaux", "Creation contenu", "Canva", "Photoshop"], "langues": ["Malagasy", "Francais"], "numero_cin": "101 156 789 012", "nationalite": "Malagasy"}',
        '2024-11-15');

-- ============================================================
-- 8. PERFORMANCES (evaluations trimestrielles)
-- ============================================================
INSERT INTO Performance (id_employe, date_evaluation, periode, note_globale, objectifs_atteints, commentaire,
                         evaluateur, recommandation)
VALUES
-- T3 2024
(7, '2024-09-30', 'T3 2024', 15.50, 78, 'Bonne integration, code de qualite', 'ANDRIANARISOA Faly', 'Maintien'),
(8, '2024-09-30', 'T3 2024', 17.00, 90, 'Excellent travail, leadership technique', 'ANDRIANARISOA Faly', 'Promotion'),
(9, '2024-09-30', 'T3 2024', 14.00, 70, 'Bonne prise en main du poste', 'RAKOTO Hery', 'Formation'),
(10, '2024-09-30', 'T3 2024', 13.50, 65, 'Performance correcte, amelioration possible', 'RAZAFINDRAKOTO Miora',
 'Formation'),
(11, '2024-09-30', 'T3 2024', 12.00, 55, 'Debut encourageant, objectifs partiellement atteints', 'RAHERIMANDIMBY Tiana',
 'Formation'),
(12, '2024-09-30', 'T3 2024', 11.50, 50, 'Necessite plus d accompagnement', 'RAHERIMANDIMBY Tiana', 'Formation'),
-- T4 2024
(1, '2024-12-31', 'T4 2024', 17.50, 92, 'Excellent management RH, recrutements reussis', 'Direction Generale',
 'Maintien'),
(2, '2024-12-31', 'T4 2024', 18.00, 95, 'Infrastructure IT stable, equipe performante', 'Direction Generale',
 'Promotion'),
(3, '2024-12-31', 'T4 2024', 16.50, 88, 'Bonne gestion financiere, rapports precis', 'Direction Generale', 'Maintien'),
(4, '2024-12-31', 'T4 2024', 15.00, 80, 'Objectifs commerciaux atteints a 80%', 'Direction Generale', 'Maintien'),
(5, '2024-12-31', 'T4 2024', 16.00, 85, 'Logistique bien geree, peu de retards', 'Direction Generale', 'Maintien'),
(6, '2024-12-31', 'T4 2024', 15.50, 82, 'Bonne strategie marketing, ROI positif', 'Direction Generale', 'Maintien'),
(7, '2024-12-31', 'T4 2024', 16.00, 82, 'Progression notable, projets livres a temps', 'ANDRIANARISOA Faly',
 'Maintien'),
(8, '2024-12-31', 'T4 2024', 17.50, 93, 'Performance exceptionnelle, mentor pour juniors', 'ANDRIANARISOA Faly',
 'Promotion'),
(9, '2024-12-31', 'T4 2024', 15.00, 75, 'Amelioration par rapport au T3', 'RAKOTO Hery', 'Maintien'),
(10, '2024-12-31', 'T4 2024', 14.50, 72, 'Progression constante', 'RAZAFINDRAKOTO Miora', 'Maintien'),
(11, '2024-12-31', 'T4 2024', 14.00, 70, 'Bonne progression commerciale', 'RAHERIMANDIMBY Tiana', 'Maintien'),
(12, '2024-12-31', 'T4 2024', 13.00, 62, 'Amelioration mais encore des efforts a faire', 'RAHERIMANDIMBY Tiana',
 'Formation'),
(13, '2024-12-31', 'T4 2024', 17.00, 90, 'Infrastructure stable, zero incident majeur', 'ANDRIANARISOA Faly',
 'Maintien'),
(14, '2024-12-31', 'T4 2024', 16.00, 84, 'Bonne organisation logistique', 'RANDRIANASOLO Vonjy', 'Maintien'),
(15, '2024-12-31', 'T4 2024', 14.50, 73, 'Bonne gestion reseaux sociaux, engagement en hausse', 'RATSIMBAZAFY Lova',
 'Maintien'),
-- T1 2025
(1, '2025-03-31', 'T1 2025', 17.00, 90, 'Plan de formation lance avec succes', 'Direction Generale', 'Maintien'),
(2, '2025-03-31', 'T1 2025', 17.50, 93, 'Migration cloud reussie', 'Direction Generale', 'Maintien'),
(3, '2025-03-31', 'T1 2025', 16.00, 85, 'Budget respecte, previsions precises', 'Direction Generale', 'Maintien'),
(4, '2025-03-31', 'T1 2025', 15.50, 82, 'Nouveaux clients acquis zone Nord', 'Direction Generale', 'Maintien'),
(5, '2025-03-31', 'T1 2025', 16.50, 87, 'Optimisation chaine logistique', 'Direction Generale', 'Promotion'),
(6, '2025-03-31', 'T1 2025', 16.00, 84, 'Campagne digitale reussie', 'Direction Generale', 'Maintien'),
(7, '2025-03-31', 'T1 2025', 16.50, 85, 'Projets web livres avec qualite', 'ANDRIANARISOA Faly', 'Maintien'),
(8, '2025-03-31', 'T1 2025', 18.00, 95, 'Leader technique, mentoring actif', 'ANDRIANARISOA Faly', 'Promotion'),
(9, '2025-03-31', 'T1 2025', 15.50, 78, 'Gestion administrative efficace', 'RAKOTO Hery', 'Maintien'),
(10, '2025-03-31', 'T1 2025', 15.00, 76, 'Rapports financiers ameliores', 'RAZAFINDRAKOTO Miora', 'Maintien'),
(11, '2025-03-31', 'T1 2025', 15.00, 76, 'Objectifs commerciaux en bonne voie', 'RAHERIMANDIMBY Tiana', 'Maintien'),
(12, '2025-03-31', 'T1 2025', 13.50, 66, 'Efforts constants mais resultats insuffisants', 'RAHERIMANDIMBY Tiana',
 'Formation'),
(13, '2025-03-31', 'T1 2025', 17.50, 92, 'Securite renforcee, monitoring ameliore', 'ANDRIANARISOA Faly', 'Maintien'),
(14, '2025-03-31', 'T1 2025', 16.50, 86, 'Gestion optimisee des livraisons', 'RANDRIANASOLO Vonjy', 'Maintien'),
(15, '2025-03-31', 'T1 2025', 15.00, 76, 'Engagement reseaux sociaux +25%', 'RATSIMBAZAFY Lova', 'Maintien');

-- ============================================================
-- 9. CONGES (25 demandes de conge)
-- ============================================================
INSERT INTO Conge (id_employe, type_conge, date_debut, date_fin, nombre_jours, motif, statut, date_demande,
                   approuve_par)
VALUES (1, 'Annuel', '2024-08-12', '2024-08-23', 10, 'Vacances familiales', 'Approuve', '2024-07-15',
        'Direction Generale'),
       (2, 'Annuel', '2024-12-23', '2024-12-31', 7, 'Fetes de fin d annee', 'Approuve', '2024-11-20',
        'Direction Generale'),
       (3, 'Maladie', '2024-10-07', '2024-10-11', 5, 'Grippe severe', 'Approuve', '2024-10-07', 'Direction Generale'),
       (4, 'Annuel', '2024-11-18', '2024-11-22', 5, 'Affaires personnelles', 'Approuve', '2024-10-28',
        'Direction Generale'),
       (5, 'Paternite', '2024-09-02', '2024-09-13', 10, 'Naissance enfant', 'Approuve', '2024-08-20',
        'Direction Generale'),
       (6, 'Annuel', '2025-01-06', '2025-01-10', 5, 'Voyage personnel', 'Approuve', '2024-12-15', 'Direction Generale'),
       (7, 'Annuel', '2024-12-23', '2024-12-27', 5, 'Fetes Noel', 'Approuve', '2024-12-01', 'ANDRIANARISOA Faly'),
       (8, 'Formation', '2024-11-04', '2024-11-08', 5, 'Formation Spring Boot avancee', 'Approuve', '2024-10-15',
        'ANDRIANARISOA Faly'),
       (9, 'Annuel', '2025-01-13', '2025-01-17', 5, 'Repos personnel', 'Approuve', '2024-12-20', 'RAKOTO Hery'),
       (10, 'Maladie', '2025-01-20', '2025-01-22', 3, 'Consultation medicale', 'Approuve', '2025-01-20',
        'RAZAFINDRAKOTO Miora'),
       (11, 'Annuel', '2024-12-30', '2025-01-03', 5, 'Nouvel an', 'Approuve', '2024-12-15', 'RAHERIMANDIMBY Tiana'),
       (12, 'Sans solde', '2025-02-03', '2025-02-07', 5, 'Raisons familiales', 'Approuve', '2025-01-20',
        'RAHERIMANDIMBY Tiana'),
       (13, 'Annuel', '2025-01-27', '2025-01-31', 5, 'Vacances', 'Approuve', '2025-01-10', 'ANDRIANARISOA Faly'),
       (14, 'Annuel', '2025-02-10', '2025-02-14', 5, 'Affaires personnelles', 'Approuve', '2025-01-28',
        'RANDRIANASOLO Vonjy'),
       (15, 'Maladie', '2025-02-17', '2025-02-18', 2, 'Migraine', 'Approuve', '2025-02-17', 'RATSIMBAZAFY Lova'),
       (1, 'Annuel', '2025-03-17', '2025-03-21', 5, 'Repos', 'En attente', '2025-03-01', NULL),
       (7, 'Annuel', '2025-04-07', '2025-04-11', 5, 'Vacances Paques', 'En attente', '2025-03-01', NULL),
       (3, 'Annuel', '2025-04-14', '2025-04-18', 5, 'Repos planifie', 'Approuve', '2025-03-01', 'Direction Generale'),
       (8, 'Annuel', '2025-03-24', '2025-03-28', 5, 'Deplacement familial', 'Approuve', '2025-03-05',
        'ANDRIANARISOA Faly'),
       (11, 'Exceptionnel', '2025-02-24', '2025-02-25', 2, 'Mariage proche parent', 'Approuve', '2025-02-17',
        'RAHERIMANDIMBY Tiana'),
       (4, 'Annuel', '2025-03-10', '2025-03-14', 5, 'Vacances', 'Approuve', '2025-02-20', 'Direction Generale'),
       (9, 'Annuel', '2025-04-21', '2025-04-25', 5, 'Repos', 'En attente', '2025-03-05', NULL),
       (5, 'Annuel', '2025-03-03', '2025-03-07', 5, 'Repos familial', 'Approuve', '2025-02-15', 'Direction Generale'),
       (14, 'Maladie', '2025-03-03', '2025-03-04', 2, 'Consultation', 'Approuve', '2025-03-03', 'RANDRIANASOLO Vonjy'),
       (12, 'Annuel', '2025-04-14', '2025-04-18', 5, 'Vacances', 'En attente', '2025-03-05', NULL);

-- ============================================================
-- 10. ABSENCES (20 absences)
-- ============================================================
INSERT INTO Absence (id_employe, date_absence, type_absence, motif, duree_heures, justificatif)
VALUES (11, '2024-09-16', 'Retard', 'Embouteillage route nationale', 1.50, FALSE),
       (12, '2024-09-23', 'Injustifiee', NULL, 8.00, FALSE),
       (11, '2024-10-08', 'Retard', 'Probleme transport', 2.00, FALSE),
       (7, '2024-10-14', 'Justifiee', 'Rendez-vous medical', 4.00, TRUE),
       (9, '2024-10-21', 'Retard', 'Panne vehicule', 1.00, FALSE),
       (12, '2024-11-04', 'Retard', 'Retard taxi-brousse', 2.50, FALSE),
       (10, '2024-11-18', 'Maladie', 'Gastro-enterite', 8.00, TRUE),
       (15, '2024-12-02', 'Retard', 'Embouteillage', 0.50, FALSE),
       (11, '2024-12-09', 'Justifiee', 'Convocation administrative', 4.00, TRUE),
       (8, '2024-12-16', 'Retard', 'Intemperies', 1.00, FALSE),
       (12, '2025-01-06', 'Injustifiee', NULL, 8.00, FALSE),
       (7, '2025-01-13', 'Retard', 'Transport defaillant', 1.50, FALSE),
       (14, '2025-01-20', 'Justifiee', 'Accompagnement enfant malade', 4.00, TRUE),
       (11, '2025-01-27', 'Retard', 'Retard bus', 1.00, FALSE),
       (15, '2025-02-03', 'Retard', 'Embouteillage matin', 0.50, FALSE),
       (9, '2025-02-10', 'Justifiee', 'Demarches administratives', 4.00, TRUE),
       (12, '2025-02-17', 'Retard', 'Pluie forte', 2.00, FALSE),
       (10, '2025-02-24', 'Retard', 'Accident route bloquee', 1.50, FALSE),
       (13, '2025-03-03', 'Justifiee', 'Visite medicale periodique', 3.00, TRUE),
       (7, '2025-03-05', 'Retard', 'Embouteillage Ivandry', 1.00, FALSE);

-- ============================================================
-- 11. FORMATIONS (15 formations)
-- ============================================================
INSERT INTO Formation (id_employe, titre, description, organisme, date_debut, date_fin, duree_heures, cout, statut,
                       certification, note_obtenue)
VALUES (7, 'React Avance et TypeScript', 'Formation approfondie React hooks, context, TypeScript',
        'Digital Academy Madagascar', '2024-08-19', '2024-08-23', 40, 500000, 'Terminee', TRUE, 16.00),
       (8, 'Spring Boot Microservices', 'Architecture microservices avec Spring Boot et Docker', 'IT Training Tana',
        '2024-11-04', '2024-11-08', 40, 800000, 'Terminee', TRUE, 18.00),
       (9, 'Gestion de la Paie Madagascar', 'Formation paie et legislation du travail malgache', 'ISCAM', '2024-09-09',
        '2024-09-13', 35, 400000, 'Terminee', TRUE, 15.00),
       (10, 'Excel Avance et Power BI', 'Formation reporting financier et tableaux de bord', 'Microsoft Partner Tana',
        '2024-10-14', '2024-10-18', 30, 350000, 'Terminee', TRUE, 14.00),
       (11, 'Techniques de Vente B2B', 'Vente consultative et negociation commerciale', 'Sales Academy MG',
        '2024-10-07', '2024-10-09', 24, 300000, 'Terminee', FALSE, 13.50),
       (12, 'Service Client et Fidelisation', 'Techniques de fidelisation et gestion reclamations', 'Sales Academy MG',
        '2024-10-10', '2024-10-11', 16, 200000, 'Terminee', FALSE, 12.00),
       (13, 'Securite Informatique', 'Cybersecurite et protection des systemes', 'CyberSec Madagascar', '2024-11-18',
        '2024-11-22', 40, 900000, 'Terminee', TRUE, 17.50),
       (14, 'Gestion de Stock SAP', 'Module SAP MM et WM pour logistique', 'SAP Partner Tana', '2024-12-02',
        '2024-12-06', 40, 1200000, 'Terminee', TRUE, 16.00),
       (15, 'Marketing Digital', 'SEO, SEA, reseaux sociaux et analytics', 'Digital Academy Madagascar', '2024-12-09',
        '2024-12-13', 40, 450000, 'Terminee', TRUE, 14.50),
       (1, 'Leadership et Management RH', 'Management strategique des ressources humaines', 'ISCAM', '2025-01-13',
        '2025-01-17', 35, 600000, 'Terminee', FALSE, 17.00),
       (2, 'Cloud AWS Solutions Architect', 'Preparation certification AWS Solutions Architect',
        'AWS Partner Madagascar', '2025-02-03', '2025-02-07', 40, 1500000, 'Terminee', TRUE, 18.50),
       (7, 'Node.js et API REST', 'Developpement API performantes avec Node.js', 'Digital Academy Madagascar',
        '2025-02-17', '2025-02-21', 40, 500000, 'Terminee', TRUE, 15.50),
       (11, 'CRM et Gestion Pipeline', 'Utilisation CRM pour optimisation ventes', 'Sales Academy MG', '2025-02-10',
        '2025-02-12', 24, 300000, 'Terminee', FALSE, 14.00),
       (3, 'Normes IFRS et Reporting', 'Normes comptables internationales et reporting', 'ISCAM', '2025-03-03',
        '2025-03-07', 35, 700000, 'En cours', FALSE, NULL),
       (9, 'Droit du Travail Madagascar', 'Actualites juridiques et droit social malgache', 'Barreau Antananarivo',
        '2025-03-10', '2025-03-14', 30, 350000, 'Planifiee', FALSE, NULL);

-- ============================================================
-- 12. HORAIRES (horaires standards par employe, Lundi-Vendredi)
-- ============================================================
-- Employes Lundi-Vendredi 08:00-17:00 (standard)
INSERT INTO Horaire (id_employe, jour_semaine, heure_debut, heure_fin, pause_minutes, actif)
SELECT e.id_employe, j.jour, '08:00'::TIME, '17:00'::TIME, 60, TRUE
FROM Employe e
         CROSS JOIN (VALUES ('Lundi'), ('Mardi'), ('Mercredi'), ('Jeudi'), ('Vendredi')) AS j(jour)
WHERE e.id_employe IN (1, 2, 3, 4, 5, 6, 9, 10);

-- IT staff: horaires flexibles 09:00-18:00
INSERT INTO Horaire (id_employe, jour_semaine, heure_debut, heure_fin, pause_minutes, actif)
SELECT e.id_employe, j.jour, '09:00'::TIME, '18:00'::TIME, 60, TRUE
FROM Employe e
         CROSS JOIN (VALUES ('Lundi'), ('Mardi'), ('Mercredi'), ('Jeudi'), ('Vendredi')) AS j(jour)
WHERE e.id_employe IN (7, 8, 13);

-- Commerciaux: 08:00-17:00 + Samedi matin
INSERT INTO Horaire (id_employe, jour_semaine, heure_debut, heure_fin, pause_minutes, actif)
SELECT e.id_employe, j.jour, '08:00'::TIME, '17:00'::TIME, 60, TRUE
FROM Employe e
         CROSS JOIN (VALUES ('Lundi'), ('Mardi'), ('Mercredi'), ('Jeudi'), ('Vendredi')) AS j(jour)
WHERE e.id_employe IN (11, 12);

INSERT INTO Horaire (id_employe, jour_semaine, heure_debut, heure_fin, pause_minutes, actif)
VALUES (11, 'Samedi', '08:00', '12:00', 0, TRUE),
       (12, 'Samedi', '08:00', '12:00', 0, TRUE);

-- Logistique: 07:00-16:00
INSERT INTO Horaire (id_employe, jour_semaine, heure_debut, heure_fin, pause_minutes, actif)
SELECT e.id_employe, j.jour, '07:00'::TIME, '16:00'::TIME, 60, TRUE
FROM Employe e
         CROSS JOIN (VALUES ('Lundi'), ('Mardi'), ('Mercredi'), ('Jeudi'), ('Vendredi')) AS j(jour)
WHERE e.id_employe IN (14);

-- Community Manager: 09:00-18:00
INSERT INTO Horaire (id_employe, jour_semaine, heure_debut, heure_fin, pause_minutes, actif)
SELECT e.id_employe, j.jour, '09:00'::TIME, '18:00'::TIME, 60, TRUE
FROM Employe e
         CROSS JOIN (VALUES ('Lundi'), ('Mardi'), ('Mercredi'), ('Jeudi'), ('Vendredi')) AS j(jour)
WHERE e.id_employe IN (15);

-- ============================================================
-- 13. PRESENCES (donnees sur 3 mois : Janvier-Fevrier-Mars 2025)
-- Generation dynamique pour chaque employe, jours ouvrables
-- ============================================================

-- Janvier 2025 - Presences
INSERT INTO Presence (id_employe, date_presence, heure_arrivee, heure_depart, heures_travaillees, statut, commentaire)
VALUES
-- Semaine 1 Janvier (6-10)
(1, '2025-01-06', '07:55', '17:05', 8.00, 'Present', NULL),
(2, '2025-01-06', '07:50', '17:10', 8.00, 'Present', NULL),
(3, '2025-01-06', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-01-06', '07:58', '17:02', 8.00, 'Present', NULL),
(5, '2025-01-06', '08:05', '17:00', 8.00, 'Present', NULL),
(6, '2025-01-06', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(7, '2025-01-06', '08:55', '18:05', 8.00, 'Present', NULL),
(8, '2025-01-06', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-01-06', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-01-06', '08:10', '17:00', 7.50, 'Present', NULL),
(11, '2025-01-06', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-01-06', NULL, NULL, 0, 'Absent', 'Absence injustifiee'),
(13, '2025-01-06', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-01-06', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-01-06', '09:00', '18:00', 8.00, 'Present', NULL),

(1, '2025-01-07', '07:58', '17:00', 8.00, 'Present', NULL),
(2, '2025-01-07', '07:52', '17:08', 8.00, 'Present', NULL),
(3, '2025-01-07', '08:02', '17:05', 8.00, 'Present', NULL),
(4, '2025-01-07', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-01-07', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-01-07', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(7, '2025-01-07', '09:05', '18:10', 8.00, 'Present', NULL),
(8, '2025-01-07', '08:58', '18:05', 8.00, 'Present', NULL),
(9, '2025-01-07', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-01-07', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-01-07', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-01-07', '08:15', '17:00', 7.75, 'Retard', 'Retard 15 min'),
(13, '2025-01-07', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-01-07', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-01-07', '09:00', '18:00', 8.00, 'Present', NULL),

(1, '2025-01-08', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-01-08', '07:55', '17:00', 8.00, 'Present', NULL),
(3, '2025-01-08', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-01-08', '07:55', '17:05', 8.00, 'Present', NULL),
(5, '2025-01-08', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-01-08', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(7, '2025-01-08', '09:00', '18:00', 8.00, 'Present', NULL),
(8, '2025-01-08', '09:00', '18:30', 8.50, 'Present', 'Heures sup'),
(9, '2025-01-08', '08:05', '17:00', 8.00, 'Present', NULL),
(10, '2025-01-08', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-01-08', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-01-08', '08:00', '17:00', 8.00, 'Present', NULL),
(13, '2025-01-08', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-01-08', '07:05', '16:00', 8.00, 'Present', NULL),
(15, '2025-01-08', '09:00', '18:00', 8.00, 'Present', NULL),

(1, '2025-01-09', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-01-09', '07:48', '17:15', 8.00, 'Present', NULL),
(3, '2025-01-09', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-01-09', '08:00', '17:30', 8.50, 'Present', 'Reunion tardive'),
(5, '2025-01-09', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-01-09', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(7, '2025-01-09', '09:00', '18:00', 8.00, 'Present', NULL),
(8, '2025-01-09', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-01-09', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-01-09', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-01-09', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-01-09', '08:00', '17:00', 8.00, 'Present', NULL),
(13, '2025-01-09', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-01-09', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-01-09', '09:10', '18:00', 7.50, 'Retard', 'Retard 10 min'),

(1, '2025-01-10', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-01-10', '07:55', '17:00', 8.00, 'Present', NULL),
(3, '2025-01-10', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-01-10', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-01-10', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-01-10', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(7, '2025-01-10', '09:00', '18:00', 8.00, 'Present', NULL),
(8, '2025-01-10', '09:00', '19:00', 9.00, 'Present', 'Deploiement production'),
(9, '2025-01-10', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-01-10', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-01-10', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-01-10', '08:00', '17:00', 8.00, 'Present', NULL),
(13, '2025-01-10', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-01-10', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-01-10', '09:00', '18:00', 8.00, 'Present', NULL),

-- Semaine 2 Janvier (13-17)
(1, '2025-01-13', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-01-13', '07:50', '17:10', 8.00, 'Present', NULL),
(3, '2025-01-13', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-01-13', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-01-13', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-01-13', '08:00', '17:00', 8.00, 'Present', NULL),
(7, '2025-01-13', '09:20', '18:00', 7.50, 'Retard', 'Embouteillage'),
(8, '2025-01-13', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-01-13', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(10, '2025-01-13', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-01-13', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-01-13', '08:00', '17:00', 8.00, 'Present', NULL),
(13, '2025-01-13', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-01-13', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-01-13', '09:00', '18:00', 8.00, 'Present', NULL),

(1, '2025-01-14', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-01-14', '07:55', '17:00', 8.00, 'Present', NULL),
(3, '2025-01-14', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-01-14', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-01-14', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-01-14', '08:00', '17:00', 8.00, 'Present', NULL),
(7, '2025-01-14', '09:00', '18:00', 8.00, 'Present', NULL),
(8, '2025-01-14', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-01-14', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(10, '2025-01-14', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-01-14', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-01-14', '08:00', '17:00', 8.00, 'Present', NULL),
(13, '2025-01-14', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-01-14', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-01-14', '09:00', '18:00', 8.00, 'Present', NULL),

(1, '2025-01-15', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-01-15', '08:00', '17:00', 8.00, 'Present', NULL),
(3, '2025-01-15', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-01-15', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-01-15', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-01-15', '08:00', '17:00', 8.00, 'Present', NULL),
(7, '2025-01-15', '09:00', '18:30', 8.50, 'Present', 'Heures sup debug'),
(8, '2025-01-15', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-01-15', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(10, '2025-01-15', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-01-15', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-01-15', '08:00', '17:00', 8.00, 'Present', NULL),
(13, '2025-01-15', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-01-15', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-01-15', '09:00', '18:00', 8.00, 'Present', NULL),

-- Fevrier 2025 (echantillon semaine 1: 3-7 Fevrier)
(1, '2025-02-03', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-02-03', '07:55', '17:05', 8.00, 'Present', NULL),
(3, '2025-02-03', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-02-03', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-02-03', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-02-03', '08:00', '17:00', 8.00, 'Present', NULL),
(7, '2025-02-03', '09:00', '18:00', 8.00, 'Present', NULL),
(8, '2025-02-03', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-02-03', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-02-03', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-02-03', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-02-03', NULL, NULL, 0, 'Conge', 'Conge sans solde'),
(13, '2025-02-03', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-02-03', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-02-03', '09:05', '18:00', 7.50, 'Retard', 'Retard 5 min'),

(1, '2025-02-04', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-02-04', '07:50', '17:00', 8.00, 'Present', NULL),
(3, '2025-02-04', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-02-04', '08:00', '17:30', 8.50, 'Present', 'Reunion client'),
(5, '2025-02-04', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-02-04', '08:00', '17:00', 8.00, 'Present', NULL),
(7, '2025-02-04', '09:00', '18:00', 8.00, 'Present', NULL),
(8, '2025-02-04', '09:00', '19:00', 9.00, 'Present', 'Deploiement urgent'),
(9, '2025-02-04', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-02-04', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-02-04', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-02-04', NULL, NULL, 0, 'Conge', 'Conge sans solde'),
(13, '2025-02-04', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-02-04', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-02-04', '09:00', '18:00', 8.00, 'Present', NULL),

(1, '2025-02-05', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-02-05', '08:00', '17:00', 8.00, 'Present', NULL),
(3, '2025-02-05', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-02-05', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-02-05', '08:00', '17:00', 8.00, 'Present', NULL),
(6, '2025-02-05', '08:00', '17:00', 8.00, 'Present', NULL),
(7, '2025-02-05', '09:00', '18:00', 8.00, 'Present', NULL),
(8, '2025-02-05', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-02-05', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-02-05', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-02-05', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-02-05', NULL, NULL, 0, 'Conge', 'Conge sans solde'),
(13, '2025-02-05', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-02-05', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-02-05', '09:00', '18:00', 8.00, 'Present', NULL),

-- Mars 2025 (echantillon semaine 1: 3-5 Mars)
(1, '2025-03-03', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-03-03', '07:55', '17:05', 8.00, 'Present', NULL),
(3, '2025-03-03', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-03-03', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-03-03', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(6, '2025-03-03', '08:00', '17:00', 8.00, 'Present', NULL),
(7, '2025-03-03', '09:00', '18:00', 8.00, 'Present', NULL),
(8, '2025-03-03', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-03-03', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-03-03', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-03-03', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-03-03', '08:00', '17:00', 8.00, 'Present', NULL),
(13, '2025-03-03', '09:15', '18:00', 7.75, 'Present', 'Visite medicale matin'),
(14, '2025-03-03', NULL, NULL, 0, 'Conge', 'Conge maladie'),
(15, '2025-03-03', '09:00', '18:00', 8.00, 'Present', NULL),

(1, '2025-03-04', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-03-04', '07:50', '17:10', 8.00, 'Present', NULL),
(3, '2025-03-04', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-03-04', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-03-04', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(6, '2025-03-04', '08:00', '17:00', 8.00, 'Present', NULL),
(7, '2025-03-04', '09:00', '18:00', 8.00, 'Present', NULL),
(8, '2025-03-04', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-03-04', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-03-04', '08:00', '17:00', 8.00, 'Present', NULL),
(11, '2025-03-04', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-03-04', '08:00', '17:00', 8.00, 'Present', NULL),
(13, '2025-03-04', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-03-04', NULL, NULL, 0, 'Conge', 'Conge maladie'),
(15, '2025-03-04', '09:00', '18:00', 8.00, 'Present', NULL),

(1, '2025-03-05', '08:00', '17:00', 8.00, 'Present', NULL),
(2, '2025-03-05', '07:55', '17:00', 8.00, 'Present', NULL),
(3, '2025-03-05', '08:00', '17:00', 8.00, 'Present', NULL),
(4, '2025-03-05', '08:00', '17:00', 8.00, 'Present', NULL),
(5, '2025-03-05', NULL, NULL, 0, 'Conge', 'Conge annuel'),
(6, '2025-03-05', '08:00', '17:00', 8.00, 'Present', NULL),
(7, '2025-03-05', '09:15', '18:00', 7.50, 'Retard', 'Embouteillage Ivandry'),
(8, '2025-03-05', '09:00', '18:00', 8.00, 'Present', NULL),
(9, '2025-03-05', '08:00', '17:00', 8.00, 'Present', NULL),
(10, '2025-03-05', '08:15', '17:00', 7.75, 'Retard', 'Accident route'),
(11, '2025-03-05', '08:00', '17:00', 8.00, 'Present', NULL),
(12, '2025-03-05', '08:00', '17:00', 8.00, 'Present', NULL),
(13, '2025-03-05', '09:00', '18:00', 8.00, 'Present', NULL),
(14, '2025-03-05', '07:00', '16:00', 8.00, 'Present', NULL),
(15, '2025-03-05', '09:00', '18:00', 8.00, 'Present', NULL);

-- ============================================================
-- 14. HEURES SUPPLEMENTAIRES (20 entrees)
-- ============================================================
INSERT INTO HeuresSupplementaires (id_employe, date_hs, nombre_heures, motif, taux_majoration, statut, approuve_par,
                                   montant_calcule)
VALUES
-- Salaire horaire = salaire_base / 173.33 (base 40h/semaine)
-- IT-003 Toky: 1500000/173.33 = 8654 Ar/h, x1.5 = 12981
(8, '2024-10-15', 2.00, 'Deploiement application production', 1.50, 'Payee', 'ANDRIANARISOA Faly', 25962.00),
(8, '2024-11-20', 3.00, 'Migration base de donnees', 1.50, 'Payee', 'ANDRIANARISOA Faly', 38943.00),
(8, '2024-12-10', 2.50, 'Correction bug critique', 2.00, 'Payee', 'ANDRIANARISOA Faly', 43270.00),
-- IT-002 Hasina: 1200000/173.33 = 6923 Ar/h
(7, '2024-10-22', 2.00, 'Livraison sprint urgent', 1.50, 'Payee', 'ANDRIANARISOA Faly', 20769.00),
(7, '2025-01-15', 1.50, 'Debug production', 1.50, 'Payee', 'ANDRIANARISOA Faly', 15577.00),
(7, '2025-02-20', 2.00, 'Feature urgente client', 1.50, 'Approuvee', 'ANDRIANARISOA Faly', 20769.00),
-- IT-004 Lanto: 1600000/173.33 = 9231 Ar/h
(13, '2024-11-25', 4.00, 'Maintenance serveur nuit', 2.00, 'Payee', 'ANDRIANARISOA Faly', 73848.00),
(13, '2024-12-20', 3.00, 'Mise a jour securite urgente', 1.50, 'Payee', 'ANDRIANARISOA Faly', 41539.50),
(13, '2025-01-28', 2.00, 'Incident reseau', 2.00, 'Payee', 'ANDRIANARISOA Faly', 36924.00),
(13, '2025-02-25', 3.00, 'Migration cloud', 1.50, 'Approuvee', 'ANDRIANARISOA Faly', 41539.50),
-- COM-002 Ando: 700000/173.33 = 4039 Ar/h
(11, '2024-10-05', 4.00, 'Samedi salon professionnel', 1.50, 'Payee', 'RAHERIMANDIMBY Tiana', 24234.00),
(11, '2024-12-14', 4.00, 'Samedi foire commerciale', 1.50, 'Payee', 'RAHERIMANDIMBY Tiana', 24234.00),
(11, '2025-02-08', 4.00, 'Samedi evenement entreprise', 1.50, 'Approuvee', 'RAHERIMANDIMBY Tiana', 24234.00),
-- LOG-002 Njaka: 1400000/173.33 = 8077 Ar/h
(14, '2024-11-15', 3.00, 'Reception stock urgente', 1.50, 'Payee', 'RANDRIANASOLO Vonjy', 36346.50),
(14, '2024-12-22', 4.00, 'Inventaire fin d annee', 1.50, 'Payee', 'RANDRIANASOLO Vonjy', 48462.00),
(14, '2025-01-30', 2.00, 'Livraison urgente client VIP', 1.50, 'Payee', 'RANDRIANASOLO Vonjy', 24231.00),
(14, '2025-02-28', 3.00, 'Reorganisation entrepot', 1.50, 'Approuvee', 'RANDRIANASOLO Vonjy', 36346.50),
-- Directeurs occasionnels
(1, '2024-12-28', 3.00, 'Cloture annuelle RH', 1.50, 'Payee', 'Direction Generale', 64905.00),
(2, '2024-12-29', 4.00, 'Maintenance annuelle serveurs', 1.50, 'Payee', 'Direction Generale', 96924.00),
(4, '2025-01-25', 3.00, 'Preparation convention vente', 1.50, 'Payee', 'Direction Generale', 55380.00);

-- ============================================================
-- 15. PAIE (3 mois: Janvier, Fevrier 2025 pour 15 employes)
-- Calculs bases sur le systeme fiscal malgache :
-- CNaPS employe: 1% du salaire brut
-- OSTIE employe: 1% du salaire brut
-- IRSA: bareme progressif simplifie
-- ============================================================

-- JANVIER 2025
INSERT INTO Paie (id_employe, mois, annee, salaire_base, heures_sup_montant, primes, salaire_brut, total_deductions,
                  salaire_net, date_paiement, statut)
VALUES (1, 1, 2025, 2500000, 0, 200000, 2700000, 432000, 2268000, '2025-01-31', 'Paye'),
       (2, 1, 2025, 2800000, 0, 250000, 3050000, 518500, 2531500, '2025-01-31', 'Paye'),
       (3, 1, 2025, 2600000, 0, 150000, 2750000, 440000, 2310000, '2025-01-31', 'Paye'),
       (4, 1, 2025, 2400000, 55380, 100000, 2555380, 383307, 2172073, '2025-01-31', 'Paye'),
       (5, 1, 2025, 2200000, 0, 100000, 2300000, 345000, 1955000, '2025-01-31', 'Paye'),
       (6, 1, 2025, 2300000, 0, 100000, 2400000, 360000, 2040000, '2025-01-31', 'Paye'),
       (7, 1, 2025, 1200000, 15577, 50000, 1265577, 151869, 1113708, '2025-01-31', 'Paye'),
       (8, 1, 2025, 1500000, 0, 80000, 1580000, 205400, 1374600, '2025-01-31', 'Paye'),
       (9, 1, 2025, 700000, 0, 30000, 730000, 65700, 664300, '2025-01-31', 'Paye'),
       (10, 1, 2025, 900000, 0, 40000, 940000, 103400, 836600, '2025-01-31', 'Paye'),
       (11, 1, 2025, 700000, 0, 50000, 750000, 67500, 682500, '2025-01-31', 'Paye'),
       (12, 1, 2025, 650000, 0, 0, 650000, 52000, 598000, '2025-01-31', 'Paye'),
       (13, 1, 2025, 1600000, 36924, 80000, 1716924, 231635, 1485289, '2025-01-31', 'Paye'),
       (14, 1, 2025, 1400000, 24231, 60000, 1484231, 192950, 1291281, '2025-01-31', 'Paye'),
       (15, 1, 2025, 650000, 0, 20000, 670000, 53600, 616400, '2025-01-31', 'Paye'),

-- FEVRIER 2025
       (1, 2, 2025, 2500000, 0, 200000, 2700000, 432000, 2268000, '2025-02-28', 'Paye'),
       (2, 2, 2025, 2800000, 0, 250000, 3050000, 518500, 2531500, '2025-02-28', 'Paye'),
       (3, 2, 2025, 2600000, 0, 150000, 2750000, 440000, 2310000, '2025-02-28', 'Paye'),
       (4, 2, 2025, 2400000, 0, 120000, 2520000, 378000, 2142000, '2025-02-28', 'Paye'),
       (5, 2, 2025, 2200000, 0, 100000, 2300000, 345000, 1955000, '2025-02-28', 'Paye'),
       (6, 2, 2025, 2300000, 0, 100000, 2400000, 360000, 2040000, '2025-02-28', 'Paye'),
       (7, 2, 2025, 1200000, 20769, 50000, 1270769, 152492, 1118277, '2025-02-28', 'Paye'),
       (8, 2, 2025, 1500000, 0, 80000, 1580000, 205400, 1374600, '2025-02-28', 'Paye'),
       (9, 2, 2025, 700000, 0, 30000, 730000, 65700, 664300, '2025-02-28', 'Paye'),
       (10, 2, 2025, 900000, 0, 40000, 940000, 103400, 836600, '2025-02-28', 'Paye'),
       (11, 2, 2025, 700000, 24234, 50000, 774234, 69681, 704553, '2025-02-28', 'Paye'),
       (12, 2, 2025, 650000, 0, 0, 650000, 52000, 598000, '2025-02-28', 'Paye'),
       (13, 2, 2025, 1600000, 41539.50, 80000, 1721539.50, 232208, 1489331.50, '2025-02-28', 'Paye'),
       (14, 2, 2025, 1400000, 36346.50, 60000, 1496346.50, 194525, 1301821.50, '2025-02-28', 'Paye'),
       (15, 2, 2025, 650000, 0, 20000, 670000, 53600, 616400, '2025-02-28', 'Paye');

-- ============================================================
-- 16. AVANTAGES SOCIAUX (divers avantages)
-- ============================================================
INSERT INTO AvantageSocial (id_employe, type_avantage, description, montant, date_debut, date_fin, actif)
VALUES
-- Transport
(1, 'Indemnite Transport', 'Indemnite mensuelle de transport', 100000, '2020-01-15', NULL, TRUE),
(2, 'Indemnite Transport', 'Indemnite mensuelle de transport', 100000, '2020-01-15', NULL, TRUE),
(3, 'Indemnite Transport', 'Indemnite mensuelle de transport', 100000, '2020-01-15', NULL, TRUE),
(4, 'Indemnite Transport', 'Indemnite mensuelle de transport', 100000, '2020-02-01', NULL, TRUE),
(5, 'Indemnite Transport', 'Indemnite mensuelle de transport', 100000, '2020-03-01', NULL, TRUE),
(6, 'Indemnite Transport', 'Indemnite mensuelle de transport', 100000, '2021-06-01', NULL, TRUE),
-- Assurance sante
(1, 'Assurance Sante', 'Couverture medicale complementaire famille', 150000, '2020-01-15', NULL, TRUE),
(2, 'Assurance Sante', 'Couverture medicale complementaire famille', 150000, '2020-01-15', NULL, TRUE),
(3, 'Assurance Sante', 'Couverture medicale complementaire', 120000, '2020-01-15', NULL, TRUE),
(4, 'Assurance Sante', 'Couverture medicale complementaire famille', 150000, '2020-02-01', NULL, TRUE),
(5, 'Assurance Sante', 'Couverture medicale complementaire famille', 130000, '2020-03-01', NULL, TRUE),
-- Prime anciennete (employes seniors)
(1, 'Prime Anciennete', '5 ans d anciennete - 5% salaire base', 125000, '2025-01-15', NULL, TRUE),
(2, 'Prime Anciennete', '5 ans d anciennete - 5% salaire base', 140000, '2025-01-15', NULL, TRUE),
(3, 'Prime Anciennete', '5 ans d anciennete - 5% salaire base', 130000, '2025-01-15', NULL, TRUE),
(4, 'Prime Anciennete', '5 ans d anciennete - 5% salaire base', 120000, '2025-02-01', NULL, TRUE),
(5, 'Prime Anciennete', '5 ans d anciennete - 5% salaire base', 110000, '2025-03-01', NULL, TRUE),
-- Telephone
(1, 'Telephone Service', 'Forfait telephone professionnel', 50000, '2020-01-15', NULL, TRUE),
(2, 'Telephone Service', 'Forfait telephone professionnel', 50000, '2020-01-15', NULL, TRUE),
(4, 'Telephone Service', 'Forfait telephone professionnel', 50000, '2020-02-01', NULL, TRUE),
(11, 'Telephone Service', 'Forfait telephone commercial terrain', 80000, '2024-09-01', NULL, TRUE),
(12, 'Telephone Service', 'Forfait telephone commercial terrain', 80000, '2024-09-01', NULL, TRUE),
-- Repas
(7, 'Ticket Restaurant', 'Tickets repas mensuels', 60000, '2024-07-15', NULL, TRUE),
(8, 'Ticket Restaurant', 'Tickets repas mensuels', 60000, '2024-07-15', NULL, TRUE),
(13, 'Ticket Restaurant', 'Tickets repas mensuels', 60000, '2024-10-15', NULL, TRUE),
(14, 'Ticket Restaurant', 'Tickets repas mensuels', 60000, '2024-11-01', NULL, TRUE),
(15, 'Ticket Restaurant', 'Tickets repas mensuels', 60000, '2024-11-15', NULL, TRUE);

-- ============================================================
-- 17. IMPOTS ET DEDUCTIONS (pour chaque paie)
-- Systeme fiscal Madagascar: CNaPS 1%, OSTIE 1%, IRSA progressif
-- ============================================================

-- Janvier 2025
INSERT INTO ImpotDeduction (id_paie, type_deduction, description, montant, pourcentage, obligatoire)
VALUES
-- Employe 1 (Paie id 1): Brut 2700000
(1, 'CNaPS', 'Cotisation CNaPS employe', 27000, 1.00, TRUE),
(1, 'OSTIE', 'Cotisation OSTIE employe', 27000, 1.00, TRUE),
(1, 'IRSA', 'Impot sur les revenus salariaux', 378000, 14.00, TRUE),
-- Employe 2 (Paie id 2): Brut 3050000
(2, 'CNaPS', 'Cotisation CNaPS employe', 30500, 1.00, TRUE),
(2, 'OSTIE', 'Cotisation OSTIE employe', 30500, 1.00, TRUE),
(2, 'IRSA', 'Impot sur les revenus salariaux', 457500, 15.00, TRUE),
-- Employe 3 (Paie id 3): Brut 2750000
(3, 'CNaPS', 'Cotisation CNaPS employe', 27500, 1.00, TRUE),
(3, 'OSTIE', 'Cotisation OSTIE employe', 27500, 1.00, TRUE),
(3, 'IRSA', 'Impot sur les revenus salariaux', 385000, 14.00, TRUE),
-- Employe 4 (Paie id 4): Brut 2555380
(4, 'CNaPS', 'Cotisation CNaPS employe', 25554, 1.00, TRUE),
(4, 'OSTIE', 'Cotisation OSTIE employe', 25554, 1.00, TRUE),
(4, 'IRSA', 'Impot sur les revenus salariaux', 332199, 13.00, TRUE),
-- Employe 5 (Paie id 5): Brut 2300000
(5, 'CNaPS', 'Cotisation CNaPS employe', 23000, 1.00, TRUE),
(5, 'OSTIE', 'Cotisation OSTIE employe', 23000, 1.00, TRUE),
(5, 'IRSA', 'Impot sur les revenus salariaux', 299000, 13.00, TRUE),
-- Employe 6 (Paie id 6): Brut 2400000
(6, 'CNaPS', 'Cotisation CNaPS employe', 24000, 1.00, TRUE),
(6, 'OSTIE', 'Cotisation OSTIE employe', 24000, 1.00, TRUE),
(6, 'IRSA', 'Impot sur les revenus salariaux', 312000, 13.00, TRUE),
-- Employe 7 (Paie id 7): Brut 1265577
(7, 'CNaPS', 'Cotisation CNaPS employe', 12656, 1.00, TRUE),
(7, 'OSTIE', 'Cotisation OSTIE employe', 12656, 1.00, TRUE),
(7, 'IRSA', 'Impot sur les revenus salariaux', 126557, 10.00, TRUE),
-- Employe 8 (Paie id 8): Brut 1580000
(8, 'CNaPS', 'Cotisation CNaPS employe', 15800, 1.00, TRUE),
(8, 'OSTIE', 'Cotisation OSTIE employe', 15800, 1.00, TRUE),
(8, 'IRSA', 'Impot sur les revenus salariaux', 173800, 11.00, TRUE),
-- Employe 9 (Paie id 9): Brut 730000
(9, 'CNaPS', 'Cotisation CNaPS employe', 7300, 1.00, TRUE),
(9, 'OSTIE', 'Cotisation OSTIE employe', 7300, 1.00, TRUE),
(9, 'IRSA', 'Impot sur les revenus salariaux', 51100, 7.00, TRUE),
-- Employe 10 (Paie id 10): Brut 940000
(10, 'CNaPS', 'Cotisation CNaPS employe', 9400, 1.00, TRUE),
(10, 'OSTIE', 'Cotisation OSTIE employe', 9400, 1.00, TRUE),
(10, 'IRSA', 'Impot sur les revenus salariaux', 84600, 9.00, TRUE),
-- Employe 11 (Paie id 11): Brut 750000
(11, 'CNaPS', 'Cotisation CNaPS employe', 7500, 1.00, TRUE),
(11, 'OSTIE', 'Cotisation OSTIE employe', 7500, 1.00, TRUE),
(11, 'IRSA', 'Impot sur les revenus salariaux', 52500, 7.00, TRUE),
-- Employe 12 (Paie id 12): Brut 650000
(12, 'CNaPS', 'Cotisation CNaPS employe', 6500, 1.00, TRUE),
(12, 'OSTIE', 'Cotisation OSTIE employe', 6500, 1.00, TRUE),
(12, 'IRSA', 'Impot sur les revenus salariaux', 39000, 6.00, TRUE),
-- Employe 13 (Paie id 13): Brut 1716924
(13, 'CNaPS', 'Cotisation CNaPS employe', 17169, 1.00, TRUE),
(13, 'OSTIE', 'Cotisation OSTIE employe', 17169, 1.00, TRUE),
(13, 'IRSA', 'Impot sur les revenus salariaux', 197297, 11.49, TRUE),
-- Employe 14 (Paie id 14): Brut 1484231
(14, 'CNaPS', 'Cotisation CNaPS employe', 14842, 1.00, TRUE),
(14, 'OSTIE', 'Cotisation OSTIE employe', 14842, 1.00, TRUE),
(14, 'IRSA', 'Impot sur les revenus salariaux', 163266, 11.00, TRUE),
-- Employe 15 (Paie id 15): Brut 670000
(15, 'CNaPS', 'Cotisation CNaPS employe', 6700, 1.00, TRUE),
(15, 'OSTIE', 'Cotisation OSTIE employe', 6700, 1.00, TRUE),
(15, 'IRSA', 'Impot sur les revenus salariaux', 40200, 6.00, TRUE),

-- Fevrier 2025 (Paie id 16-30)
(16, 'CNaPS', 'Cotisation CNaPS employe', 27000, 1.00, TRUE),
(16, 'OSTIE', 'Cotisation OSTIE employe', 27000, 1.00, TRUE),
(16, 'IRSA', 'Impot sur les revenus salariaux', 378000, 14.00, TRUE),
(17, 'CNaPS', 'Cotisation CNaPS employe', 30500, 1.00, TRUE),
(17, 'OSTIE', 'Cotisation OSTIE employe', 30500, 1.00, TRUE),
(17, 'IRSA', 'Impot sur les revenus salariaux', 457500, 15.00, TRUE),
(18, 'CNaPS', 'Cotisation CNaPS employe', 27500, 1.00, TRUE),
(18, 'OSTIE', 'Cotisation OSTIE employe', 27500, 1.00, TRUE),
(18, 'IRSA', 'Impot sur les revenus salariaux', 385000, 14.00, TRUE),
(19, 'CNaPS', 'Cotisation CNaPS employe', 25200, 1.00, TRUE),
(19, 'OSTIE', 'Cotisation OSTIE employe', 25200, 1.00, TRUE),
(19, 'IRSA', 'Impot sur les revenus salariaux', 327600, 13.00, TRUE),
(20, 'CNaPS', 'Cotisation CNaPS employe', 23000, 1.00, TRUE),
(20, 'OSTIE', 'Cotisation OSTIE employe', 23000, 1.00, TRUE),
(20, 'IRSA', 'Impot sur les revenus salariaux', 299000, 13.00, TRUE),
(21, 'CNaPS', 'Cotisation CNaPS employe', 24000, 1.00, TRUE),
(21, 'OSTIE', 'Cotisation OSTIE employe', 24000, 1.00, TRUE),
(21, 'IRSA', 'Impot sur les revenus salariaux', 312000, 13.00, TRUE),
(22, 'CNaPS', 'Cotisation CNaPS employe', 12708, 1.00, TRUE),
(22, 'OSTIE', 'Cotisation OSTIE employe', 12708, 1.00, TRUE),
(22, 'IRSA', 'Impot sur les revenus salariaux', 127077, 10.00, TRUE),
(23, 'CNaPS', 'Cotisation CNaPS employe', 15800, 1.00, TRUE),
(23, 'OSTIE', 'Cotisation OSTIE employe', 15800, 1.00, TRUE),
(23, 'IRSA', 'Impot sur les revenus salariaux', 173800, 11.00, TRUE),
(24, 'CNaPS', 'Cotisation CNaPS employe', 7300, 1.00, TRUE),
(24, 'OSTIE', 'Cotisation OSTIE employe', 7300, 1.00, TRUE),
(24, 'IRSA', 'Impot sur les revenus salariaux', 51100, 7.00, TRUE),
(25, 'CNaPS', 'Cotisation CNaPS employe', 9400, 1.00, TRUE),
(25, 'OSTIE', 'Cotisation OSTIE employe', 9400, 1.00, TRUE),
(25, 'IRSA', 'Impot sur les revenus salariaux', 84600, 9.00, TRUE),
(26, 'CNaPS', 'Cotisation CNaPS employe', 7742, 1.00, TRUE),
(26, 'OSTIE', 'Cotisation OSTIE employe', 7742, 1.00, TRUE),
(26, 'IRSA', 'Impot sur les revenus salariaux', 54197, 7.00, TRUE),
(27, 'CNaPS', 'Cotisation CNaPS employe', 6500, 1.00, TRUE),
(27, 'OSTIE', 'Cotisation OSTIE employe', 6500, 1.00, TRUE),
(27, 'IRSA', 'Impot sur les revenus salariaux', 39000, 6.00, TRUE),
(28, 'CNaPS', 'Cotisation CNaPS employe', 17215, 1.00, TRUE),
(28, 'OSTIE', 'Cotisation OSTIE employe', 17215, 1.00, TRUE),
(28, 'IRSA', 'Impot sur les revenus salariaux', 197778, 11.49, TRUE),
(29, 'CNaPS', 'Cotisation CNaPS employe', 14963, 1.00, TRUE),
(29, 'OSTIE', 'Cotisation OSTIE employe', 14963, 1.00, TRUE),
(29, 'IRSA', 'Impot sur les revenus salariaux', 164599, 11.00, TRUE),
(30, 'CNaPS', 'Cotisation CNaPS employe', 6700, 1.00, TRUE),
(30, 'OSTIE', 'Cotisation OSTIE employe', 6700, 1.00, TRUE),
(30, 'IRSA', 'Impot sur les revenus salariaux', 40200, 6.00, TRUE);

-- ============================================================
-- 18. BULLETINS DE PAIE (Janvier et Fevrier 2025)
-- ============================================================
INSERT INTO BulletinPaie (id_paie, numero_bulletin, date_emission, periode, details, signe_par, remis)
VALUES (1, 'BP-2025-01-001', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RAKOTO", "prenom": "Hery", "matricule": "RH-001", "poste": "Directeur RH"}, "salaire_base": 2500000, "heures_sup": 0, "primes": 200000, "brut": 2700000, "deductions": [{"type": "CNaPS", "montant": 27000}, {"type": "OSTIE", "montant": 27000}, {"type": "IRSA", "montant": 378000}], "net": 2268000}',
        'Direction Generale', TRUE),
       (2, 'BP-2025-01-002', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "ANDRIANARISOA", "prenom": "Faly", "matricule": "IT-001", "poste": "Directeur IT"}, "salaire_base": 2800000, "heures_sup": 0, "primes": 250000, "brut": 3050000, "deductions": [{"type": "CNaPS", "montant": 30500}, {"type": "OSTIE", "montant": 30500}, {"type": "IRSA", "montant": 457500}], "net": 2531500}',
        'Direction Generale', TRUE),
       (3, 'BP-2025-01-003', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RAZAFINDRAKOTO", "prenom": "Miora", "matricule": "FIN-001", "poste": "Directrice Finance"}, "salaire_base": 2600000, "heures_sup": 0, "primes": 150000, "brut": 2750000, "deductions": [{"type": "CNaPS", "montant": 27500}, {"type": "OSTIE", "montant": 27500}, {"type": "IRSA", "montant": 385000}], "net": 2310000}',
        'Direction Generale', TRUE),
       (4, 'BP-2025-01-004', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RAHERIMANDIMBY", "prenom": "Tiana", "matricule": "COM-001", "poste": "Directeur Commercial"}, "salaire_base": 2400000, "heures_sup": 55380, "primes": 100000, "brut": 2555380, "deductions": [{"type": "CNaPS", "montant": 25554}, {"type": "OSTIE", "montant": 25554}, {"type": "IRSA", "montant": 332199}], "net": 2172073}',
        'Direction Generale', TRUE),
       (5, 'BP-2025-01-005', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RANDRIANASOLO", "prenom": "Vonjy", "matricule": "LOG-001", "poste": "Directeur Logistique"}, "salaire_base": 2200000, "heures_sup": 0, "primes": 100000, "brut": 2300000, "deductions": [{"type": "CNaPS", "montant": 23000}, {"type": "OSTIE", "montant": 23000}, {"type": "IRSA", "montant": 299000}], "net": 1955000}',
        'Direction Generale', TRUE),
       (6, 'BP-2025-01-006', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RATSIMBAZAFY", "prenom": "Lova", "matricule": "MKT-001", "poste": "Directrice Marketing"}, "salaire_base": 2300000, "heures_sup": 0, "primes": 100000, "brut": 2400000, "deductions": [{"type": "CNaPS", "montant": 24000}, {"type": "OSTIE", "montant": 24000}, {"type": "IRSA", "montant": 312000}], "net": 2040000}',
        'Direction Generale', TRUE),
       (7, 'BP-2025-01-007', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RABEARIVELO", "prenom": "Hasina", "matricule": "IT-002", "poste": "Developpeur Web"}, "salaire_base": 1200000, "heures_sup": 15577, "primes": 50000, "brut": 1265577, "deductions": [{"type": "CNaPS", "montant": 12656}, {"type": "OSTIE", "montant": 12656}, {"type": "IRSA", "montant": 126557}], "net": 1113708}',
        'ANDRIANARISOA Faly', TRUE),
       (8, 'BP-2025-01-008', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "ANDRIAMAHEFA", "prenom": "Toky", "matricule": "IT-003", "poste": "Developpeur Senior"}, "salaire_base": 1500000, "heures_sup": 0, "primes": 80000, "brut": 1580000, "deductions": [{"type": "CNaPS", "montant": 15800}, {"type": "OSTIE", "montant": 15800}, {"type": "IRSA", "montant": 173800}], "net": 1374600}',
        'ANDRIANARISOA Faly', TRUE),
       (9, 'BP-2025-01-009', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RASOANAIVO", "prenom": "Volatiana", "matricule": "RH-002", "poste": "Assistante RH"}, "salaire_base": 700000, "heures_sup": 0, "primes": 30000, "brut": 730000, "deductions": [{"type": "CNaPS", "montant": 7300}, {"type": "OSTIE", "montant": 7300}, {"type": "IRSA", "montant": 51100}], "net": 664300}',
        'RAKOTO Hery', TRUE),
       (10, 'BP-2025-01-010', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RAZAFINDRABE", "prenom": "Nomena", "matricule": "FIN-002", "poste": "Comptable"}, "salaire_base": 900000, "heures_sup": 0, "primes": 40000, "brut": 940000, "deductions": [{"type": "CNaPS", "montant": 9400}, {"type": "OSTIE", "montant": 9400}, {"type": "IRSA", "montant": 84600}], "net": 836600}',
        'RAZAFINDRAKOTO Miora', TRUE),
       (11, 'BP-2025-01-011', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RAKOTONIRINA", "prenom": "Ando", "matricule": "COM-002", "poste": "Commercial Terrain"}, "salaire_base": 700000, "heures_sup": 0, "primes": 50000, "brut": 750000, "deductions": [{"type": "CNaPS", "montant": 7500}, {"type": "OSTIE", "montant": 7500}, {"type": "IRSA", "montant": 52500}], "net": 682500}',
        'RAHERIMANDIMBY Tiana', TRUE),
       (12, 'BP-2025-01-012', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RAHERIMANANTSOA", "prenom": "Fara", "matricule": "COM-003", "poste": "Commerciale Terrain"}, "salaire_base": 650000, "heures_sup": 0, "primes": 0, "brut": 650000, "deductions": [{"type": "CNaPS", "montant": 6500}, {"type": "OSTIE", "montant": 6500}, {"type": "IRSA", "montant": 39000}], "net": 598000}',
        'RAHERIMANDIMBY Tiana', TRUE),
       (13, 'BP-2025-01-013', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RANDRIANARIVONY", "prenom": "Lanto", "matricule": "IT-004", "poste": "Administrateur Systeme"}, "salaire_base": 1600000, "heures_sup": 36924, "primes": 80000, "brut": 1716924, "deductions": [{"type": "CNaPS", "montant": 17169}, {"type": "OSTIE", "montant": 17169}, {"type": "IRSA", "montant": 197297}], "net": 1485289}',
        'ANDRIANARISOA Faly', TRUE),
       (14, 'BP-2025-01-014', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "RAVALOMANANA", "prenom": "Njaka", "matricule": "LOG-002", "poste": "Responsable Logistique"}, "salaire_base": 1400000, "heures_sup": 24231, "primes": 60000, "brut": 1484231, "deductions": [{"type": "CNaPS", "montant": 14842}, {"type": "OSTIE", "montant": 14842}, {"type": "IRSA", "montant": 163266}], "net": 1291281}',
        'RANDRIANASOLO Vonjy', TRUE),
       (15, 'BP-2025-01-015', '2025-01-31', 'Janvier 2025',
        '{"employe": {"nom": "ANDRIANJAFY", "prenom": "Soa", "matricule": "MKT-002", "poste": "Community Manager"}, "salaire_base": 650000, "heures_sup": 0, "primes": 20000, "brut": 670000, "deductions": [{"type": "CNaPS", "montant": 6700}, {"type": "OSTIE", "montant": 6700}, {"type": "IRSA", "montant": 40200}], "net": 616400}',
        'RATSIMBAZAFY Lova', TRUE),

-- Fevrier 2025
       (16, 'BP-2025-02-001', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RAKOTO", "prenom": "Hery", "matricule": "RH-001", "poste": "Directeur RH"}, "salaire_base": 2500000, "heures_sup": 0, "primes": 200000, "brut": 2700000, "deductions": [{"type": "CNaPS", "montant": 27000}, {"type": "OSTIE", "montant": 27000}, {"type": "IRSA", "montant": 378000}], "net": 2268000}',
        'Direction Generale', TRUE),
       (17, 'BP-2025-02-002', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "ANDRIANARISOA", "prenom": "Faly", "matricule": "IT-001", "poste": "Directeur IT"}, "salaire_base": 2800000, "heures_sup": 0, "primes": 250000, "brut": 3050000, "deductions": [{"type": "CNaPS", "montant": 30500}, {"type": "OSTIE", "montant": 30500}, {"type": "IRSA", "montant": 457500}], "net": 2531500}',
        'Direction Generale', TRUE),
       (18, 'BP-2025-02-003', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RAZAFINDRAKOTO", "prenom": "Miora", "matricule": "FIN-001", "poste": "Directrice Finance"}, "salaire_base": 2600000, "heures_sup": 0, "primes": 150000, "brut": 2750000, "deductions": [{"type": "CNaPS", "montant": 27500}, {"type": "OSTIE", "montant": 27500}, {"type": "IRSA", "montant": 385000}], "net": 2310000}',
        'Direction Generale', TRUE),
       (19, 'BP-2025-02-004', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RAHERIMANDIMBY", "prenom": "Tiana", "matricule": "COM-001", "poste": "Directeur Commercial"}, "salaire_base": 2400000, "heures_sup": 0, "primes": 120000, "brut": 2520000, "deductions": [{"type": "CNaPS", "montant": 25200}, {"type": "OSTIE", "montant": 25200}, {"type": "IRSA", "montant": 327600}], "net": 2142000}',
        'Direction Generale', TRUE),
       (20, 'BP-2025-02-005', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RANDRIANASOLO", "prenom": "Vonjy", "matricule": "LOG-001", "poste": "Directeur Logistique"}, "salaire_base": 2200000, "heures_sup": 0, "primes": 100000, "brut": 2300000, "deductions": [{"type": "CNaPS", "montant": 23000}, {"type": "OSTIE", "montant": 23000}, {"type": "IRSA", "montant": 299000}], "net": 1955000}',
        'Direction Generale', TRUE),
       (21, 'BP-2025-02-006', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RATSIMBAZAFY", "prenom": "Lova", "matricule": "MKT-001", "poste": "Directrice Marketing"}, "salaire_base": 2300000, "heures_sup": 0, "primes": 100000, "brut": 2400000, "deductions": [{"type": "CNaPS", "montant": 24000}, {"type": "OSTIE", "montant": 24000}, {"type": "IRSA", "montant": 312000}], "net": 2040000}',
        'Direction Generale', TRUE),
       (22, 'BP-2025-02-007', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RABEARIVELO", "prenom": "Hasina", "matricule": "IT-002", "poste": "Developpeur Web"}, "salaire_base": 1200000, "heures_sup": 20769, "primes": 50000, "brut": 1270769, "deductions": [{"type": "CNaPS", "montant": 12708}, {"type": "OSTIE", "montant": 12708}, {"type": "IRSA", "montant": 127077}], "net": 1118277}',
        'ANDRIANARISOA Faly', TRUE),
       (23, 'BP-2025-02-008', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "ANDRIAMAHEFA", "prenom": "Toky", "matricule": "IT-003", "poste": "Developpeur Senior"}, "salaire_base": 1500000, "heures_sup": 0, "primes": 80000, "brut": 1580000, "deductions": [{"type": "CNaPS", "montant": 15800}, {"type": "OSTIE", "montant": 15800}, {"type": "IRSA", "montant": 173800}], "net": 1374600}',
        'ANDRIANARISOA Faly', TRUE),
       (24, 'BP-2025-02-009', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RASOANAIVO", "prenom": "Volatiana", "matricule": "RH-002", "poste": "Assistante RH"}, "salaire_base": 700000, "heures_sup": 0, "primes": 30000, "brut": 730000, "deductions": [{"type": "CNaPS", "montant": 7300}, {"type": "OSTIE", "montant": 7300}, {"type": "IRSA", "montant": 51100}], "net": 664300}',
        'RAKOTO Hery', TRUE),
       (25, 'BP-2025-02-010', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RAZAFINDRABE", "prenom": "Nomena", "matricule": "FIN-002", "poste": "Comptable"}, "salaire_base": 900000, "heures_sup": 0, "primes": 40000, "brut": 940000, "deductions": [{"type": "CNaPS", "montant": 9400}, {"type": "OSTIE", "montant": 9400}, {"type": "IRSA", "montant": 84600}], "net": 836600}',
        'RAZAFINDRAKOTO Miora', TRUE),
       (26, 'BP-2025-02-011', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RAKOTONIRINA", "prenom": "Ando", "matricule": "COM-002", "poste": "Commercial Terrain"}, "salaire_base": 700000, "heures_sup": 24234, "primes": 50000, "brut": 774234, "deductions": [{"type": "CNaPS", "montant": 7742}, {"type": "OSTIE", "montant": 7742}, {"type": "IRSA", "montant": 54197}], "net": 704553}',
        'RAHERIMANDIMBY Tiana', TRUE),
       (27, 'BP-2025-02-012', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RAHERIMANANTSOA", "prenom": "Fara", "matricule": "COM-003", "poste": "Commerciale Terrain"}, "salaire_base": 650000, "heures_sup": 0, "primes": 0, "brut": 650000, "deductions": [{"type": "CNaPS", "montant": 6500}, {"type": "OSTIE", "montant": 6500}, {"type": "IRSA", "montant": 39000}], "net": 598000}',
        'RAHERIMANDIMBY Tiana', TRUE),
       (28, 'BP-2025-02-013', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RANDRIANARIVONY", "prenom": "Lanto", "matricule": "IT-004", "poste": "Administrateur Systeme"}, "salaire_base": 1600000, "heures_sup": 41539.50, "primes": 80000, "brut": 1721539.50, "deductions": [{"type": "CNaPS", "montant": 17215}, {"type": "OSTIE", "montant": 17215}, {"type": "IRSA", "montant": 197778}], "net": 1489331.50}',
        'ANDRIANARISOA Faly', TRUE),
       (29, 'BP-2025-02-014', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "RAVALOMANANA", "prenom": "Njaka", "matricule": "LOG-002", "poste": "Responsable Logistique"}, "salaire_base": 1400000, "heures_sup": 36346.50, "primes": 60000, "brut": 1496346.50, "deductions": [{"type": "CNaPS", "montant": 14963}, {"type": "OSTIE", "montant": 14963}, {"type": "IRSA", "montant": 164599}], "net": 1301821.50}',
        'RANDRIANASOLO Vonjy', TRUE),
       (30, 'BP-2025-02-015', '2025-02-28', 'Fevrier 2025',
        '{"employe": {"nom": "ANDRIANJAFY", "prenom": "Soa", "matricule": "MKT-002", "poste": "Community Manager"}, "salaire_base": 650000, "heures_sup": 0, "primes": 20000, "brut": 670000, "deductions": [{"type": "CNaPS", "montant": 6700}, {"type": "OSTIE", "montant": 6700}, {"type": "IRSA", "montant": 40200}], "net": 616400}',
        'RATSIMBAZAFY Lova', TRUE);

-- ----- UNITÉ 1 : Cotisations Sociales -----
INSERT INTO Configuration (unite, nom_unite, cle, valeur, type_valeur, description)
VALUES (1, 'Cotisations Sociales', 'TAUX_CNAPS_EMPLOYE', '1.0', 'POURCENTAGE', 'Part salariale de la cotisation CNAPS'),
       (1, 'Cotisations Sociales', 'TAUX_CNAPS_ENTREPRISE', '13.0', 'POURCENTAGE',
        'Part patronale de la cotisation CNAPS'),
       (1, 'Cotisations Sociales', 'TAUX_OSTIE_EMPLOYE', '1.0', 'POURCENTAGE', 'Part salariale de la cotisation OSTIE'),
       (1, 'Cotisations Sociales', 'TAUX_OSTIE_ENTREPRISE', '5.0', 'POURCENTAGE',
        'Part patronale de la cotisation OSTIE'),
       (1, 'Cotisations Sociales', 'MAJORATION_HEURES_SUP', '30.0', 'POURCENTAGE',
        'Majoration appliquée au taux horaire pour les heures supplémentaires');

-- ----- UNITÉ 2 : Salaire Minimum -----
INSERT INTO Configuration (unite, nom_unite, cle, valeur, type_valeur, description)
VALUES (2, 'Salaire Minimum', 'SALAIRE_MINIMUM', '350000', 'MONTANT',
        'Salaire Minimum Interprofessionnel Garanti (SMIG) mensuel en Ariary');

-- ----- UNITÉ 3 : Congés et Absences -----
INSERT INTO Configuration (unite, nom_unite, cle, valeur, type_valeur, description)
VALUES (3, 'Congés et Absences', 'JOURS_CONGE_ANNUEL', '30', 'JOURS',
        'Nombre total de jours de congé payé acquis par an'),
       (3, 'Congés et Absences', 'CONGE_MAX_ANNUEL', '30', 'JOURS',
        'Plafond maximal de congés pouvant être pris sur l''année'),
       (3, 'Congés et Absences', 'CONGE_MAX_MENSUEL', '2.5', 'JOURS',
        'Acquisition mensuelle de congés (30 jours ÷ 12 mois)'),
       (3, 'Congés et Absences', 'MAX_JOURS_ABSCENCE_MOIS', '3', 'JOURS',
        'Nombre maximum de jours d''absence autorisés par mois'),
       (3, 'Congés et Absences', 'MAX_JOURS_RETARD_MOIS', '2', 'JOURS',
        'Nombre maximum de jours de retard tolérés par mois');

-- ----- UNITÉ 4 : Temps de Travail -----
INSERT INTO Configuration (unite, nom_unite, cle, valeur, type_valeur, description)
VALUES (4, 'Temps de Travail', 'HEURES_TRAVAIL_MENSUEL', '173.33', 'HEURES',
        'Durée légale de travail mensuelle (40h/sem × 52 sem ÷ 12 mois)');

-- ----- UNITÉ 5 : Validité des Congés -----
INSERT INTO Configuration (unite, nom_unite, cle, valeur, type_valeur, description)
VALUES (5, 'Validité des Congés', 'CONGE_MAX_VALIDITE', '3', 'ANNEES',
        'Durée maximale de validité des congés non pris (en années)');

-- ----- UNITÉ 6 : Pointage et Heures Supplémentaires -----
INSERT INTO Configuration (unite, nom_unite, cle, valeur, type_valeur, description)
VALUES (6, 'Pointage et Heures Supplémentaires', 'HEURE_POINTAGE_RETARD', '08:00', 'HEURE',
        'Au-delà de cette heure, l''employé est considéré en retard'),
       (6, 'Pointage et Heures Supplémentaires', 'HEURE_POINTAGE_ABSCENT', '09:00', 'HEURE',
        'Au-delà de cette heure, l''employé est considéré absent pour la journée'),
       (6, 'Pointage et Heures Supplémentaires', 'TOTAL_HEURE_SUP_SEMAINE', '20', 'HEURES',
        'Plafond hebdomadaire d''heures supplémentaires autorisées'),
       (6, 'Pointage et Heures Supplémentaires', 'TOTAL_HEURE_SUP_MOIS', '80', 'HEURES',
        'Plafond mensuel d''heures supplémentaires autorisées');

-- ============================================================
-- 5. DONNÉES — BARÈME IRSA 2025
-- ============================================================
INSERT INTO BaremeIRSA (numero_tranche, revenu_min, revenu_max, taux, description, annee_validite)
VALUES (1, 0.00, 350000.00, 0.00, 'Tranche exonérée', 2025),
       (2, 350001.00, 400000.00, 5.00, 'Première tranche imposable', 2025),
       (3, 400001.00, 500000.00, 10.00, 'Deuxième tranche imposable', 2025),
       (4, 500001.00, 600000.00, 15.00, 'Troisième tranche imposable', 2025),
       (5, 600001.00, 4000000.00, 20.00, 'Quatrième tranche imposable', 2025),
       (6, 4000001.00, NULL, 25.00, 'Tranche supérieure', 2025);
-- ============================================================
-- FIN DES DONNEES D'EXEMPLE
-- ============================================================
