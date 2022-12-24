-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 23 déc. 2022 à 14:10
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `enquete`
--

-- --------------------------------------------------------

--
-- Structure de la table `chapter`
--

CREATE TABLE `chapter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chapter`
--

INSERT INTO `chapter` (`id`, `name`) VALUES
(1, 'Chapitre 1'),
(2, 'Chapitre 2'),
(3, 'Chapitre 3'),
(4, 'Chapitre 4'),
(5, 'Chapitre 5'),
(6, 'Chapitre 6'),
(7, 'Chapitre 7'),
(8, 'Chapitre 8'),
(9, 'Chapitre 9'),
(10, 'Chapitre 10'),
(11, 'chapitre 11'),
(12, 'chapitre 12'),
(13, 'chapitre 13'),
(14, 'chapitre 14'),
(15, 'chapitre 15'),
(16, 'chapitre 16'),
(17, 'chapitre 17'),
(18, 'chapitre 18'),
(19, 'chapitre 19');

-- --------------------------------------------------------

--
-- Structure de la table `character`
--

CREATE TABLE `character` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL DEFAULT '',
  `picture` text NOT NULL DEFAULT '',
  `is_guilty` tinyint(1) NOT NULL,
  `is_suspect` tinyint(1) NOT NULL,
  `alibi` text NOT NULL DEFAULT '',
  `motive_id` int(11) DEFAULT NULL,
  `weapon_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `character`
--

INSERT INTO `character` (`id`, `name`, `picture`, `is_guilty`, `is_suspect`, `alibi`, `motive_id`, `weapon_id`) VALUES
(1, 'Yann', 'http://obeachback.jtdev.fr/public/images/yann.png', 0, 0, 'Il buvait un verre de St Emilion 1900 avec Baptiste dans le salon. Il s\'est absenté mais juste pour aller chercher un tire-bouchon dans la cuisine puis dans son bureau.', 2, 1),
(2, 'Baptiste', 'http://obeachback.jtdev.fr/public/images/baptiste.png', 0, 0, 'Buvait un verre de vin avec Yann dans le salon, mais yann est parti pendant un certain temps pour chercher un tire-bouchon.', 0, 1),
(3, 'Claire', 'http://obeachback.jtdev.fr/public/images/claire.png', 0, 0, 'Claire voyant Valentine malade, elle l\'accompagna dans la salle de bain du haut. Elle est parti 10mn chercher des médicaments dans sa chambre', 3, 1),
(4, 'Valentine', 'http://obeachback.jtdev.fr/public/images/claire.png', 0, 0, 'Etait malade dans la salle de bain de CLaire avec cette dernière qui s\'occupait d\'\'elle.', 4, 1),
(5, 'Lily', 'http://obeachback.jtdev.fr/public/images/lily.png', 0, 0, 'Est sensée être dans la maison voisine avec son frère.', 1, 1),
(6, 'Maxime', 'http://obeachback.jtdev.fr/public/images/maxime.png', 0, 0, 'Dans la maison voisine avec sa soeur.', 0, 1),
(7, 'Policier', 'http://obeachback.jtdev.fr/public/images/police.png', 0, 0, 'pas d\'alibi', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `motive`
--

CREATE TABLE `motive` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `motive`
--

INSERT INTO `motive` (`id`, `description`) VALUES
(1, 'Admiration obsessionnelle'),
(2, 'Politique, Tonya raconter ce qu\'elle savait à un journaliste'),
(3, 'Jalousie par rapport à Baptiste'),
(4, 'Jalousie par rapport à Dorian');

-- --------------------------------------------------------

--
-- Structure de la table `place`
--

CREATE TABLE `place` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL DEFAULT '',
  `picture` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `place`
--

INSERT INTO `place` (`id`, `name`, `picture`) VALUES
(1, 'Chez Dorian', 'http://obeachback.jtdev.fr/public/images/chez-dorian.png'),
(2, 'Devant chez Tonya', 'http://obeachback.jtdev.fr/public/images/devant-chez-tonya.jpg'),
(3, 'Chambre de Dorian', 'http://obeachback.jtdev.fr/public/images/chambre-dorian.jpg'),
(4, 'Cuisine', 'http://obeachback.jtdev.fr/public/images/cuisine.jpg'),
(5, 'Salon', 'http://obeachback.jtdev.fr/public/images/salon.jpg'),
(6, 'Plage de jour', 'http://obeachback.jtdev.fr/public/images/plage.png'),
(7, 'Plage de nuit', 'http://obeachback.jtdev.fr/public/images/crimescene.png'),
(8, 'Chambre de Claire et Baptiste', 'http://obeachback.jtdev.fr/public/images/chambre-claire.jpg'),
(9, 'Chambre de Tonya et Yann', 'http://obeachback.jtdev.fr/public/images/chambre-tonya.jpg'),
(10, 'Sale de bain', 'http://obeachback.jtdev.fr/public/images/sdb.jpg'),
(11, 'Bureau', 'photo'),
(12, 'Devant chez Tonya', 'http://obeachback.jtdev.fr/public/images/devantTonya.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `answer` text NOT NULL,
  `character_id` int(11) NOT NULL,
  `situation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `description`, `answer`, `character_id`, `situation_id`) VALUES
