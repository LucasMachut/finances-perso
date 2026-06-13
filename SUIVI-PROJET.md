# Suivi projet — Finances • Perso

> App de suivi financier personnel pour Lucas. v1 livrée le **13 juin 2026** (session autonome).
> Fichier principal : `finances.html` (un seul fichier, hors-ligne, localStorage).
> Même identité visuelle + même logique que *Pulso pour Richard*.

---

## ✅ Fait (v1)

- Structure complète identité Pulso (cyan #16D1FF, Archivo, thème sombre/clair, phone frame, bottom nav, FAB, bottom sheets, toasts).
- 4 onglets : **Accueil**, **Mouvements**, **Analyse**, **Objectifs**.
- **Mouvements** : ajout/édition/suppression dépenses & revenus, regroupés par jour, filtre Tout/Dépenses/Revenus, navigation mensuelle, totaux + marge.
- **Dépenses par catégories** : barres + pourcentages, 13 catégories par défaut, catégories personnalisables (nom/icône/couleur).
- **Dépenses récurrentes** : moteur de génération automatique mensuelle (loyer, salaire, abonnements…), activation/désactivation, édition, jour du mois, « depuis le mois ».
- **Marges** : marge € + taux de marge %, jauge sur l'accueil, marge mois par mois (excédent/déficit) sur Analyse.
- **Objectifs d'épargne** : barre de progression, % atteint, échéance, « ajouter de l'épargne », capacité d'épargne moyenne 3 mois.
- **Graphiques d'analyse** : barres annuelles revenus vs dépenses, donut répartition dépenses (SVG), détail par catégorie, marge 12 mois.
- **Sauvegarde/restauration JSON**, export **CSV**, réglages (prénom), bandeau « X changements depuis la dernière sauvegarde ».
- **Données d'exemple** (3 mois) au 1er lancement + bouton « Tout effacer ».
- `manifest.json` (installable PWA), `README.md`.

---

## ❓ Questions pour Lucas (à répondre demain)

1. **Devise** : j'ai mis l'**euro (€)**. C'est bon ou tu veux autre chose / multi-devises ?
2. **Salaire / revenus** : j'ai créé une récurrente « Salaire 2200 € » en exemple. Quels sont tes vrais revenus récurrents (montant, jour du mois) ? Salaire fixe + vacations LSF variables ?
3. **Charges fixes réelles** : loyer, abonnements, assurances, crédits… ? Donne-moi la liste avec montants + jour de prélèvement, je peux les pré-remplir.
4. **Budgets par catégorie** : veux-tu fixer un **budget mensuel par catégorie** (ex : 300 €/courses) avec alerte quand tu dépasses ? Pas encore fait — gros plus si utile.
5. **Objectifs** : quels objectifs d'épargne réels (nom, montant cible, déjà épargné, échéance) ?
6. **Lien avec l'app Facturation LSF** : faut-il **importer automatiquement** tes revenus depuis l'app de facturation, ou tu saisis les revenus à la main ici ?
7. **Solde de compte** : veux-tu suivre un **solde de compte bancaire réel** (point de départ + variations) en plus de la marge mensuelle ?
8. **Vue annuelle / patrimoine** : besoin d'un onglet bilan annuel (total épargné sur l'année, évolution du patrimoine) ?
9. **Récurrentes variables** : certaines charges varient (élec, eau). Garder un montant estimé modifiable chaque mois, ou autre logique ?
10. **Catégories** : les 13 catégories par défaut te conviennent ? À ajouter/renommer/supprimer ?

---

## 🔜 Idées / Priorité 2 (après tes réponses)

- **Budgets par catégorie** + alertes de dépassement (barre rouge).
- **Prévisionnel** : projeter la fin de mois à partir des récurrentes + tendance.
- **Répartition automatique de la marge** vers les objectifs (« sur 400 € de marge, mets 200 € en épargne précaution »).
- **Filtre/recherche** dans les mouvements, par catégorie.
- **Comparaison mois N / N-1** (flèches +/- %).
- **Sauvegarde via partage natif** (`navigator.share`) comme dans l'app Richard (bouton « Salaver cópia »), pour envoyer le backup vers iCloud/Drive en 1 tap.
- **Revue esthétique** (comme demandé pour Richard) une fois le contenu réel en place.

---

## 🗂️ Repo GitHub

Voir le lien renvoyé en fin de session (repo privé créé automatiquement).
