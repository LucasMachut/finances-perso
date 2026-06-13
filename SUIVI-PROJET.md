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
- **Synchronisation cloud (GitHub)** : données stockées dans le repo **privé** `finances-data` (`data.json` via l'API Contents). Jeton fine-grained stocké sur l'appareil (jamais dans le code public). Pull au démarrage, push auto à chaque modif, copie locale pour le hors-ligne. Indicateur de statut dans l'en-tête (☁/✓/↻/⚠) + écran de config (menu → « Sauvegarde cloud »). Résolution de conflit par `sha` + `updatedAt` (données réelles prioritaires sur l'exemple). **→ règle le problème de perte de données du localStorage.**
- **Données d'exemple** (3 mois) au 1er lancement + bouton « Tout effacer ».
- `manifest.json` (installable PWA), `README.md`.

---

## 🆕 MAJ 13/06/2026 (soir) — double devise + vraies données

- **Données fictives supprimées.** L'app démarre sur le vrai jeu (récurrentes réelles, aucune transaction d'exemple). L'ancien état d'exemple est remplacé automatiquement au prochain chargement (sur l'appareil ET au cloud).
- **Double devise € / R$** : chaque mouvement a sa devise, conversion auto au **taux du jour** (frankfurter/ECB, cache 6 h, fallback ~5,9). Totaux affichés dans les deux devises partout (héro, résumés, donut, lignes).
- **Récurrentes pré-remplies** : Salaire 1650 € (j.30), Loyer 3100 R$, Adobe 350 R$, Free 20 €, Mutuelle 20 €.
  - ⚠️ **Jour de prélèvement** : seul le salaire (30) était précisé. Loyer/Adobe/Free/Mutuelle sont mis au **5** par défaut → **à ajuster** dans Menu → Charges récurrentes.
- **Catégories** : ajout **et suppression de n'importe quelle catégorie** (avertissement si utilisée → les mouvements basculent en « Autres »).
- **Classement ponctuel/récurrent** dès la saisie d'un mouvement (choix Ponctuel / Tous les mois).

## 🆕 MAJ 13/06/2026 (nuit) — double devise partout + saisie plus rapide

- **Tous les montants affichés en € ET R$.** Plus aucun montant en une seule devise : héro, marges, jauge, totaux jour par jour, catégories (accueil + analyse), objectifs, récurrentes, net récurrent, info-bulles des graphes… tout passe par `dualEUR`/`signedDualEUR`. La récurrente affiche aussi son équivalent (`≈`).
- **Création express de catégorie depuis la saisie.** Bouton « ＋ Catégorie » directement dans le sélecteur de catégories (dépense, revenu et récurrente) : on tape le nom, la catégorie est créée et sélectionnée sans quitter le formulaire (icône/couleur par défaut, modifiables ensuite dans « Gérer les catégories »).
- **Multiplication d'une dépense.** Champ « Montant unitaire » × « Quantité » avec **total calculé en direct dans les deux devises** (ex : ticket de métro × nombre de trajets). Le détail `prix×qté` est rappelé sous le mouvement.
- **Plusieurs montants d'un coup (différents).** Champ « Plusieurs montants » : on liste des montants séparés par un espace (ou `;` / `+`), ils s'**additionnent** au total (la virgule reste le séparateur décimal FR). Ex : tous les trajets/courses du mois en une saisie. Stocké dans `montants[]` (montant = somme, stats justes), nombre de montants rappelé sous le mouvement. Cumulable avec unitaire×qté.

## ❓ Questions pour Lucas (à répondre demain)

1. **Jours de prélèvement** loyer / Adobe / Free / mutuelle ? (mis au 5 par défaut)
2. **Salaire** : 1650 € le 30 — fixe tous les mois ? Et des **vacations LSF** variables à ajouter en revenus ?
3. **Autres charges fixes réelles** (assurances, crédits, impôts, autres abos…) à ajouter ?
4. **Budgets par catégorie** : veux-tu fixer un **budget mensuel par catégorie** (ex : 300 €/courses) avec alerte quand tu dépasses ? Pas encore fait — gros plus si utile.
5. **Objectifs** : quels objectifs d'épargne réels (nom, montant cible, déjà épargné, échéance) ?
6. **Lien avec l'app Facturation LSF** : faut-il **importer automatiquement** tes revenus depuis l'app de facturation, ou tu saisis les revenus à la main ici ?
7. **Solde de compte** : veux-tu suivre un **solde de compte bancaire réel** (point de départ + variations) en plus de la marge mensuelle ?
   - *Stockage : réglé.* On est partis sur la **sync cloud via ton GitHub privé** (repo `finances-data`). Reste à valider que ça te convient à l'usage (sync multi-appareils, expiration du jeton à renouveler ~1 an).
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