(1, 'Quel est ton métier ?', 'Je suis infirmière, j\'ai passé mon diplôme l\'an dernier.', 3, 6),
(2, 'Tu es amie avec Tonya depuis combien de temps ?', 'En fait, je suis la cousine de Yann, c\'est comme ça qu\'on se connaît.', 3, 6),
(3, 'Tu es très proches de Yann ?', 'Oui, on a beaucoup d\'intérêts en commun ! Le vin en est un *rires*', 2, 6),
(4, 'Alors Maxime ! Toi et Lily vous faites quoi dans la vie ?', 'Je suis actuellement en Science politique et ma soeur étudie en école de droits pour devenir avocate.', 6, 7),
(5, 'Vous vivez tous les deux en colocations pas loin d\'ici ?', 'Nous vivons chez nos parents, c\'est la maison aux palmiers à une centaine de mètres sur la droite d\'ici, tu as dû passer devant lors de ta… promenade…', 5, 7),
(6, 'Bonjour Yann, est ce que tu saurais où est Valentine ? Je l\'ai appelée mais elle ne me répond pas.', 'Non je n\'ai pas de nouvelles, elle a beaucoup bu hier soir et elle a été absente pendant un certain temps pendant la fête. Pas étonnant que tu n\'aies pas pu lui parler. D\'ailleurs, Claire aussi s\'\'est absentée à peu près au même moment...c\'est étrange.', 1, 11),
(7, 'Salut Claire, aurais tu des nouvelles de Valentine et saurais-tu pourquoi elle s\'est absentée aussi longtemps hier soir ?', 'Oui, j\'ai pris soin d\'elle dans ma salle de bain, elle avait beaucoup bu et m\'a parlé de toi, de la dispute avec Tonya. Je lui ai appelé un taxi après… tout ce qu\'\'il s\'\'est passé. Elle t\'aime beaucoup tu sais… * regard plein de reproches *', 3, 12),
(8, 'Hum Hum… Et toi Baptiste, toi tu es resté avec Yann toute la soirée. As tu remarqué quelque chose en l\'absence de Claire et Valentine ?', 'Heu non, Yann et moi on ne s\'est quasiment pas quitté de la soirée. Enfin sauf quand il est allé chercher un tire bouchon… *regard dans le vague* Enfin rien de surprenant...hum..bref.. * silence gêné*', 2, 12),
(9, 'Bonjour Maxime, tu es seul ? Tu as l\'air contrarié, ça va ?', 'Oui ma soeur m\'inquiète, elle est vraiment bouleversée elle récupère des affaires à elle dans la chambre de Tonya. J\'ai toujours trouvé qu\'\'elles étaient trop proches, et que Tonya avait une mauvaise influence sur elle.', 6, 13),
(10, 'Qu\'est ce que tu entends par là ?', 'Depuis qu\'elle connaît Tonya, elle est moins studieuse. Elle s\'est mise au surf et passe son temps avec elle. Elle a même commencé à changer de manière de s\'habiller, de s\'\'exprimer...', 6, 13),
(11, 'Tu étais où hier avant la soirée ?', 'Chez moi, j\'attendais que Lily se prépare. Elle met toujours 3 plombes… Après on vous a rejoint ensemble.', 6, 13),
(12, 'Salut Lily, qu\'est ce que tu fais ?', '*air surpris* Rien, je récupère des affaires que j\'avais prêté à Tonya… Je cherche mon collier...', 5, 14),
(13, 'Ton collier ? Il ressemble à quoi ?', 'C\'est une chaîne en or. Avec une planche de surf en pendentif...', 5, 14),
(14, 'Tu faisais quoi hier avant que vous arriviez à la soirée ?', 'J\'étais avec mon frère... *elle continue à chercher*', 5, 14),
(15, 'Avec ton frère? mais il m\'a dit que… *je la regarde fouiller* Tu veux que je t\'aide à chercher ?', 'Non, ça ira, il ne doit pas être là. Et puis, c\'est pas moi qu\'il faut interroger, c\'\'est Yann ! c\'est lui qui a des choses à cacher ! Il ne voulait pas que Tonya raconte tout sur lui dans les journaux ! J\'y vais salut!', 5, 14),
(16, 'Lily', 'Tu suspectes donc Lily ?', 7, 16),
(17, 'Admiration obsessionnelle', 'Oh, je vois, tu penses que le mobile est lié à une admiration obsessionnelle pour Tonya', 7, 17);

