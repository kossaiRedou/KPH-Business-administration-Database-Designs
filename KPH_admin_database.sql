CREATE TABLE `Produit` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom_produit` varchar(100),
  `categorie_produit` varchar(100),
  `prix_vente` decimal(10,2),
  `prix_achat` decimal(10,2),
  `stock` int,
  `total_vendu` int
);

CREATE TABLE `Fournisseur` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom_fourniseur` varchar(100),
  `telephone_fourniseur` varchar(10) UNIQUE,
  `pays_fourniseur` varchar(100)
);

CREATE TABLE `Approvisionnement` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `fournisseur_id` int,
  `date_approvisionnement` date,
  `montant_total` decimal(10,2),
  `montant_payer` decimal(10,2)
);

CREATE TABLE `ApprovisionnementDetail` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `approvisionnement_id` int,
  `produit_id` int,
  `quantite` int,
  `prix_unitaire` decimal(10,2),
  `montant_total` decimal(10,2),
  `montant_payer` decimal(10,2)
);

CREATE TABLE `Client` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom_complet` varchar(100),
  `telephone` varchar(10) UNIQUE
);

CREATE TABLE `Vente` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `client_id` int,
  `date_vente` date,
  `montant_total` decimal(10,2),
  `montant_regler` decimal(10,2)
);

CREATE TABLE `Paiement` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `vente_id` int,
  `montant` decimal(10,2),
  `date_paiement` date
);

CREATE TABLE `VenteDetail` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `vente_id` int,
  `produit_id` int,
  `quantite` int,
  `prix_unitaire` decimal(10,2),
  `montant_total` decimal(10,2)
);

ALTER TABLE `Approvisionnement` ADD FOREIGN KEY (`fournisseur_id`) REFERENCES `Fournisseur` (`id`);

ALTER TABLE `ApprovisionnementDetail` ADD FOREIGN KEY (`approvisionnement_id`) REFERENCES `Approvisionnement` (`id`);

ALTER TABLE `ApprovisionnementDetail` ADD FOREIGN KEY (`produit_id`) REFERENCES `Produit` (`id`);

ALTER TABLE `Vente` ADD FOREIGN KEY (`client_id`) REFERENCES `Client` (`id`);

ALTER TABLE `Paiement` ADD FOREIGN KEY (`vente_id`) REFERENCES `Vente` (`id`);

ALTER TABLE `VenteDetail` ADD FOREIGN KEY (`vente_id`) REFERENCES `Vente` (`id`);

ALTER TABLE `VenteDetail` ADD FOREIGN KEY (`produit_id`) REFERENCES `Produit` (`id`);
