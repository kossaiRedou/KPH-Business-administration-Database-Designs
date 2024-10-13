CREATE TABLE `Produit` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nom_produit` varchar(100),
  `categorie_produit` varchar(100),
  `prix_vente` decimal(10,2) DEFAULT 0,
  `prix_achat` decimal(10,2),
  `stock` integer DEFAULT 0,
  `total_vendu` integer DEFAULT 0,
  `chiffre_affaires` decimal(10,2) COMMENT 'calculé lors de la vente'
);

CREATE TABLE `Fournisseur` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nom_fourniseur` varchar(100),
  `telephone_fourniseur` varchar(10) UNIQUE,
  `pays_fourniseur` varchar(100),
  `total_reste_a_payer` decimal(10,2) COMMENT 'pour les sommes dues',
  `date_paiement_prevu` date
);

CREATE TABLE `Approvisionnement` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `fournisseur_id` integer,
  `date_approvisionnement` date,
  `montant_total` decimal(10,2) DEFAULT 0,
  `montant_payer` decimal(10,2) DEFAULT 0,
  `reste_a_payer` decimal(10,2) COMMENT 'calculé automatiquement',
  `date_paiement_prevu` date
);

CREATE TABLE `Client` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nom_complet` varchar(100),
  `telephone` varchar(10) UNIQUE,
  `total_reste_a_payer` decimal(10,2) COMMENT 'pour les sommes dues',
  `date_paiement_prevu` date
);

CREATE TABLE `Vente` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `client_id` integer,
  `date_vente` date,
  `montant_total` decimal(10,2) DEFAULT 0,
  `montant_regler` decimal(10,2) DEFAULT 0,
  `nombre_produit` integer COMMENT 'calculé lors de la vente',
  `date_paiement_prevu` date
);

CREATE TABLE `Paiement` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `vente_id` integer,
  `montant` decimal(10,2),
  `date_paiement` date
);

CREATE TABLE `VenteDetail` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `vente_id` integer,
  `produit_id` integer,
  `quantite` integer,
  `prix_unitaire` decimal(10,2),
  `montant_total` decimal(10,2)
);

ALTER TABLE `Approvisionnement` ADD FOREIGN KEY (`fournisseur_id`) REFERENCES `Fournisseur` (`id`);

ALTER TABLE `Vente` ADD FOREIGN KEY (`client_id`) REFERENCES `Client` (`id`);

ALTER TABLE `Paiement` ADD FOREIGN KEY (`vente_id`) REFERENCES `Vente` (`id`);

ALTER TABLE `VenteDetail` ADD FOREIGN KEY (`vente_id`) REFERENCES `Vente` (`id`);

ALTER TABLE `VenteDetail` ADD FOREIGN KEY (`produit_id`) REFERENCES `Produit` (`id`);
