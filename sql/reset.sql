-- ============================================================
-- SCRIPT DE REINITIALISATION DE LA BASE DE DONNEES RH
-- Supprime toutes les tables dans l'ordre correct (dependances)
-- ============================================================

-- Suppression des tables dans l'ordre inverse des dependances
DROP TABLE IF EXISTS BulletinPaie CASCADE;
DROP TABLE IF EXISTS ImpotDeduction CASCADE;
DROP TABLE IF EXISTS AvantageSocial CASCADE;
DROP TABLE IF EXISTS Paie CASCADE;
DROP TABLE IF EXISTS HeuresSupplementaires CASCADE;
DROP TABLE IF EXISTS Presence CASCADE;
DROP TABLE IF EXISTS Horaire CASCADE;
DROP TABLE IF EXISTS Formation CASCADE;
DROP TABLE IF EXISTS Absence CASCADE;
DROP TABLE IF EXISTS Conge CASCADE;
DROP TABLE IF EXISTS Performance CASCADE;
DROP TABLE IF EXISTS DossierEmploye CASCADE;
DROP TABLE IF EXISTS Employe CASCADE;
DROP TABLE IF EXISTS Entretien CASCADE;
DROP TABLE IF EXISTS Candidature CASCADE;
DROP TABLE IF EXISTS Annonce CASCADE;
DROP TABLE IF EXISTS Candidat CASCADE;
DROP TABLE IF EXISTS Departement CASCADE;

-- Suppression des index (CASCADE les supprime deja, mais par securite)
DROP INDEX IF EXISTS idx_employe_departement;
DROP INDEX IF EXISTS idx_employe_statut;
DROP INDEX IF EXISTS idx_candidature_annonce;
DROP INDEX IF EXISTS idx_candidature_candidat;
DROP INDEX IF EXISTS idx_presence_date;
DROP INDEX IF EXISTS idx_presence_employe;
DROP INDEX IF EXISTS idx_paie_employe;
DROP INDEX IF EXISTS idx_paie_periode;
DROP INDEX IF EXISTS idx_conge_employe;
DROP INDEX IF EXISTS idx_absence_employe;
DROP INDEX IF EXISTS idx_hs_employe;
DROP INDEX IF EXISTS idx_formation_employe;
DROP INDEX IF EXISTS idx_performance_employe;

-- Message de confirmation
DO $$
BEGIN
    RAISE NOTICE 'Base de donnees RH reinitialisee avec succes.';
END $$;
