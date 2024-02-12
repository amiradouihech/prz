-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 30 jan. 2024 à 10:25
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projeta`
--

-- --------------------------------------------------------

--
-- Structure de la table `cathegori`
--

CREATE TABLE `cathegori` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cathegori`
--

INSERT INTO `cathegori` (`id`, `type`) VALUES
(1, 'Electronique'),
(2, 'maison'),
(3, 'sport'),
(4, 'alimentation');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `lib_produit` varchar(255) NOT NULL,
  `id_cathegori` int(11) DEFAULT NULL,
  `id_produit` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `prix` int(9) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `id_sous_categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`lib_produit`, `id_cathegori`, `id_produit`, `description`, `prix`, `quantite`, `id_sous_categorie`) VALUES
('pomme', 4, 23, 'rouge', 15, 121, 4),
('pc5', 1, 24, 'i7', 1351, 3, 1),
('disque', 1, 25, '5 pousse', 332, 10000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `subcategorie`
--

CREATE TABLE `subcategorie` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `subcategorie`
--

INSERT INTO `subcategorie` (`id`, `libelle`, `cat`) VALUES
(1, 'périphérique', 1),
(2, 'ordinateur', 1),
(3, 'meuble', 2),
(4, 'décoration', 2),
(5, 'Poissons', 4),
(6, 'Fruits', 4),
(9, 'Nutrition sportive', 3),
(10, 'Balles et accessoires', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cathegori`
--
ALTER TABLE `cathegori`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `PK_cathegori` (`id_cathegori`),
  ADD KEY `id_sous_categorie` (`id_sous_categorie`);

--
-- Index pour la table `subcategorie`
--
ALTER TABLE `subcategorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat` (`cat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cathegori`
--
ALTER TABLE `cathegori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `subcategorie`
--
ALTER TABLE `subcategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `PK_cathegori` FOREIGN KEY (`id_cathegori`) REFERENCES `cathegori` (`id`),
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_sous_categorie`) REFERENCES `subcategorie` (`id`);

--
-- Contraintes pour la table `subcategorie`
--
ALTER TABLE `subcategorie`
  ADD CONSTRAINT `subcategorie_ibfk_1` FOREIGN KEY (`cat`) REFERENCES `cathegori` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
