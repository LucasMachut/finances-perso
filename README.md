# Finances • Perso

Application de **suivi financier personnel**, 100 % hors-ligne, dans un seul fichier HTML.
Même identité visuelle et même logique que *Pulso pour Richard* (cyan signature, police Archivo, thème sombre/clair, navigation mobile, sauvegarde JSON).

## Fonctionnalités (v1)

- **Accueil** — solde du mois (marge), taux de marge, top dépenses par catégorie, aperçu des objectifs, charges récurrentes.
- **Mouvements** — revenus & dépenses du mois, regroupés par jour, filtrables (Tout / Dépenses / Revenus), navigation mois par mois.
- **Analyse** — graphiques : barres revenus/dépenses sur l'année, donut de répartition des dépenses, détail par catégorie, marge mois par mois (excédent/déficit).
- **Objectifs** — objectifs d'épargne avec barre de progression, % atteint, capacité d'épargne moyenne (3 mois).
- **Dépenses récurrentes** — loyer, salaire, abonnements… générées automatiquement chaque mois.
- **Catégories** personnalisables (nom, icône, couleur).
- **Sauvegarde / restauration JSON**, export CSV.

## Utilisation

Ouvrir `finances.html` dans un navigateur (mobile ou desktop). Les données sont stockées dans le `localStorage` de l'appareil.

> Sur iPhone : ouvrir dans Safari → Partager → « Sur l'écran d'accueil » pour l'utiliser comme une app.

## Données d'exemple

Au premier lancement, des **données d'exemple** sont affichées (bandeau cyan en haut) pour visualiser les graphiques. Bouton **« Tout effacer »** pour repartir de zéro.

## Tech

- Un seul fichier `finances.html` (HTML + CSS + JS, aucune dépendance hors la police Google Fonts).
- `manifest.json` pour l'installation PWA.
- Stockage `localStorage`, sauvegarde/restauration par fichier JSON.
