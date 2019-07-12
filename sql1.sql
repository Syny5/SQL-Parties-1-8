-- PARTIE 1 : Création et suppression de bases de données --

-- Exercice 1 --
-- Créer une base de données languages. --
CREATE DATABASE languages;

-- Exercice 2 --
-- Créer une base de données webDevelopment avec l’encodage UTF-8. --
CREATE DATABASE webDevelopment CHARACTER SET 'utf8';
-- COLLATE UTF8_GENERAL_CI;

-- Exerce 3 --
-- Créer une base de données frameworks avec l’encodage UTF-8 si elle n’existe pas. --
CREATE DATABASE IF NOT EXISTS frameworks CHARACTER SET 'utf8';

--Exercice 4 --
-- Créer une base de données languages avec l’encodage UTF-8 si elle n’existe pas. --
CREATE DATABASE IF NOT EXISTS languages CHARACTER SET 'utf8';

-- Exercice 5 --
-- Supprimer la base de données languages. --
DROP DATABASE languages;

-- Exercice 6 --
-- Supprimer la base de données frameworks si elle existe. --
DROP DATABASE IF EXISTS frameworks;

-- Exercice 7 --
-- Supprimer la base de données languages si elle existe. --
DROP DATABASE IF EXISTS languages;

-- PARTIE 2 : Création de tables --

--Exercice 1 --
-- Dans la base de données webDevelopment, créer la table languages avec les colonnes indiquées--
USE webDevelopment;
CREATE TABLE `languages`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(30),
  PRIMARY KEY (`id`)
)
ENGINE = INNODB;
-- INNODB est un moteur de tables. Le moteur de base de MySQL est MyISAM mais il ne gère pas certaines fonctionnalités
-- importantes comme les clés étrangères, qui permettent de vérifier l'intégrité d'une référence d'une table à une autre
-- table ou les transactions, qui permettent de réaliser des séries de modifications "en bloc", ou au contraire d'annuler ces modifications.
-- INNODB est plus lent et plus gourmand en ressources que MyISAM, ce moteur gère les clés étrangères et les transactions. Étant donné que
-- nous nous servirons des clés étrangères dès la deuxième partie, c'est celui-là que nous allons utiliser.
-- De plus, en cas de crash du serveur, il possède un système de récupération automatique des données.

--Exercice 2 --
-- Dans la base de données webDevelopment, créer la table tools avec les colonnes indiquées --
CREATE TABLE `tools`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `tool` VARCHAR(30),
  PRIMARY KEY (`id`)
)
ENGINE = INNODB;

--Exercice 3 --
-- Dans la base de données webDevelopment, créer la table frameworks avec les colonnes indiquées --
CREATE TABLE `frameworks`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30),
  PRIMARY KEY (`id`)
)
ENGINE = INNODB;

--Exercice 4 --
-- Dans la base de données webDevelopment, créer la table libraries avec les colonnes indiquées --
CREATE TABLE `libraries`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `library` VARCHAR(30),
  PRIMARY KEY (`id`)
)
ENGINE = INNODB;

--Exercice 5 --
-- Dans la base de données webDevelopment, créer la table ide avec les colonnes indiquées. --
CREATE TABLE `ide`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `ideName` VARCHAR(30),
  PRIMARY KEY (`id`)
)
ENGINE = INNODB;

--Exercice 6 --
-- Dans la base de données webDevelopment, créer, si elle n'existe pas, la table frameworks avec les colonnes indiquées --
CREATE TABLE IF NOT EXISTS `frameworks`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30),
  PRIMARY KEY (`id`)
)
ENGINE = INNODB;

--Exercice 7 --
-- Supprimer la table tools si elle existe. --
DROP TABLE IF EXISTS tools;

-- Exercice 8 --
-- Supprimer la table libraries --
DROP TABLE libraries;

-- Exercice 9 --
-- Supprimer la table ide --
DROP TABLE ide;

-- TP --
CREATE DATABASE codex CHARACTER SET 'utf-8';
USE codex;
CREATE TABLE clients(
  `id` INT AUTO_INCREMENT,
  `lastname` VARCHAR(40),
  `firstname` VARCHAR(30),
  `birthDate` DATETIME,
  `address` VARCHAR(80),
  `firstPhoneNumber` INT,
  `secondPhoneNumber` INT,
  `mail` VARCHAR(60)
)
ENGINE = INNODB;

-- PARTIE 3 : Modifications de tables --

-- Exercice 1 --
-- Dans la base de données webDevelopment, ajouter à la table languages une colonne versions (VARCHAR). --
USE webDevelopment;
ALTER TABLE languages
ADD versions VARCHAR(30);

-- Exercice 2 --
-- Dans la base de données webDevelopment, ajouter à la table frameworks une colonne version (INT). --
ALTER TABLE frameworks
ADD version INT;