-- --------------------------------------------------------

--
-- Structure de la table `situation`
--

CREATE TABLE `situation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `situation`
--

INSERT INTO `situation` (`id`, `chapter_id`, `place_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 5),
(7, 7, 5),
(8, 8, 5),
(9, 9, 7),
(10, 10, 3),
(11, 11, 4),
(12, 12, 8),
(13, 13, 5),
(14, 14, 9),
(15, 15, 3),
(16, 16, 3),
(17, 17, 3),
(18, 18, 3),
(19, 19, 12);

-- --------------------------------------------------------

--
-- Structure de la table `situation_character`
--

CREATE TABLE `situation_character` (
  `id` int(11) NOT NULL,
  `situation_id` int(11) NOT NULL,
  `character_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `situation_character`
--

INSERT INTO `situation_character` (`id`, `situation_id`, `character_id`) VALUES
(1, 6, 3),
(2, 6, 2),
(3, 7, 6),
(4, 7, 5),
(5, 11, 1),
(6, 12, 3),
(7, 12, 2),
(8, 13, 6),
(9, 14, 5),
(10, 16, 7),
(11, 17, 7);

-- --------------------------------------------------------

--
-- Structure de la table `storytelling`
--

CREATE TABLE `storytelling` (
  `id` int(11) NOT NULL,
  `sentence` text NOT NULL,
  `chapter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `storytelling`
--

INSERT INTO `storytelling` (`id`, `sentence`, `chapter_id`) VALUES
(1, 'Juillet 2019, moi Dorian, Dev Freelance me retrouvait sans client pour l\'été lorsque je reçu une invitation de mon premier amour.', 1),
(2, 'Lorsque j\'arrive chez Tonya je découvre qu\'elle a un nouveau petit ami nommé Yann. Elle me propose d\'aller m\'\'installer dans ma chambre en attendant le restaurant puis la soirée avec des amis.', 2),
(3, 'Seul, je m\'\'assois un instant sur le lit, je ne comprends pas trop ce que je fais là et quoi penser de cette situation embarrassante. Je décide de faire bonne figure malgré tout et sors de la pièce.', 3),
(4, 'En arrivant dans la cuisine, j\'entends Tonya discuter avec une jeune fille. Mais elles s\'interrompent en me voyant. Tonya me présente Lily pendant que je me fais à manger. Puis Lily s\'en va et je me dispute avec Tonya', 4),
(5, 'En sortant de la cuisine je croise Valentine qui a entendu notre dispute. Je décide daller me promener un moment sur la plage pour décompresser.', 5),
(6, 'Un peu plus tard, je reviens dans le salon. Tout le monde est parti au resto. Puis les invités reviennent et Tonya part se préparer pour la soirée. Je rencontre le couple Claire/Baptiste. Ils ont l\'air gentils mais un peu distants.', 6),
(7, 'Quelque temps après, dans la soirée… Il est 23h00, c\'est le milieu de la soirée. Les voisins de Tonya et Yann arrivent. Je connais déjà Lily mais je découvre son frère Maxime.', 7),
(8, 'Ok, je comprends pourquoi tout le monde était froid avec moi. Tout le monde a entendu notre dispute avec Tonya plus tôt… D\'ailleurs où est Tonya ? Ca commence à faire très long, même pour elle…', 8),
(9, 'Je décide d\'aller la chercher mais ne la trouve pas dans sa chambre. Je préviens tout le monde et on commence à la chercher en l\'appelant.', 8),
(10, 'Pendant que tout le monde cherche dans la maison, je décide d\'aller la chercher sur la plage. Là, à quelques centaines de mètres de la maison, allongée par terre, je la retrouve face contre terre, un couteau planté dans le dos et le poing fermé sur une petite chose brillante. Une chaîne avec une planche de surf...', 9),
(11, 'Je tente de la réanimer en vain. La vie avait quitté son corps...', 9),
(12, 'Le lendemain matin, assis sur mon lit, je repense à cette soirée effroyable. La perte de cet être cher et… Les regards de tous sur moi.', 10),
(13, 'Ils me pensent coupable. J\'ai aperçu l\'arme du crime quand la police l\'a identifiée. Le couteau dont je me suis servi dans la cuisine, est l\'arme du crime. Il faut que je trouve le vrai meurtrier pour lui faire payer et prouver mon innocence avant d\'être arrêté...', 10),
(14, 'Je décide de descendre à la cuisine. L\'arme du crime vient d\'ici, peut être que je trouverai des indices. Je tombe nez à nez avec Yann, complètement abattu.', 11),
(15, 'Je me demande ce qu\'il s\'est passé, je vais aller voir Claire pour l\'interroger...', 12),
(16, 'Un peu choqué par la découverte des sentiments de Valentine, je décide de retourner voir Yann pour lui demander ce qu\'il a fait lorsqu\'il n\'était pas avec Baptiste. En arrivant dans le salon, je tombe sur Maxime. Il a l\'air stressé.', 13),
(17, 'Je décide d\'\'aller voir Lily. je trouve ces révélations de plus en plus étrange...', 14),
(18, 'Tout ça me semble de plus en plus étrange… Le comportement de Lily parait un peu psychotique mais sa révélation sur Yann… Mais il y a cette histoire de pendentif que je ne peux pas ignorer... Je dois appeler la police et leur faire part de ce que j\'ai appris !', 15),
(19, 'Ca y est je suis en ligne avec le lieutenant. Je dois choisir qui je pense être le coupable...', 16),
(20, 'Je dois choisir quel est le mobile...', 17),
(21, 'Lorsque la police arriva, je décidais de faire part de mes conclusions au lieutenant. Après vérification la police arrêta Lily. En effet, elle aimait Tonya. Mais peut être un peu trop… \nElle voulait prendre sa place. Alors elle décida de la tuer. Plus tard, j\'apprendrai ce qu\'\'il s\'était réellement passé...', 18),
(22, 'Après le restaurant, Lily qui faisait croire qu\'elle se préparait dans sa chambre dans la maison voisine, attirera Tonya dehors mais sans que personne ne les voit sortir. La chambre de tonya étant près de l\'entrée, il fallait qu\'elle aille dans sa chambre puis de là, qu\'elle l\'attire dehors par la porte de devant en lui disant qu\'elle n\'allait pas bien et qu\'elle ne voulait pas qu\'on la voit entrain de pleurer. Elle prétexta que son petit ami l\'avait quitté. Une fois dehors elle éloigna Tonya, et lui proposa une balade sur la plage pour pouvoir lui raconter son problème.\nAu bord de la plage, Tonya se plaignit de sa situation avec Yann, disant qu\'elle ne savait pas quoi faire pour le journaliste qu\'elle avait contacté car Yann était au courant du fait qu\'elle avait décidé de le dénoncer. Elle avoua également avoir encore des sentiments pour Dorian et qu\'elle ne savait plus quoi faire. Lily s\'énerva. Tonya se plaignait trop alors qu\'elle avait une vie parfaite, que tout le monde l\'aimait. Alors qu\'elle, même ses parents n\'en n\'avaient rien à faire d\'elle. Elle avoua vouloir prendre sa place.\nC\'est à ce moment là qu\'elle sortit le couteau de cuisine qu\'elle avait caché dans son sac après que je m\'en soit servi. Elle avait pris soin de mettre un gant pour qu\'il n\'y ait pas ses empreintes. Tonya prenant peur lui dit qu\'elle était folle, de ne plus s\'approcher d\'elle. Lily s\'énerva, et l\'attrapa. Tonya se débattit et se faisant, arracha le collier de Lily sans que celle ci ne se rende compte.\nArrivant à se libérer de l\'étreinte de Lily, elle s\'éloigna à pas rapides le collier toujours dans son poing serré. Lily la rattrapa et lui enfonça le couteau dans le dos au niveau des poumons. Tonya tomba à terre, elle tenta de crier mais elle avait le souffle coupé et la musique venant de la soirée de la maison est bien trop forte pour qu\'on l\'entende.\nLily, prise de panique traîna le corps de Tonya au bord de l\'eau dans l\'espoir d\'effacer des traces de lutte sur son corps et sous ses ongles. Puis elle reparti dans sa maison, se redonna une consistance et appela son frère pour qu\'ils partent ensemble à la soirée. Plus tard elle me dira, ainsi qu\'à la police, qu\'\'elle était dans sa chambre à se préparer pendant l\'\'heure du meurtre et poussera la police à croire que Yann ou moi même étions les vrais coupables.\nLe collier, un cadeau que Tonya lui avait fait, fut le seul dérapage dans son plan machiavélique. C\'est comme cela que \'étudiante en droit finit derrière les barreaux pour très longtemps...', 19);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `pseudo` text NOT NULL,
  `pwd` text NOT NULL,
  `mail` text NOT NULL,
  `all_chapter` int(11) NOT NULL,
  `chapter_counter` int(11) NOT NULL,
  `story_counter` int(11) NOT NULL,
  `question_counter` int(11) NOT NULL,
  `situation_counter` int(11) NOT NULL,
  `should_display_question` tinyint(1) NOT NULL DEFAULT 0,
  `should_display_chapter` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `weapon`
--

CREATE TABLE `weapon` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `weapon`
--

INSERT INTO `weapon` (`id`, `name`) VALUES
(1, 'Couteau');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `character`
--
ALTER TABLE `character`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `motive`
--
ALTER TABLE `motive`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `situation`
--
ALTER TABLE `situation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `situation_character`
--
ALTER TABLE `situation_character`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `storytelling`
--
ALTER TABLE `storytelling`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `weapon`
--
ALTER TABLE `weapon`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chapter`
--
ALTER TABLE `chapter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `character`
--
ALTER TABLE `character`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `motive`
--
ALTER TABLE `motive`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `place`
--
ALTER TABLE `place`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `situation`
--
ALTER TABLE `situation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `situation_character`
--
ALTER TABLE `situation_character`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `storytelling`
--
ALTER TABLE `storytelling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `weapon`
--
ALTER TABLE `weapon`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
