-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 20 fév. 2023 à 11:14
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
create database chat;
use chat;
--
-- Base de données : `chat`
--

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `idm` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) NOT NULL,
  `message` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `destinataire` varchar(50) NOT NULL DEFAULT 'tous',
  PRIMARY KEY (`idm`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`idm`, `pseudo`, `message`, `date`, `destinataire`) VALUES
(31, 'prof', 'Test', '2023-02-20 12:11:48', 'tous');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idu` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `mdp` varchar(200) NOT NULL,
  `niveau` int(11) NOT NULL,
  PRIMARY KEY (`idu`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idu`, `nom`, `prenom`, `pseudo`, `mail`, `mdp`, `niveau`) VALUES
(1, 'prof', 'prof', 'prof', 'prof@prof.fr', 'prof', 2),
(2, 'eleve', 'eleve', 'eleve', 'eleve@eleve.fr', 'eleve', 1),
(3, 'elsa', 'elsa', 'elsa', 'elsa@gmail.com', 'elsa', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
