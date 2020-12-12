SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

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
  PRIMARY KEY (`member_username`,`owner_username`),
  KEY `owner_username` (`owner_username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploader`
--

INSERT INTO `uploader` (`member_username`, `owner_username` ) VALUE
('indraratna', 'indraratna');

-- --------------------------------------------------------

--
-- Table structure for table `thumbsUp`
--

DROP TABLE IF EXISTS `thumbsUp`;
CREATE TABLE IF NOT EXISTS `thumbsUp` (
  `username` varchar(20) NOT NULL,
  `photoID` int(11) NOT NULL,
  PRIMARY KEY (`username`,`photoID`),
  KEY `photoID` (`photoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thumbsUp`
--

INSERT INTO `thumbsUp` (`username`, `photoID`) VALUES
('indraratna', 1),
('ethanyao', 2),
('katrinaparedes', 1);

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
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
CREATE TABLE IF NOT EXISTS `photos` (
  `photoID` int(11) NOT NULL AUTO_INCREMENT,
  `postingdate` datetime DEFAULT NULL,
  `filepath` varchar(2048) DEFAULT NULL,
  `photoPoster` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`photoID`),
  KEY `photoPoster` (`photoPoster`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photos` (`photoID`, `postingdate`, `filepath`, `photoPoster`) VALUES
(1, '2020-11-25 14:42:14', 'xkcd1.png', 'indraratna'),
(2, '2020-11-25 14:49:42', 'xkcd2.png', 'ethanyao'),
(3, '2020-11-27 00:00:00', 'xkcd3.png', 'katrinaparedes'),
(4, '2020-12-10 00:00:00', 'xkcd4.png', 'tester'),
(5, '2020-12-10 00:00:00', 'xkcd5.png', 'tester'),
(6, '2020-12-11 00:00:00', 'xkcd5.png', 'tester'),
(7, '2020-12-11 00:00:00', 'xkcd5.png', 'tester');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `photoID` int(11) DEFAULT NULL,
  `username_commenter` varchar(20) DEFAULT NULL,
  `comment` varchar(200) NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `photoID` (`photoID`),
  KEY `username_commenter` (`username_commenter`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentID`, `photoID`, `username_commenter`, `comment`) VALUES
(1, 4, 'indraratna', '123'),
(2, 4, 'katrinaparedes', 'abc'),
(3, 4, 'ethanyao', 'xyz');


-- --------------------------------------------------------