-- Exercice 3 --
-- Dans la base de données webDevelopment, dans la table languages renommer la colonne versions en version. --
ALTER TABLE languages
CHANGE versions version VARCHAR(30);

--Exercice 4 --
-- Dans la base de données webDevelopment, dans la table frameworks, renommer la colonne name en framework. --
ALTER TABLE frameworks
CHANGE name frameworks VARCHAR(30);

-- Exercice 5 --
-- Dans la base de données webDevelopment, dans la table frameworks changer le type de la colonne version en VARCHAR de taille 10. --
ALTER TABLE frameworks
MODIFY version VARCHAR(10);

-- TP --
USE codex;
ALTER TABLE clients
DROP secondPhoneNumber;
ALTER TABLE clients
CHANGE firstPhoneNumber phoneNumber INT;
ALTER TABLE clients
MODIFY phoneNumber VARCHAR(14);
ALTER TABLE clients
ADD zipCode VARCHAR(5);
ALTER TABLE clients
ADD city VARCHAR(30);

-- PARTIE 4 : Insertion de données --

-- Exercice 1 --
-- Insérez les données indiquées dans la table languages de la base webDevelopment --
USE webDevelopment;
INSERT INTO languages (language, version)
VALUES ('JavaScript', 'version 5'),
('PHP', 'version 5.2'),
('PHP', 'version 5.4'),
('HTML', 'version 5.1'),
('JavaScript', 'version 6'),
('JavaScript', 'version 7'),
('JavaScript', 'version 8'),
('PHP', 'version 7');

-- Exercice 2 --
-- Insérez les données suivantes dans la table frameworks de la base webDevelopment --
ALTER TABLE frameworks
MODIFY version VARCHAR(30);
INSERT INTO frameworks (frameworks, version) -- describe nom_de_la_table = permet de voir le descriptif de la table --
VALUES ('Symfony', 'version 2.8'),
('Symfony', 'version 3'),
('JQuery', 'version 1.6'),
('JQuery', 'version 2.10');

-- PARTIE 5 : Sélection de données --

-- Exercice 1 --
-- Dans la table languages, afficher toutes les données de la table. --
-- show tables pour voir la liste des tables --
SELECT * FROM languages;

-- Exercice 2 --
-- Dans la table languages, afficher toutes les versions de PHP. --
SELECT version FROM languages WHERE language="PHP";

-- Exercice 3 --
-- Dans la table languages, afficher toutes les versions de PHP et de JavaScript. --
SELECT version FROM languages WHERE language="PHP" OR language="JavaScript";

-- Exercice 4 --
-- Dans la table languages, afficher toutes les lignes ayant pour id 3,5,7. --
SELECT * FROM languages WHERE id="3" OR id="5" OR id="7";

-- Exercice 5 --
-- Dans la table languages, afficher les deux premières entrées de JavaScript. --
SELECT * FROM languages WHERE language='Javascript' LIMIT 2;

-- Exercice 6 --
-- Dans la table languages, afficher toutes les lignes qui ne sont pas du PHP. --
SELECT * FROM languages WHERE language != "PHP";

-- Exercice 7 --
-- Dans la table languages, afficher toutes les données par ordre alphabétique. --
SELECT * FROM languages ORDER BY language asc;

-- PARTIE 6 --
-- Avant de commencer, exécutez le fichier SQL. --
-- Avant de lancer mysql, on se dirige vers le dossier contenant notre BDD, ou alors on écrit le chemin absolu complet. Puis on tape la commande suivante :
-- SOURCE sql1.sql;

-- Exercice 1 --
-- Dans la table frameworks, afficher toutes les données de la table ayant une version 2.x (x étant un numéro quelconque). --
SELECT * FROM frameworks WHERE version like "version 2.%";

-- Exercice 2 --
-- Dans la table frameworks, afficher toutes les lignes ayant pour id 1 et 3. --
SELECT * FROM frameworks WHERE id="1" OR id="3";

