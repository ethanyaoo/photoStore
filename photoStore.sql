SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `photoStore`
--

-- --------------------------------------------------------

--
-- Table structure for table `uploader`
--

DROP TABLE IF EXISTS `uploader`;
CREATE TABLE IF NOT EXISTS `uploader` (
  `member_username` varchar(20) NOT NULL,
  `owner_username` varchar(20) NOT NULL,
  `_groupName` varchar(20) NOT NULL,
  PRIMARY KEY (`member_username`,`owner_username`,`_groupName`),
  KEY `owner_username` (`owner_username`,`_groupName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploader`
--

INSERT INTO `uploader` (`member_username`, `owner_username`, `_groupName`) VALUES
('indraratna', 'indraratna', 'HelloWorld'),
('indraratna', 'indraratna', 'HelloWorld2'),
('indraratna', 'indraratna', 'HelloWorld3'),
('indraratna', 'indraratna', 'HelloWOrld4');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE IF NOT EXISTS `subscribe` (
  `username_subscribed` varchar(20) NOT NULL,
  `username_subscriber` varchar(20) NOT NULL,
  `subscribestatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`username_subscribed`,`username_subscriber`),
  KEY `username_subscriber` (`username_subscriber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`username_subscribed`, `username_subscriber`, `subscribestatus`) VALUES
('indraratna', 'indraratna', 1),
('indraratna1', 'indraratna', 1),
('katrinaparedes', 'katrinaparedes', 1),
('john', 'doe', 1),
('jane', 'doe', 0),
('ethanyao', 'katrinaparedes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `_group`;
CREATE TABLE IF NOT EXISTS `_group` (
  `_groupAdmin` varchar(20) NOT NULL,
  `_groupName` varchar(20) NOT NULL,
  PRIMARY KEY (`_groupAdmin`,`_groupName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group`
--

INSERT INTO `_group` (`_groupAdmin`, `_groupName`) VALUES
('indraratna', 'HelloWOrld'),
('ethanyao', 'HelloWorld2'),
('katrinaparedes', 'HelloWorld');

-- --------------------------------------------------------

--
-- Table structure for table `thumbsUp`
--

DROP TABLE IF EXISTS `thumbsUp`;
CREATE TABLE IF NOT EXISTS `thumbsUp` (
  `username` varchar(20) NOT NULL,
  `photoID` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`,`photoID`),
  KEY `photoID` (`photoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thumbsUp`
--

INSERT INTO `thumbsUp` (`username`, `photoID`, `rating`) VALUES
('indraratna', 1, 10),
('ethanyao', 2, 5),
('katrinaparedes', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `username` varchar(20) NOT NULL,
  `password` char(64) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`username`, `password`, `firstName`, `lastName`, `bio`) VALUES
('indraratna', '18af506a16e07377a8be5dfc40e93c7617c1d27ad77fca0001781d87d4c1e270', 'Indra', 'Ratna', ''),
('tester', 'cf80cd8aed482d5d1527d7dc72fceff84e6326592848447d2dc0b0e87dfc9a90', 'test', 'test', ''),
('ethanyao', '7ce449fee76531d1c0c1561f7f09c6228ac784c3b14dd4a8462cfb08d7cacc54', 'Ethan', 'Yao', ''),
('katrinaparedes', '737e3f2399949a0879caecfc4bd451b4ee7bb59beadd5ad414204a661c15559a', 'Katrina', 'Paredes', ''),
('bob', 'pass1', 'Bob', 'Lee', 'Dance Moms Leader'),
('bobby', 'pass2', 'Bobby', 'Brown', 'Abbys Partner');


-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `photoID` int(11) NOT NULL AUTO_INCREMENT,
  `postingdate` datetime DEFAULT NULL,
  `filepath` varchar(2048) DEFAULT NULL,
  `allSubscribers` tinyint(1) DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `photoPoster` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`photoID`),
  KEY `photoPoster` (`photoPoster`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`photoID`, `postingdate`, `filepath`, `allSubscribers`, `caption`, `photoPoster`) VALUES
(1, '2019-11-25 14:42:14', 'cat.jpg', 1, '', 'jackzheng'),
(2, '2019-11-25 14:49:42', 'dog.jpg', 1, '', 'jackzheng'),
(8, '2019-11-27 00:00:00', './roommates_b.jpg', 1, 'roommates', 'bobby'),
(4, '2019-11-28 00:00:00', 'dog.jpg', 1, NULL, 'weileenchen'),
(3, '2019-11-27 00:00:00', 'cat.jpg', 0, NULL, 'weileenchen'),
(9, '2019-11-27 00:00:00', './roommates_a.jpg', 1, 'roommates', 'abby'),
(10, '2019-11-27 00:00:00', './bowling_team.jpg', 0, 'bowlingTeam', 'bobby'),
(11, '2019-11-27 00:00:00', './family_bora_bora.jpg', 0, 'family vaca', 'abby');

-- --------------------------------------------------------

--
-- Table structure for table `sharedwith`
--

DROP TABLE IF EXISTS `sharedwith`;
CREATE TABLE IF NOT EXISTS `sharedwith` (
  `groupAdmin` varchar(20) NOT NULL,
  `groupName` varchar(20) NOT NULL,
  `photoID` int(11) NOT NULL,
  PRIMARY KEY (`groupAdmin`,`groupName`,`photoID`),
  KEY `photoID` (`photoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
