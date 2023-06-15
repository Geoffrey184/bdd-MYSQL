-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : jeu. 15 juin 2023 à 08:22
-- Version du serveur : 8.0.29
-- Version de PHP : 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `marvel`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `id_acteur` int NOT NULL,
  `nom_acteur` varchar(255) DEFAULT NULL,
  `prenom_acteur` varchar(255) DEFAULT NULL,
  `role_acteur` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`id_acteur`, `nom_acteur`, `prenom_acteur`, `role_acteur`, `date_naissance`) VALUES
(1, 'Doe', 'John', 'Protagoniste', '1980-05-15'),
(2, 'Smith', 'Emma', 'Secondaire', '1992-12-01');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id_film` int NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `nombre_acteur` int DEFAULT NULL,
  `realisteur` varchar(255) DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `annee_sortie` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id_film`, `titre`, `nombre_acteur`, `realisteur`, `duree`, `annee_sortie`) VALUES
(1, 'Le Parrain', 5, 'Geoffrey Noel', '02:55:00', '1972-03-24'),
(2, 'Inception', 8, 'Christopher Nolan', '02:28:00', '2010-07-16'),
(3, 'spiderman', 5, 'Sam Raimi', '02:25:00', '1999-01-18');

-- --------------------------------------------------------

--
-- Structure de la table `Jouer`
--

CREATE TABLE `Jouer` (
  `id_acteur` int NOT NULL,
  `id_film` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Jouer`
--

INSERT INTO `Jouer` (`id_acteur`, `id_film`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `realisteur`
--

CREATE TABLE `realisteur` (
  `id_realisateur` int NOT NULL,
  `nom_realisateur` varchar(255) DEFAULT NULL,
  `prenom_realisateur` varchar(255) DEFAULT NULL,
  `id_film` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `realisteur`
--

INSERT INTO `realisteur` (`id_realisateur`, `nom_realisateur`, `prenom_realisateur`, `id_film`) VALUES
(1, 'Noel', 'Geoffrey', 1),
(2, 'Nolan', 'Christopher', 2);

-- --------------------------------------------------------

--
-- Structure de la table `Regarde`
--

CREATE TABLE `Regarde` (
  `id_utilisateur` int NOT NULL,
  `id_film` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Regarde`
--

INSERT INTO `Regarde` (`id_utilisateur`, `id_film`) VALUES
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `id_utilisateur` int NOT NULL,
  `nom_utilisateur` varchar(255) DEFAULT NULL,
  `prenom_utilisateur` varchar(255) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` tinyint(1) DEFAULT NULL,
  `liste_fav` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`id_utilisateur`, `nom_utilisateur`, `prenom_utilisateur`, `mdp`, `email`, `role`, `liste_fav`) VALUES
(1, 'Noel', 'Geoffrey', 'mdp123', 'john.smith@example.com', 1, '1,5,7'),
(2, 'Johnson', 'Emma', 'emma456', 'emma.johnson@example.com', 0, '3,8');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`id_acteur`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`),
  ADD UNIQUE KEY `realisteur` (`realisteur`);

--
-- Index pour la table `Jouer`
--
ALTER TABLE `Jouer`
  ADD PRIMARY KEY (`id_acteur`,`id_film`),
  ADD KEY `id_film` (`id_film`);

--
-- Index pour la table `realisteur`
--
ALTER TABLE `realisteur`
  ADD PRIMARY KEY (`id_realisateur`),
  ADD KEY `id_film` (`id_film`);

--
-- Index pour la table `Regarde`
--
ALTER TABLE `Regarde`
  ADD PRIMARY KEY (`id_utilisateur`,`id_film`),
  ADD KEY `id_film` (`id_film`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Jouer`
--
ALTER TABLE `Jouer`
  ADD CONSTRAINT `Jouer_ibfk_1` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  ADD CONSTRAINT `Jouer_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`);

--
-- Contraintes pour la table `realisteur`
--
ALTER TABLE `realisteur`
  ADD CONSTRAINT `realisteur_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`);

--
-- Contraintes pour la table `Regarde`
--
ALTER TABLE `Regarde`
  ADD CONSTRAINT `Regarde_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `Utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `Regarde_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