-- Exercice 3 --
CREATE TABLE `webDevelopment`.`ide` (
`id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
`version` VARCHAR(10) NOT NULL,
`date` DATE NOT NULL,
PRIMARY KEY (`id`)
)
ENGINE=INNODB;

INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.3', '2007-06-01'); -- Année - Mois - Jour
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.5', '2009-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.6', '2010-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.7', '2011-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '4.3', '2013-06-13');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('NetBeans', '7', '2011-04-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('NetBeans', '8.2', '2016-10-03');
-- Dans la table ide, afficher toutes les lignes ayant une date comprise entre le premier janvier 2010 et le 31 decembre 2011. --
SELECT * FROM ide WHERE date >= '2010-01-10' AND date <= '2011-12-31';

-- PARTIE 7 : Suppression et modification de données --

-- Exercice 1 --
-- Dans la table languages, supprimer toutes les lignes parlant de HTML. --
DELETE FROM languages WHERE language = "HTML";

-- Exercice 2 --
-- Dans la table frameworks, modifier toutes les lignes ayant le framework Symfony par Symfony2. --
UPDATE frameworks SET frameworks = "Symfony2" WHERE frameworks = "Symfony";

-- Exercice 3 --
-- Dans la table languages, modifier la ligne du langage JavaScript version 5 par la version 5.1 --
UPDATE languages SET version = "version 5.1" WHERE language = "JavaScript" AND version = "version 5";

-- Partie 8 : Les jointures --
-- Reprise du fichier bdd.sql --

-- Création de la base
CREATE DATABASE IF NOT EXISTS `development`;
-- On se positione dans la base nouvellement créé
USE `development`;
-- Création de la table languages
CREATE TABLE IF NOT EXISTS `languages` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
PRIMARY KEY (`id`)
)ENGINE=INNODB;
-- Création de la table frameworks qui contient une clé étrangère
CREATE TABLE IF NOT EXISTS `frameworks` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
`languagesId` INT NOT NULL,
PRIMARY KEY (`id`)
)ENGINE=INNODB;
-- Insertion des données dans la table language
-- SOURCE index.sql

-- Exercice 1 --
-- Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework l'afficher aussi. --
INSERT INTO `languages` (`name`) VALUES ('Assembleur');
INSERT INTO `languages` (`name`) VALUES ('C');
INSERT INTO `languages` (`name`) VALUES ('C++');
INSERT INTO `languages` (`name`) VALUES ('Java');
INSERT INTO `languages` (`name`) VALUES ('HTML');
INSERT INTO `languages` (`name`) VALUES ('CSS');
INSERT INTO `languages` (`name`) VALUES ('JavaScript');
INSERT INTO `languages` (`name`) VALUES ('PHP');
INSERT INTO `languages` (`name`) VALUES ('C#');
INSERT INTO `languages` (`name`) VALUES ('VB');
INSERT INTO `languages` (`name`) VALUES ('Python');
INSERT INTO `languages` (`name`) VALUES ('Ruby');
INSERT INTO `languages` (`name`) VALUES ('Swift');
-- Insertion des données dans la table frameworks
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Qt',3);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('SDK Android',4);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Bootstrap',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Foundation',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('KNACSS',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Avalanche',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Miligram',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Skeleton',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Hoisin',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Inuit',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Mimic',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Ministrap',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Lotus',6);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Jquery',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Angular',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('ReactJS',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Vue.js',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Ember.js',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Meteor.js',7);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Laravel',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Symfony',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('CodeIgniter',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Yii',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Phalcon',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Lumen',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Silex',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Slim',8);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('.NET',9);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('.NET',10);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Django',11);
INSERT INTO `frameworks` (`name`,`languagesId`) VALUES ('Ruby On Rails',12);

-- SOURCE index.sql

-- Exercice 1 --
-- Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework l'afficher aussi. --
SELECT languages.name,frameworks.name FROM languages LEFT JOIN frameworks ON frameworks.languagesID=languages.id ORDER BY languages.name, frameworks.name;
-- SELECT languages.name,frameworks.name : Je sélectionne les colonnes name des table languages et frameworks
-- FROM languages : Je travaille sur la table languages
-- LEFT JOIN frameworks : Je la joins à la table frameworks "par la gauche" (cela signifie que l'on veut toutes les lignes de la table de gauche)
-- ON frameworks.languagesID=languages.id : le jointure se fait sur les colonnes id de la table frameworks, qui doivent donc correspondre.
-- ORDER BY languages.name, frameworks.name : On trie les colonnes, languages.name en premier.

-- Exercice 2 --
-- Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework ne pas l'afficher. --
SELECT languages.name,frameworks.name FROM frameworks INNER JOIN languages ON languages.id = frameworks.languagesId;

-- Exercice 3 --
-- Afficher le nombre de framework qu'a un langage. --
SELECT languages.name, COUNT(frameworks.name) AS NumberofFrameworks FROM frameworks RIGHT JOIN languages ON languages.id=frameworks.languagesID GROUP BY name;
-- COUNT compte le nombre d’enregistrement dans une table. Connaître le nombre de lignes dans une table est très pratique dans de nombreux cas, par exemple
-- pour savoir combien d’utilisateurs sont présents dans une table ou pour connaître le nombre de commentaires sur un article.
-- AS permet d'afficher la colonne avec un nom personnalisé

-- Exercice 4 --
-- Afficher les langages ayant plus de 3 frameworks. --
SELECT languages.name, COUNT(frameworks.name) AS NumberofFrameworks FROM frameworks RIGHT JOIN languages ON languages.id=frameworks.languagesID GROUP BY name HAVING NumberofFrameworks > 3;
-- HAVING est l'équivalent de WHERE mais cette condition permet de filtrer en utilisant des fonctions (ici : COUNT).
