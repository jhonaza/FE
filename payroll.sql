/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : payroll

 Target Server Type    : MySQL
 Target Server Version : 100128
 File Encoding         : 65001

 Date: 06/12/2022 10:11:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for check
-- ----------------------------
DROP TABLE IF EXISTS `check`;
CREATE TABLE `check`  (
  `CheckId` int NOT NULL AUTO_INCREMENT,
  `CheckCode` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CheckBranchNumber` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CheckDate` date NOT NULL,
  `CheckAmount` double NOT NULL,
  `CheckFee` double NOT NULL,
  `CheckImage` longblob NOT NULL,
  `Check_CheckTypeId` int NOT NULL,
  PRIMARY KEY (`CheckId`) USING BTREE,
  INDEX `fk_Check_CheckType1_idx`(`Check_CheckTypeId` ASC) USING BTREE,
  CONSTRAINT `fk_Check_CheckType1` FOREIGN KEY (`Check_CheckTypeId`) REFERENCES `checktype` (`CheckTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of check
-- ----------------------------

-- ----------------------------
-- Table structure for checktransaction
-- ----------------------------
DROP TABLE IF EXISTS `checktransaction`;
CREATE TABLE `checktransaction`  (
  `CheckTransactionId` int NOT NULL AUTO_INCREMENT,
  `CheckTransaction_TransactionId` int NOT NULL,
  `CheckTransaction_CheckId` int NOT NULL,
  `CheckTransaction_CompanyId` int NOT NULL,
  PRIMARY KEY (`CheckTransactionId`) USING BTREE,
  INDEX `fk_Transaction_has_Check_Check1_idx`(`CheckTransaction_CheckId` ASC) USING BTREE,
  INDEX `fk_Transaction_has_Check_Transaction1_idx`(`CheckTransaction_TransactionId` ASC) USING BTREE,
  INDEX `fk_CheckTransaction_Company1_idx`(`CheckTransaction_CompanyId` ASC) USING BTREE,
  CONSTRAINT `fk_CheckTransaction_Company1` FOREIGN KEY (`CheckTransaction_CompanyId`) REFERENCES `company` (`CompanyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_has_Check_Check1` FOREIGN KEY (`CheckTransaction_CheckId`) REFERENCES `check` (`CheckId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_has_Check_Transaction1` FOREIGN KEY (`CheckTransaction_TransactionId`) REFERENCES `transaction` (`TransactionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of checktransaction
-- ----------------------------

-- ----------------------------
-- Table structure for checktype
-- ----------------------------
DROP TABLE IF EXISTS `checktype`;
CREATE TABLE `checktype`  (
  `CheckTypeId` int NOT NULL AUTO_INCREMENT,
  `CheckTypeName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CheckTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of checktype
-- ----------------------------
INSERT INTO `checktype` VALUES (1, 'Commercial');
INSERT INTO `checktype` VALUES (5, 'Payroll');
INSERT INTO `checktype` VALUES (6, 'Individual');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `CityId` int NOT NULL AUTO_INCREMENT,
  `CityName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `City_ProvinceId` int NOT NULL,
  PRIMARY KEY (`CityId`) USING BTREE,
  INDEX `fk_City_Province1_idx`(`City_ProvinceId` ASC) USING BTREE,
  CONSTRAINT `fk_City_Province1` FOREIGN KEY (`City_ProvinceId`) REFERENCES `province` (`ProvinceId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 386 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, 'Barrie', 1);
INSERT INTO `city` VALUES (2, 'Belleville', 1);
INSERT INTO `city` VALUES (3, 'Brampton', 1);
INSERT INTO `city` VALUES (5, 'Brantford', 1);
INSERT INTO `city` VALUES (6, 'Brockville', 1);
INSERT INTO `city` VALUES (7, 'Burlington', 1);
INSERT INTO `city` VALUES (8, 'Cambridge', 1);
INSERT INTO `city` VALUES (9, 'Chatham-Kent', 1);
INSERT INTO `city` VALUES (11, 'Cornwall', 1);
INSERT INTO `city` VALUES (12, 'Dryden', 1);
INSERT INTO `city` VALUES (13, 'Etobicoke', 1);
INSERT INTO `city` VALUES (14, 'Greater Sudbury', 1);
INSERT INTO `city` VALUES (15, 'Guelph', 1);
INSERT INTO `city` VALUES (16, 'Concord', 1);
INSERT INTO `city` VALUES (17, 'Hamilton', 1);
INSERT INTO `city` VALUES (19, 'Kenora', 1);
INSERT INTO `city` VALUES (20, 'Kingston', 1);
INSERT INTO `city` VALUES (21, 'Kitchener', 1);
INSERT INTO `city` VALUES (22, 'London', 1);
INSERT INTO `city` VALUES (23, 'Mississauga', 1);
INSERT INTO `city` VALUES (24, 'Niagara Falls', 1);
INSERT INTO `city` VALUES (25, 'Condado de Norfolk', 1);
INSERT INTO `city` VALUES (26, 'North Bay', 1);
INSERT INTO `city` VALUES (27, 'Orillia', 1);
INSERT INTO `city` VALUES (28, 'Oshawa', 1);
INSERT INTO `city` VALUES (29, 'Ottawa', 1);
INSERT INTO `city` VALUES (31, 'Peterborough', 1);
INSERT INTO `city` VALUES (32, 'Pickering', 1);
INSERT INTO `city` VALUES (36, 'Sarnia', 1);
INSERT INTO `city` VALUES (37, 'Sault Ste. Marie', 1);
INSERT INTO `city` VALUES (38, 'St. Catharines', 1);
INSERT INTO `city` VALUES (39, 'St. Thomas', 1);
INSERT INTO `city` VALUES (40, 'Stratford', 1);
INSERT INTO `city` VALUES (41, 'Temiskaming Shores', 1);
INSERT INTO `city` VALUES (42, 'Thorold', 1);
INSERT INTO `city` VALUES (43, 'Thunder Bay', 1);
INSERT INTO `city` VALUES (44, 'Timmins', 1);
INSERT INTO `city` VALUES (45, 'Toronto', 1);
INSERT INTO `city` VALUES (46, 'Vaughan', 1);
INSERT INTO `city` VALUES (47, 'Waterloo', 1);
INSERT INTO `city` VALUES (48, 'Welland', 1);
INSERT INTO `city` VALUES (49, 'Windsor', 1);
INSERT INTO `city` VALUES (50, 'Woodstock', 1);
INSERT INTO `city` VALUES (52, 'Alma', 2);
INSERT INTO `city` VALUES (53, 'Amos', 2);
INSERT INTO `city` VALUES (60, 'Baie d\'Urfé', 2);
INSERT INTO `city` VALUES (62, 'Beaconsfield', 2);
INSERT INTO `city` VALUES (64, 'Blainville', 2);
INSERT INTO `city` VALUES (65, 'Bois des Filion', 2);
INSERT INTO `city` VALUES (66, 'Boisbriand', 2);
INSERT INTO `city` VALUES (67, 'Bonaventure', 2);
INSERT INTO `city` VALUES (68, 'Boucherville', 2);
INSERT INTO `city` VALUES (69, 'Bromont', 2);
INSERT INTO `city` VALUES (70, 'Brossard', 2);
INSERT INTO `city` VALUES (71, 'Brownsburg Chatham', 2);
INSERT INTO `city` VALUES (72, 'Candiac', 2);
INSERT INTO `city` VALUES (73, 'Cap Chat', 2);
INSERT INTO `city` VALUES (74, 'Cap Santé', 2);
INSERT INTO `city` VALUES (75, 'Carignan', 2);
INSERT INTO `city` VALUES (76, 'Carleton sur Mer', 2);
INSERT INTO `city` VALUES (77, 'Causapscal', 2);
INSERT INTO `city` VALUES (78, 'Chambly', 2);
INSERT INTO `city` VALUES (79, 'Chandler', 2);
INSERT INTO `city` VALUES (80, 'Chapais', 2);
INSERT INTO `city` VALUES (81, 'Charlemagne', 2);
INSERT INTO `city` VALUES (82, 'Châteauguay', 2);
INSERT INTO `city` VALUES (83, 'Château-Richer', 2);
INSERT INTO `city` VALUES (84, 'Chibougamau', 2);
INSERT INTO `city` VALUES (85, 'Clermont', 2);
INSERT INTO `city` VALUES (86, 'Coaticook', 2);
INSERT INTO `city` VALUES (87, 'Contrecœur', 2);
INSERT INTO `city` VALUES (88, 'Cookshire Eaton', 2);
INSERT INTO `city` VALUES (89, 'Côte Saint Luc', 2);
INSERT INTO `city` VALUES (90, 'Cowansville', 2);
INSERT INTO `city` VALUES (91, 'Danville', 2);
INSERT INTO `city` VALUES (92, 'Daveluyville', 2);
INSERT INTO `city` VALUES (93, 'Dégelis', 2);
INSERT INTO `city` VALUES (94, 'Delson', 2);
INSERT INTO `city` VALUES (95, 'Desbiens', 2);
INSERT INTO `city` VALUES (96, 'Deux Montagnes', 2);
INSERT INTO `city` VALUES (97, 'Disraeli', 2);
INSERT INTO `city` VALUES (98, 'Dolbeau Mistassini', 2);
INSERT INTO `city` VALUES (99, 'Dollard Des Ormeaux', 2);
INSERT INTO `city` VALUES (100, 'Donnacona', 2);
INSERT INTO `city` VALUES (101, 'Dorval', 2);
INSERT INTO `city` VALUES (102, 'Drummondville', 2);
INSERT INTO `city` VALUES (103, 'Dunham', 2);
INSERT INTO `city` VALUES (104, 'Duparquet', 2);
INSERT INTO `city` VALUES (105, 'East Angus', 2);
INSERT INTO `city` VALUES (106, 'L\'Épiphanie', 2);
INSERT INTO `city` VALUES (107, 'Estérel', 2);
INSERT INTO `city` VALUES (108, 'Farnham', 2);
INSERT INTO `city` VALUES (109, 'Fermont', 2);
INSERT INTO `city` VALUES (110, 'Forestville', 2);
INSERT INTO `city` VALUES (111, 'Fossambault sur le Lac', 2);
INSERT INTO `city` VALUES (112, 'Gaspé', 2);
INSERT INTO `city` VALUES (113, 'Gatineau', 2);
INSERT INTO `city` VALUES (114, 'Gracefield', 2);
INSERT INTO `city` VALUES (115, 'Granby', 2);
INSERT INTO `city` VALUES (116, 'Grande Rivière', 2);
INSERT INTO `city` VALUES (117, 'Hampstead', 2);
INSERT INTO `city` VALUES (118, 'Hudson', 2);
INSERT INTO `city` VALUES (119, 'Huntingdon', 2);
INSERT INTO `city` VALUES (120, 'L\'Île Cadieux', 2);
INSERT INTO `city` VALUES (121, 'L\'Île Dorval', 2);
INSERT INTO `city` VALUES (122, 'L\'Île Perrot', 2);
INSERT INTO `city` VALUES (123, 'Joliette', 2);
INSERT INTO `city` VALUES (124, 'Kingsey Falls', 2);
INSERT INTO `city` VALUES (125, 'Kirkland', 2);
INSERT INTO `city` VALUES (126, 'Lac Brome', 2);
INSERT INTO `city` VALUES (127, 'Lac Delage', 2);
INSERT INTO `city` VALUES (128, 'Lac Mégantic', 2);
INSERT INTO `city` VALUES (129, 'Lac Saint Joseph', 2);
INSERT INTO `city` VALUES (130, 'Lac Sergent', 2);
INSERT INTO `city` VALUES (131, 'Lachute', 2);
INSERT INTO `city` VALUES (132, 'Laval', 2);
INSERT INTO `city` VALUES (133, 'Lavaltrie', 2);
INSERT INTO `city` VALUES (134, 'Lebel sur Quévillon', 2);
INSERT INTO `city` VALUES (135, 'Léry', 2);
INSERT INTO `city` VALUES (136, 'Lévis', 2);
INSERT INTO `city` VALUES (137, 'Longueuil', 2);
INSERT INTO `city` VALUES (138, 'Lorraine', 2);
INSERT INTO `city` VALUES (139, 'Louiseville', 2);
INSERT INTO `city` VALUES (140, 'Macamic', 2);
INSERT INTO `city` VALUES (141, 'Magog', 2);
INSERT INTO `city` VALUES (142, 'Malartic', 2);
INSERT INTO `city` VALUES (143, 'La Malbaie', 2);
INSERT INTO `city` VALUES (144, 'Maniwaki', 2);
INSERT INTO `city` VALUES (145, 'Marieville', 2);
INSERT INTO `city` VALUES (146, 'Mascouche', 2);
INSERT INTO `city` VALUES (147, 'Matagami', 2);
INSERT INTO `city` VALUES (148, 'Matane', 2);
INSERT INTO `city` VALUES (149, 'Mercier', 2);
INSERT INTO `city` VALUES (150, 'Métabetchouan Lac à la Croix', 2);
INSERT INTO `city` VALUES (151, 'Métis sur Mer', 2);
INSERT INTO `city` VALUES (152, 'Mirabel', 2);
INSERT INTO `city` VALUES (153, 'Mont Joli', 2);
INSERT INTO `city` VALUES (154, 'Mont Laurier', 2);
INSERT INTO `city` VALUES (155, 'Mont Royal', 2);
INSERT INTO `city` VALUES (156, 'Mont Saint Hilaire', 2);
INSERT INTO `city` VALUES (157, 'Mont Tremblant', 2);
INSERT INTO `city` VALUES (158, 'Montmagny', 2);
INSERT INTO `city` VALUES (159, 'Montreal', 2);
INSERT INTO `city` VALUES (160, 'Montréal Est', 2);
INSERT INTO `city` VALUES (161, 'Montréal Ouest', 2);
INSERT INTO `city` VALUES (162, 'Murdochville', 2);
INSERT INTO `city` VALUES (163, 'Neuville', 2);
INSERT INTO `city` VALUES (164, 'New Richmond', 2);
INSERT INTO `city` VALUES (165, 'Nicolet', 2);
INSERT INTO `city` VALUES (166, 'Normandin', 2);
INSERT INTO `city` VALUES (167, 'Notre Dame de l\'Île Perrot', 2);
INSERT INTO `city` VALUES (168, 'Notre Dame des Prairies', 2);
INSERT INTO `city` VALUES (169, 'Otterburn Park', 2);
INSERT INTO `city` VALUES (170, 'Paspébiac', 2);
INSERT INTO `city` VALUES (171, 'Percé', 2);
INSERT INTO `city` VALUES (172, 'Pincourt', 2);
INSERT INTO `city` VALUES (173, 'Plessisville', 2);
INSERT INTO `city` VALUES (174, 'La Pocatière', 2);
INSERT INTO `city` VALUES (175, 'Pohénégamook', 2);
INSERT INTO `city` VALUES (176, 'Pointe Claire', 2);
INSERT INTO `city` VALUES (177, 'Pont Rouge', 2);
INSERT INTO `city` VALUES (178, 'Port Cartier', 2);
INSERT INTO `city` VALUES (179, 'Portneuf', 2);
INSERT INTO `city` VALUES (180, 'La Prairie', 2);
INSERT INTO `city` VALUES (181, 'Princeville', 2);
INSERT INTO `city` VALUES (182, 'Prévost', 2);
INSERT INTO `city` VALUES (183, 'Quebec', 2);
INSERT INTO `city` VALUES (184, 'Repentigny', 2);
INSERT INTO `city` VALUES (185, 'Richelieu', 2);
INSERT INTO `city` VALUES (186, 'Richmond', 2);
INSERT INTO `city` VALUES (187, 'Rimouski', 2);
INSERT INTO `city` VALUES (188, 'Rivière du Loup', 2);
INSERT INTO `city` VALUES (189, 'Rivière Rouge', 2);
INSERT INTO `city` VALUES (190, 'Roberval', 2);
INSERT INTO `city` VALUES (191, 'Rosemère', 2);
INSERT INTO `city` VALUES (192, 'Rouyn Noranda', 2);
INSERT INTO `city` VALUES (193, 'Saguenay', 2);
INSERT INTO `city` VALUES (194, 'Sainte Adèle', 2);
INSERT INTO `city` VALUES (195, 'Sainte Agathe des Monts', 2);
INSERT INTO `city` VALUES (196, 'Sainte Anne de Beaupré', 2);
INSERT INTO `city` VALUES (197, 'Sainte Anne de Bellevue', 2);
INSERT INTO `city` VALUES (198, 'Sainte Anne des Monts', 2);
INSERT INTO `city` VALUES (199, 'Sainte Anne des Plaines', 2);
INSERT INTO `city` VALUES (200, 'Saint Augustin de Desmaures', 2);
INSERT INTO `city` VALUES (201, 'Saint Basile', 2);
INSERT INTO `city` VALUES (202, 'Saint Basile le Grand', 2);
INSERT INTO `city` VALUES (203, 'Saint Bruno de Montarville', 2);
INSERT INTO `city` VALUES (204, 'Sainte Catherine', 2);
INSERT INTO `city` VALUES (205, 'Sainte Catherine de la Jacques Cartier', 2);
INSERT INTO `city` VALUES (206, 'Saint Césaire', 2);
INSERT INTO `city` VALUES (207, 'Saint Constant', 2);
INSERT INTO `city` VALUES (208, 'Saint Eustache', 2);
INSERT INTO `city` VALUES (209, 'Saint Félicien', 2);
INSERT INTO `city` VALUES (210, 'Saint Gabriel', 2);
INSERT INTO `city` VALUES (211, 'Saint Georges', 2);
INSERT INTO `city` VALUES (212, 'Saint Hyacinthe', 2);
INSERT INTO `city` VALUES (213, 'Saint Jean sur Richelieu', 2);
INSERT INTO `city` VALUES (214, 'Saint Jérôme', 2);
INSERT INTO `city` VALUES (215, 'Saint Joseph de Beauce', 2);
INSERT INTO `city` VALUES (216, 'Saint Joseph de Sorel', 2);
INSERT INTO `city` VALUES (217, 'Sainte Julie', 2);
INSERT INTO `city` VALUES (218, 'Saint Lambert', 2);
INSERT INTO `city` VALUES (219, 'Saint Lazare', 2);
INSERT INTO `city` VALUES (220, 'Saint Lin Laurentides', 2);
INSERT INTO `city` VALUES (221, 'Saint Marc des Carrières', 2);
INSERT INTO `city` VALUES (222, 'Sainte Marguerite du Lac Masson', 2);
INSERT INTO `city` VALUES (223, 'Sainte Marie', 2);
INSERT INTO `city` VALUES (224, 'Sainte Marthe sur le Lac', 2);
INSERT INTO `city` VALUES (225, 'Saint Ours', 2);
INSERT INTO `city` VALUES (226, 'Saint Pamphile', 2);
INSERT INTO `city` VALUES (227, 'Saint Pascal', 2);
INSERT INTO `city` VALUES (228, 'Saint Pie', 2);
INSERT INTO `city` VALUES (229, 'Saint Raymond', 2);
INSERT INTO `city` VALUES (230, 'Saint Rémi', 2);
INSERT INTO `city` VALUES (231, 'Saint Sauveur', 2);
INSERT INTO `city` VALUES (232, 'Sainte Thérèse', 2);
INSERT INTO `city` VALUES (233, 'Saint Tite', 2);
INSERT INTO `city` VALUES (234, 'Salaberry de Valleyfield', 2);
INSERT INTO `city` VALUES (235, 'La Sarre', 2);
INSERT INTO `city` VALUES (236, 'Schefferville', 2);
INSERT INTO `city` VALUES (237, 'Scotstown', 2);
INSERT INTO `city` VALUES (238, 'Senneterre', 2);
INSERT INTO `city` VALUES (239, 'Sept Îles', 2);
INSERT INTO `city` VALUES (240, 'Shawinigan', 2);
INSERT INTO `city` VALUES (241, 'Sherbrooke', 2);
INSERT INTO `city` VALUES (242, 'Sorel Tracy', 2);
INSERT INTO `city` VALUES (243, 'Stanstead', 2);
INSERT INTO `city` VALUES (244, 'Sutton', 2);
INSERT INTO `city` VALUES (245, 'Témiscaming', 2);
INSERT INTO `city` VALUES (246, 'Terrebonne', 2);
INSERT INTO `city` VALUES (247, 'Thetford Mines', 2);
INSERT INTO `city` VALUES (248, 'Thurso', 2);
INSERT INTO `city` VALUES (249, 'Trois Pistoles', 2);
INSERT INTO `city` VALUES (250, 'Trois Rivières', 2);
INSERT INTO `city` VALUES (251, 'La Tuque', 2);
INSERT INTO `city` VALUES (252, 'Val d\'Or', 2);
INSERT INTO `city` VALUES (253, 'Valcourt', 2);
INSERT INTO `city` VALUES (254, 'Varennes', 2);
INSERT INTO `city` VALUES (255, 'Vaudreuil Dorion', 2);
INSERT INTO `city` VALUES (256, 'Victoriaville', 2);
INSERT INTO `city` VALUES (257, 'Ville-Marie', 2);
INSERT INTO `city` VALUES (258, 'Warwick', 2);
INSERT INTO `city` VALUES (259, 'Waterloo', 2);
INSERT INTO `city` VALUES (260, 'Waterville', 2);
INSERT INTO `city` VALUES (261, 'Westmount', 2);
INSERT INTO `city` VALUES (262, 'Windsor', 2);
INSERT INTO `city` VALUES (263, 'Halifax', 3);
INSERT INTO `city` VALUES (264, 'Sydney', 3);
INSERT INTO `city` VALUES (265, 'Dartmouth', 3);
INSERT INTO `city` VALUES (266, 'Bathurst', 4);
INSERT INTO `city` VALUES (267, 'Campbellton', 4);
INSERT INTO `city` VALUES (268, 'Dieppe', 4);
INSERT INTO `city` VALUES (269, 'Edmundston', 4);
INSERT INTO `city` VALUES (270, 'Fredericton', 4);
INSERT INTO `city` VALUES (271, 'Miramichi', 4);
INSERT INTO `city` VALUES (272, 'Moncton', 4);
INSERT INTO `city` VALUES (273, 'Saint John', 4);
INSERT INTO `city` VALUES (274, 'Brandon', 5);
INSERT INTO `city` VALUES (275, 'Dauphin', 5);
INSERT INTO `city` VALUES (276, 'Flin Flon', 5);
INSERT INTO `city` VALUES (277, 'Portage La Prairie', 5);
INSERT INTO `city` VALUES (278, 'Selkirk', 5);
INSERT INTO `city` VALUES (279, 'Steinbach', 5);
INSERT INTO `city` VALUES (280, 'Thompson', 5);
INSERT INTO `city` VALUES (281, 'Winkler', 5);
INSERT INTO `city` VALUES (282, 'Winnipeg', 5);
INSERT INTO `city` VALUES (283, 'Abbotsford', 6);
INSERT INTO `city` VALUES (284, 'Armstrong', 6);
INSERT INTO `city` VALUES (285, 'Brunaby', 6);
INSERT INTO `city` VALUES (286, 'Campbell River', 6);
INSERT INTO `city` VALUES (287, 'Castlegar', 6);
INSERT INTO `city` VALUES (288, 'Chilliwack', 6);
INSERT INTO `city` VALUES (289, 'Colwood', 6);
INSERT INTO `city` VALUES (290, 'Coquitlam', 6);
INSERT INTO `city` VALUES (291, 'Courtenay', 6);
INSERT INTO `city` VALUES (292, 'Cranbrook', 6);
INSERT INTO `city` VALUES (293, 'Dawson Creek', 6);
INSERT INTO `city` VALUES (294, 'Duncan', 6);
INSERT INTO `city` VALUES (295, 'Enderby', 6);
INSERT INTO `city` VALUES (296, 'Fernie', 6);
INSERT INTO `city` VALUES (297, 'Fort St. John', 6);
INSERT INTO `city` VALUES (298, 'Grand Forks', 6);
INSERT INTO `city` VALUES (299, 'Greenwood', 6);
INSERT INTO `city` VALUES (300, 'Kamloops', 6);
INSERT INTO `city` VALUES (301, 'Kelowna', 6);
INSERT INTO `city` VALUES (302, 'Kimberley', 6);
INSERT INTO `city` VALUES (303, 'Kitimat', 6);
INSERT INTO `city` VALUES (304, 'Langford', 6);
INSERT INTO `city` VALUES (305, 'Langley', 6);
INSERT INTO `city` VALUES (306, 'Merritt', 6);
INSERT INTO `city` VALUES (307, 'Nanaimo', 6);
INSERT INTO `city` VALUES (308, 'Nelson', 6);
INSERT INTO `city` VALUES (309, 'New Westminster', 6);
INSERT INTO `city` VALUES (310, 'North Vancouver', 6);
INSERT INTO `city` VALUES (311, 'Parksville', 6);
INSERT INTO `city` VALUES (312, 'Penticton', 6);
INSERT INTO `city` VALUES (313, 'Pitt Meadows', 6);
INSERT INTO `city` VALUES (314, 'Port Alberni', 6);
INSERT INTO `city` VALUES (315, 'Port Coquitlam', 6);
INSERT INTO `city` VALUES (316, 'Port Moody', 6);
INSERT INTO `city` VALUES (317, 'Powell River', 6);
INSERT INTO `city` VALUES (318, 'Prince George', 6);
INSERT INTO `city` VALUES (319, 'Prince Rupert', 6);
INSERT INTO `city` VALUES (320, 'Quesnel', 6);
INSERT INTO `city` VALUES (321, 'Revelstoke', 6);
INSERT INTO `city` VALUES (322, 'Richmond', 6);
INSERT INTO `city` VALUES (323, 'Rossland', 6);
INSERT INTO `city` VALUES (324, 'Salmon Arm', 6);
INSERT INTO `city` VALUES (325, 'Surrey', 6);
INSERT INTO `city` VALUES (326, 'Terrace', 6);
INSERT INTO `city` VALUES (327, 'Trail', 6);
INSERT INTO `city` VALUES (328, 'Vancouver', 6);
INSERT INTO `city` VALUES (329, 'Vernon', 6);
INSERT INTO `city` VALUES (330, 'Victoria', 6);
INSERT INTO `city` VALUES (331, 'White Rock', 6);
INSERT INTO `city` VALUES (332, 'Williams Lake', 6);
INSERT INTO `city` VALUES (333, 'Charlottetown', 7);
INSERT INTO `city` VALUES (334, 'Summerside', 7);
INSERT INTO `city` VALUES (335, 'Estevan', 8);
INSERT INTO `city` VALUES (336, 'Flin Flon', 8);
INSERT INTO `city` VALUES (337, 'Humboldt', 8);
INSERT INTO `city` VALUES (338, 'Lloydminster', 8);
INSERT INTO `city` VALUES (339, 'Martensville', 8);
INSERT INTO `city` VALUES (340, 'Meadow Lake', 8);
INSERT INTO `city` VALUES (341, 'Melfort', 8);
INSERT INTO `city` VALUES (342, 'Melville', 8);
INSERT INTO `city` VALUES (343, 'Moose Jaw', 8);
INSERT INTO `city` VALUES (344, 'North Battleford', 8);
INSERT INTO `city` VALUES (345, 'Prince Albert', 8);
INSERT INTO `city` VALUES (346, 'Regina', 8);
INSERT INTO `city` VALUES (347, 'Saskatoon', 8);
INSERT INTO `city` VALUES (348, 'Swift Current', 8);
INSERT INTO `city` VALUES (349, 'Weyburn', 8);
INSERT INTO `city` VALUES (350, 'Yorkton', 8);
INSERT INTO `city` VALUES (351, 'Airdrie', 9);
INSERT INTO `city` VALUES (352, 'Brooks', 9);
INSERT INTO `city` VALUES (353, 'Calgary', 9);
INSERT INTO `city` VALUES (354, 'Camrose', 9);
INSERT INTO `city` VALUES (355, 'Cold Lake', 9);
INSERT INTO `city` VALUES (356, 'Edmonton', 9);
INSERT INTO `city` VALUES (357, 'Fort Saskatchewan', 9);
INSERT INTO `city` VALUES (358, 'Grande Prairie', 9);
INSERT INTO `city` VALUES (359, 'Leduc', 9);
INSERT INTO `city` VALUES (360, 'Lethbridge', 9);
INSERT INTO `city` VALUES (361, 'Lloydminster', 9);
INSERT INTO `city` VALUES (362, 'Medicine Hat', 9);
INSERT INTO `city` VALUES (363, 'Red Deer', 9);
INSERT INTO `city` VALUES (364, 'Spruce Grove', 9);
INSERT INTO `city` VALUES (365, 'Saint Albert', 9);
INSERT INTO `city` VALUES (366, 'Wetaskiwin', 9);
INSERT INTO `city` VALUES (367, 'Corner Brook', 10);
INSERT INTO `city` VALUES (368, 'Mount Pearl', 10);
INSERT INTO `city` VALUES (369, 'San Juan de Terranova', 10);
INSERT INTO `city` VALUES (370, 'Yellowknife', 11);
INSERT INTO `city` VALUES (371, 'Whitehorse', 12);
INSERT INTO `city` VALUES (372, 'Iqaluit', 13);
INSERT INTO `city` VALUES (373, 'North York', 1);
INSERT INTO `city` VALUES (374, 'Milton', 1);
INSERT INTO `city` VALUES (375, 'Halifax', 3);
INSERT INTO `city` VALUES (378, 'Other City', 1);
INSERT INTO `city` VALUES (382, 'Other City', 17);
INSERT INTO `city` VALUES (383, 'Whitby', 1);
INSERT INTO `city` VALUES (384, 'Woodbridge', 1);
INSERT INTO `city` VALUES (385, 'richmond hill', 1);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `CompanyId` int NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(65) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyRegistrationDate` date NULL DEFAULT NULL,
  `CompanyExpiryDate` date NULL DEFAULT NULL,
  `CompanyMasterBussinesNumber` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyAddress` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyPostalCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyPhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyMobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyEmail` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyWebSite` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyRegisterDate` date NOT NULL,
  `Company_CityId` int NOT NULL,
  `CompanyDescount` int NULL DEFAULT NULL,
  `CompanyDescountAmount` double NULL DEFAULT NULL,
  PRIMARY KEY (`CompanyId`) USING BTREE,
  INDEX `fk_Company_City1_idx`(`Company_CityId` ASC) USING BTREE,
  CONSTRAINT `fk_Company_City1` FOREIGN KEY (`Company_CityId`) REFERENCES `city` (`CityId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 466 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (415, 'AZA Inc.', '2022-04-22', NULL, '', 'Finaly 15', 'M3M0B3', '5555552225', '2222222222', 'jhon@aza.com', 'www.aza.com', '2022-04-22', 283, 1, 0.1);
INSERT INTO `company` VALUES (418, 'Halenda\'s Fine Foods', NULL, NULL, '', '15 Brydon Dr', 'M9W 4M7', '', '', '', '', '2022-06-20', 13, 0, 0);
INSERT INTO `company` VALUES (419, 'Adelphia Poultry', NULL, NULL, '', '61 Torlake Crescent', 'M8Z 1B3', '', '', '', '', '2022-06-24', 13, 0, 0);
INSERT INTO `company` VALUES (420, 'Borges Foods Ltd', NULL, NULL, '', '1831 Mattawa Ave', 'L4X 1K5', '', '', '', '', '2022-06-24', 23, 0, 0);
INSERT INTO `company` VALUES (421, 'Cover-All', NULL, NULL, '', '', '', '', '', '', '', '2022-06-24', 45, NULL, NULL);
INSERT INTO `company` VALUES (422, 'Creative Food Brands', NULL, NULL, '', '55 Torlake Crescent', 'M8Z 1B4', '', '', '', '', '2022-06-24', 45, 0, 0);
INSERT INTO `company` VALUES (423, 'FE Packaging Ltd', NULL, NULL, '', '273 Enford Road', 'L4C 3E9', '', '', '', '', '2022-06-24', 45, 0, 0);
INSERT INTO `company` VALUES (424, 'Flex Screen Canada', NULL, NULL, '', '21 Haist Ave', 'L4L 5V5', '', '', '', '', '2022-06-24', 384, 0, 0);
INSERT INTO `company` VALUES (425, 'Gelato Fresco ', NULL, NULL, '', '60 Tycos Drive', 'M6B 1V9', '', '', '', '', '2022-06-24', 45, 0, 0);
INSERT INTO `company` VALUES (426, 'Kevito Ltd', NULL, NULL, '', '60 Scarsdale Rd', 'M3B 2R7', '', '', '', '', '2022-06-24', 373, 0, 0);
INSERT INTO `company` VALUES (427, 'Leonard Wholesales', NULL, NULL, '', '411 Horner Ave', 'M8W 2B2	', '', '', '', '', '2022-06-24', 13, 0, 0);
INSERT INTO `company` VALUES (428, 'Loyalty Markets ', NULL, NULL, '', '977 Pantera Dr #3,', 'L4W 0C', '', '', '', '', '2022-06-24', 23, 0, 0);
INSERT INTO `company` VALUES (429, 'Loyalty Markets Y001', NULL, NULL, '', '977 Pantera Dr #3', 'L4W 0C2', '', '', '', '', '2022-06-24', 23, 0, 0);
INSERT INTO `company` VALUES (430, 'Loyalty Markets YHMI', NULL, NULL, '', '977 Pantera Dr #3,', 'L4W 0C2', '', '', '', '', '2022-06-24', 23, 0, 0);
INSERT INTO `company` VALUES (431, 'Loyalty Markets YYZ3', NULL, NULL, '', '977 Pantera Dr #3', 'L4W 0C2', '', '', '', '', '2022-06-24', 23, 0, 0);
INSERT INTO `company` VALUES (432, 'Loyalty Markets YYZ4', NULL, NULL, '', '977 Pantera Dr #3', 'L4W 0C2	', '', '', '', '', '2022-06-24', 23, 0, 0);
INSERT INTO `company` VALUES (433, 'Loyalty Markets YYZ7', NULL, NULL, '', '977 Pantera Dr #3', 'L4W 0C2', '', '', '', '', '2022-06-24', 23, 0, 0);
INSERT INTO `company` VALUES (434, 'Loyalty Markets YYZ1', NULL, NULL, '', '977 Pantera Dr #3', 'L4W 0C2', '', '', '', '', '2022-06-24', 23, 0, 0);
INSERT INTO `company` VALUES (435, 'Marini Foods ', NULL, NULL, '', '184 Toryork Dr', 'M9L 1X6', '', '', '', '', '2022-06-24', 373, 0, 0);
INSERT INTO `company` VALUES (436, 'Only Pasta', NULL, NULL, '', '457 Jevlan Drive', 'L4L 7Z9', '', '', '', '', '2022-06-24', 46, 0, 0);
INSERT INTO `company` VALUES (437, 'Peter the Chef', NULL, NULL, '', '401 Humberline Drive', 'M9W 6Y4', '', '', '', '', '2022-06-24', 45, 0, 0);
INSERT INTO `company` VALUES (438, 'Portuguese Cheese Co', NULL, NULL, '', '2 Buckingham St', 'M8Y 2W1', '', '', '', '', '2022-06-24', 45, 0, 0);
INSERT INTO `company` VALUES (439, 'Premium Uniforms', NULL, NULL, '', '215 Evans Avenue', 'M8Z 1J5', '', '', '', '', '2022-06-24', 45, 0, 0);
INSERT INTO `company` VALUES (440, 'Prep Culinary Inc. - Etobicoke', NULL, NULL, '', '315 Humberline Drive', 'M9W 5T6', '', '', '', '', '2022-06-24', 45, 1, 0.1);
INSERT INTO `company` VALUES (441, 'Print Geek', NULL, NULL, '', '140 Hanlan Road', 'L4L 3P6', '', '', '', '', '2022-06-24', 384, 0, 0);
INSERT INTO `company` VALUES (442, 'Quality Cheese Carlauren', NULL, NULL, '', '111 Jevlan Drive', 'L4L 8C2', '', '', '', '', '2022-06-24', 46, 0, 0);
INSERT INTO `company` VALUES (443, 'PI fine Art', NULL, NULL, '', '1180 Caledonia Road', 'M6A 2W5', '', '', '', '', '2022-06-24', 373, 0, 0);
INSERT INTO `company` VALUES (444, 'REXDALE Food specialty', NULL, NULL, '', '539 Jevlan Drive', 'L4L 8W1', '', '', '', '', '2022-06-24', 384, 0, 0);
INSERT INTO `company` VALUES (445, 'Quality Cheese Creditview', NULL, NULL, '', '111 Jevlan Drive', 'L4L 8C2', '', '', '', '', '2022-06-24', 46, 0, 0);
INSERT INTO `company` VALUES (446, 'Quality Cheese Jevlan', NULL, NULL, '', '111 Jevlan Drive', 'L4L 8C2', '', '', '', '', '2022-06-24', 46, 0, 0);
INSERT INTO `company` VALUES (448, 'Quality Cheese Jevlan - N', NULL, NULL, '', '', '', '', '', '', '', '2022-06-24', 45, NULL, NULL);
INSERT INTO `company` VALUES (449, 'Quality Cheese Orangeville', NULL, NULL, '', '111 Jevlan Drive', 'L4L 8C2', '', '', '', '', '2022-06-24', 46, 0, 0);
INSERT INTO `company` VALUES (450, 'Quality Cheese Store/Office', NULL, NULL, '', '111 Jevlan Drive', 'L4L 8C2', '', '', '', '', '2022-06-24', 46, 0, 0);
INSERT INTO `company` VALUES (451, 'Queens Pasta', NULL, NULL, '', '66 Newcastle St', 'M8Y 1A4', '', '', '', '', '2022-06-24', 13, 0, 0);
INSERT INTO `company` VALUES (452, 'Rizzo', NULL, NULL, '', '', '', '', '', '', '', '2022-06-24', 45, NULL, NULL);
INSERT INTO `company` VALUES (453, 'Roto Fasco Canada Inc.', NULL, NULL, '', '6625 Ordan Drive, Unit 1', 'L5T 1X2', '', '', '', '', '2022-06-24', 23, 0, 0);
INSERT INTO `company` VALUES (454, 'RT Fresh', NULL, NULL, '', '', '', '', '', '', '', '2022-06-24', 45, NULL, NULL);
INSERT INTO `company` VALUES (455, 'Shashi Foods Inc', NULL, NULL, '', '55 Esandar Drive', 'M4G 4H2', '', '', '', '', '2022-06-24', 45, 0, 0);
INSERT INTO `company` VALUES (456, 'Smile Natural Foods', NULL, NULL, '', '', '', '', '', '', '', '2022-06-24', 45, NULL, NULL);
INSERT INTO `company` VALUES (457, 'The Toronto Congress', NULL, NULL, '', '650 Dixon Rd', 'M9W 1J1', '', '', '', '', '2022-06-24', 13, 0, 0);
INSERT INTO `company` VALUES (458, 'Unitech Windows', NULL, NULL, '', '260 Jevlan Dr', 'L4L 8B1', '', '', '', '', '2022-06-24', 384, 0, 0);
INSERT INTO `company` VALUES (459, 'Sicilian Ice Cream', NULL, NULL, '', '349 Four Valley Dr', 'L4K 5Z3', '', '', '', '', '2022-06-30', 16, 0, 0);
INSERT INTO `company` VALUES (460, 'Prep Culinary Inc - Crestlawn', NULL, NULL, '', '1330 Crestlawn Dr', 'L4W 1P', '', '', '', '', '2022-09-27', 23, 0, 0);
INSERT INTO `company` VALUES (461, 'Quality Cheese - Admin', NULL, NULL, '', '111 Jevlan Drive', 'L4L 8C2', '', '', '', '', '2022-09-27', 46, 0, 0);
INSERT INTO `company` VALUES (462, 'Leonards Wholesale', NULL, NULL, '', '411 Horner Ave', 'M8W 2B2', '', '', '', '', '2022-09-27', 13, 0, 0);
INSERT INTO `company` VALUES (463, 'Loyalty Markets YYZ2', NULL, NULL, '', '977 Pantera Dr #3	', 'L4W 0C2', '', '', '', '', '2022-10-04', 23, 0, 0);
INSERT INTO `company` VALUES (464, 'Sapori Italiani Manica Luigi ', NULL, NULL, '', '120 Carlauren Road', ' L4L 8A8', '', '', '', '', '2022-10-07', 384, 0, 0);
INSERT INTO `company` VALUES (465, 'North Park Cleaners', NULL, NULL, '', '34 Caster Avenue', 'L4L 5Z1', '', '', '', '', '2022-10-11', 384, 0, 0);

-- ----------------------------
-- Table structure for companyinvoice
-- ----------------------------
DROP TABLE IF EXISTS `companyinvoice`;
CREATE TABLE `companyinvoice`  (
  `CompanyInvoiceId` int NOT NULL AUTO_INCREMENT,
  `CompanyInvoiceName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyInvoiceAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyInvoiceCitty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyInvoicePostaCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyInvoicePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyInvoiceFax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyInvoiceEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyInvoicePO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyInvoiceTerms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CompanyInvoiceGST` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CompanyInvoiceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of companyinvoice
-- ----------------------------
INSERT INTO `companyinvoice` VALUES (1, 'ONTHEGO STAFFING SERVICES INC.', '7222 Torbram Rooad Unit 14', 'Mississauaga', 'ON L4T3V2', '905-671-8837, 905-673-8837', '905-672-8837', 'onthegostyaff@gmail.com', '', '', '843094293');
INSERT INTO `companyinvoice` VALUES (2, 'KNIGHTSTAR TECH STAFFING SERVICES INC.', '1280 Finch Ave West Suite # 503', 'North York, ON', 'M3J 3K6', NULL, NULL, NULL, NULL, NULL, '880546353');

-- ----------------------------
-- Table structure for companyowner
-- ----------------------------
DROP TABLE IF EXISTS `companyowner`;
CREATE TABLE `companyowner`  (
  `CompanyOwner_UserAccountId` int NOT NULL,
  `CompanyOwner_CompanyId` int NOT NULL,
  INDEX `fk_CompanyOwner_UserAccount1_idx`(`CompanyOwner_UserAccountId` ASC) USING BTREE,
  INDEX `fk_CompanyOwner_Company1_idx`(`CompanyOwner_CompanyId` ASC) USING BTREE,
  CONSTRAINT `fk_CompanyOwner_Company1` FOREIGN KEY (`CompanyOwner_CompanyId`) REFERENCES `company` (`CompanyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CompanyOwner_UserAccount1` FOREIGN KEY (`CompanyOwner_UserAccountId`) REFERENCES `useraccount` (`UserAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of companyowner
-- ----------------------------
INSERT INTO `companyowner` VALUES (2764, 415);
INSERT INTO `companyowner` VALUES (2772, 418);
INSERT INTO `companyowner` VALUES (2773, 419);
INSERT INTO `companyowner` VALUES (2774, 420);
INSERT INTO `companyowner` VALUES (2775, 421);
INSERT INTO `companyowner` VALUES (2776, 422);
INSERT INTO `companyowner` VALUES (2777, 423);
INSERT INTO `companyowner` VALUES (2778, 424);
INSERT INTO `companyowner` VALUES (2779, 425);
INSERT INTO `companyowner` VALUES (2780, 426);
INSERT INTO `companyowner` VALUES (2781, 427);
INSERT INTO `companyowner` VALUES (2782, 428);
INSERT INTO `companyowner` VALUES (2783, 429);
INSERT INTO `companyowner` VALUES (2784, 430);
INSERT INTO `companyowner` VALUES (2785, 431);
INSERT INTO `companyowner` VALUES (2786, 432);
INSERT INTO `companyowner` VALUES (2787, 433);
INSERT INTO `companyowner` VALUES (2788, 434);
INSERT INTO `companyowner` VALUES (2789, 435);
INSERT INTO `companyowner` VALUES (2790, 436);
INSERT INTO `companyowner` VALUES (2791, 437);
INSERT INTO `companyowner` VALUES (2792, 438);
INSERT INTO `companyowner` VALUES (2793, 439);
INSERT INTO `companyowner` VALUES (2794, 440);
INSERT INTO `companyowner` VALUES (2795, 441);
INSERT INTO `companyowner` VALUES (2796, 442);
INSERT INTO `companyowner` VALUES (2797, 443);
INSERT INTO `companyowner` VALUES (2798, 444);
INSERT INTO `companyowner` VALUES (2799, 445);
INSERT INTO `companyowner` VALUES (2800, 446);
INSERT INTO `companyowner` VALUES (2802, 448);
INSERT INTO `companyowner` VALUES (2803, 449);
INSERT INTO `companyowner` VALUES (2804, 450);
INSERT INTO `companyowner` VALUES (2805, 451);
INSERT INTO `companyowner` VALUES (2806, 452);
INSERT INTO `companyowner` VALUES (2807, 453);
INSERT INTO `companyowner` VALUES (2808, 454);
INSERT INTO `companyowner` VALUES (2809, 455);
INSERT INTO `companyowner` VALUES (2810, 456);
INSERT INTO `companyowner` VALUES (2811, 457);
INSERT INTO `companyowner` VALUES (2812, 458);
INSERT INTO `companyowner` VALUES (2813, 459);
INSERT INTO `companyowner` VALUES (2816, 460);
INSERT INTO `companyowner` VALUES (2817, 461);
INSERT INTO `companyowner` VALUES (2818, 462);
INSERT INTO `companyowner` VALUES (2819, 463);
INSERT INTO `companyowner` VALUES (2820, 464);
INSERT INTO `companyowner` VALUES (2821, 465);

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `CountryId` int NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CountryAbbr` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CountryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES (1, 'Canada', 'CA');

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency`  (
  `CurrencyId` int NOT NULL AUTO_INCREMENT,
  `CurrencyName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CurrencyAbbr` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CurrencyBuyPrice` double NOT NULL,
  `CurrencySalePrice` double NOT NULL,
  PRIMARY KEY (`CurrencyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES (1, 'Canadian Dollar', 'CAD', 1, 1);

-- ----------------------------
-- Table structure for gender
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender`  (
  `GenderId` int NOT NULL AUTO_INCREMENT,
  `GenderName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GenderLetter` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`GenderId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gender
-- ----------------------------
INSERT INTO `gender` VALUES (1, 'Male', 'M');
INSERT INTO `gender` VALUES (2, 'Female', 'F');
INSERT INTO `gender` VALUES (3, 'NOT ADDED', 'NA');

-- ----------------------------
-- Table structure for occupation
-- ----------------------------
DROP TABLE IF EXISTS `occupation`;
CREATE TABLE `occupation`  (
  `OccupationtId` int NOT NULL AUTO_INCREMENT,
  `OccupationName` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`OccupationtId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of occupation
-- ----------------------------
INSERT INTO `occupation` VALUES (1, 'General Labour');
INSERT INTO `occupation` VALUES (2, 'General Labour 2');
INSERT INTO `occupation` VALUES (7, 'General Labour 3');
INSERT INTO `occupation` VALUES (8, 'General Labour M');
INSERT INTO `occupation` VALUES (9, 'General Labour F');
INSERT INTO `occupation` VALUES (10, 'General Labour N');
INSERT INTO `occupation` VALUES (11, 'Machine Operator ');
INSERT INTO `occupation` VALUES (12, 'Machine Operator 1');
INSERT INTO `occupation` VALUES (13, 'Machine Operator 2');
INSERT INTO `occupation` VALUES (14, 'Machine Operator 3');
INSERT INTO `occupation` VALUES (15, 'Machine Operator 4');
INSERT INTO `occupation` VALUES (16, 'Shipping/Receiving');
INSERT INTO `occupation` VALUES (17, 'Forklift');
INSERT INTO `occupation` VALUES (18, 'Order Picker');
INSERT INTO `occupation` VALUES (19, 'Order Picker 2');
INSERT INTO `occupation` VALUES (20, 'Quality Assurance');
INSERT INTO `occupation` VALUES (21, 'Shipping/Receiving 1');
INSERT INTO `occupation` VALUES (22, 'Shipping/Receiving 2');
INSERT INTO `occupation` VALUES (23, 'Driver');
INSERT INTO `occupation` VALUES (24, 'Cheese Stretcher');
INSERT INTO `occupation` VALUES (25, 'Ricotta/Paneer');
INSERT INTO `occupation` VALUES (26, 'Servers');
INSERT INTO `occupation` VALUES (27, 'HSK');
INSERT INTO `occupation` VALUES (28, 'HSK 1');
INSERT INTO `occupation` VALUES (29, 'HSK 2');
INSERT INTO `occupation` VALUES (30, 'HSK 3');
INSERT INTO `occupation` VALUES (31, 'HSK 4');
INSERT INTO `occupation` VALUES (32, 'Lead Hand');
INSERT INTO `occupation` VALUES (33, 'Maintenance');
INSERT INTO `occupation` VALUES (34, 'Machine Operator 5');

-- ----------------------------
-- Table structure for occupatiorate
-- ----------------------------
DROP TABLE IF EXISTS `occupatiorate`;
CREATE TABLE `occupatiorate`  (
  `OccupatioRateId` int NOT NULL AUTO_INCREMENT,
  `OccupatioRateAmount` double NULL DEFAULT NULL,
  `OccupatioRateAmount_OT` double NULL DEFAULT NULL,
  `OccupatioRateAmount_SAT` double NULL DEFAULT NULL,
  `OccupatioRateAmount_COMP` double NULL DEFAULT NULL,
  `OccupatioRateAmount_OT_COMP` double NULL DEFAULT NULL,
  `OccupatioRateAmount_SAT_COMP` double NULL DEFAULT NULL,
  `OccupatioRate_CompanyId` int NULL DEFAULT NULL,
  `OccupatioRate_OccupationId` int NULL DEFAULT NULL,
  PRIMARY KEY (`OccupatioRateId`) USING BTREE,
  INDEX `fk_OccupatioRate_CompanyId`(`OccupatioRate_CompanyId` ASC) USING BTREE,
  INDEX `OccupatioRate_OccupationId`(`OccupatioRate_OccupationId` ASC) USING BTREE,
  CONSTRAINT `OccupatioRate_OccupationId` FOREIGN KEY (`OccupatioRate_OccupationId`) REFERENCES `occupation` (`OccupationtId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OccupatioRate_CompanyId` FOREIGN KEY (`OccupatioRate_CompanyId`) REFERENCES `company` (`CompanyId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of occupatiorate
-- ----------------------------
INSERT INTO `occupatiorate` VALUES (7, 19, 28.5, 0, 24.5, 36.75, 0, 418, 11);
INSERT INTO `occupatiorate` VALUES (8, 15.5, 23.25, 0, 18.25, 27.38, 27.38, 419, 1);
INSERT INTO `occupatiorate` VALUES (10, 17.5, 26.25, 0, 20.6, 30.9, 0, 419, 12);
INSERT INTO `occupatiorate` VALUES (11, 18.5, 27.75, 0, 21.78, 32.67, 0, 419, 13);
INSERT INTO `occupatiorate` VALUES (12, 20, 30, 0, 23.55, 35.33, 0, 419, 16);
INSERT INTO `occupatiorate` VALUES (13, 15.5, 23.25, 0, 18.75, 28.13, 0, 420, 1);
INSERT INTO `occupatiorate` VALUES (14, 15, 22.5, 0, 18.95, 28.43, 0, 421, 1);
INSERT INTO `occupatiorate` VALUES (15, 17, 25.5, 0, 20.06, 30.09, 0, 422, 8);
INSERT INTO `occupatiorate` VALUES (16, 16, 24, 0, 18.88, 28.32, 0, 422, 9);
INSERT INTO `occupatiorate` VALUES (17, 16.25, 24.38, 0, 19.81, 29.72, 0, 423, 1);
INSERT INTO `occupatiorate` VALUES (18, 15, 22.5, 0, 19.18, 28.77, 0, 424, 1);
INSERT INTO `occupatiorate` VALUES (19, 15, 22.5, 0, 18.45, 27.68, 0, 425, 1);
INSERT INTO `occupatiorate` VALUES (20, 15, 22.5, 0, 19.5, 29.25, 0, 418, 1);
INSERT INTO `occupatiorate` VALUES (21, 15, 22.5, 0, 22.75, 34.13, 0, 426, 1);
INSERT INTO `occupatiorate` VALUES (22, 19.5, 29.25, 0, 25, 37.5, 0, 426, 17);
INSERT INTO `occupatiorate` VALUES (23, 15, 22.5, 0, 18.75, 28.13, 0, 427, 1);
INSERT INTO `occupatiorate` VALUES (24, 16.5, 24.75, 0, 20.25, 30.38, 0, 428, 18);
INSERT INTO `occupatiorate` VALUES (25, 17, 25.5, 0, 20.88, 31.32, 0, 428, 19);
INSERT INTO `occupatiorate` VALUES (26, 16.5, 24.75, 0, 20.25, 30.38, 0, 428, 20);
INSERT INTO `occupatiorate` VALUES (27, 15, 22.5, 0, 18.42, 27.63, 0, 428, 1);
INSERT INTO `occupatiorate` VALUES (28, 17, 25.5, 0, 20.88, 31.32, 0, 428, 2);
INSERT INTO `occupatiorate` VALUES (29, 15, 22.5, 0, 18.42, 27.63, 0, 429, 1);
INSERT INTO `occupatiorate` VALUES (30, 15.5, 22.5, 0, 18.42, 27.63, 0, 430, 1);
INSERT INTO `occupatiorate` VALUES (31, 15, 22.5, 0, 18.42, 27.63, 0, 431, 1);
INSERT INTO `occupatiorate` VALUES (32, 15, 22.5, 0, 18.42, 27.63, 0, 432, 1);
INSERT INTO `occupatiorate` VALUES (33, 15, 22.5, 0, 18.42, 27.63, 0, 433, 1);
INSERT INTO `occupatiorate` VALUES (34, 15, 22.5, 0, 18.42, 27.63, 0, 434, 1);
INSERT INTO `occupatiorate` VALUES (35, 15, 22.5, 0, 18.42, 27.63, 0, 435, 1);
INSERT INTO `occupatiorate` VALUES (36, 15.5, 23.25, 0, 18.21, 27.32, 0, 436, 1);
INSERT INTO `occupatiorate` VALUES (39, 15.25, 22.88, 0, 18.75, 28.13, 0, 437, 9);
INSERT INTO `occupatiorate` VALUES (40, 15.5, 23.25, 0, 18.75, 28.13, 0, 437, 8);
INSERT INTO `occupatiorate` VALUES (41, 15, 22.5, 0, 18.21, 27.32, 0, 438, 1);
INSERT INTO `occupatiorate` VALUES (42, 15.5, 23.25, 0, 18.6, 27.9, 0, 439, 1);
INSERT INTO `occupatiorate` VALUES (43, 17, 25.5, 0, 20.4, 30.6, 0, 439, 21);
INSERT INTO `occupatiorate` VALUES (44, 20, 30, 0, 24, 36, 0, 439, 22);
INSERT INTO `occupatiorate` VALUES (45, 18, 27, 0, 21.6, 32.4, 0, 439, 17);
INSERT INTO `occupatiorate` VALUES (46, 25, 37.5, 0, 30, 45, 0, 439, 7);
INSERT INTO `occupatiorate` VALUES (47, 17, 25.5, 0, 18.9, 28.35, 0, 440, 11);
INSERT INTO `occupatiorate` VALUES (48, 15, 22.5, 0, 16.9, 25.35, 0, 440, 1);
INSERT INTO `occupatiorate` VALUES (49, 15.5, 23.25, 0, 17.9, 26.85, 0, 440, 7);
INSERT INTO `occupatiorate` VALUES (50, 16, 24, 0, 17.4, 26.1, 0, 440, 2);
INSERT INTO `occupatiorate` VALUES (51, 26.25, 39.38, 0, 28.25, 42.38, 0, 440, 23);
INSERT INTO `occupatiorate` VALUES (52, 15, 22.5, 0, 19.38, 29.07, 0, 441, 1);
INSERT INTO `occupatiorate` VALUES (53, 16.25, 24.38, 0, 20.8, 31.2, 0, 442, 1);
INSERT INTO `occupatiorate` VALUES (54, 17.25, 25.88, 0, 22.08, 33.12, 0, 442, 17);
INSERT INTO `occupatiorate` VALUES (55, 19.25, 28.88, 0, 24.64, 36.96, 0, 442, 23);
INSERT INTO `occupatiorate` VALUES (56, 24.64, 36.96, 0, NULL, NULL, NULL, 443, 23);
INSERT INTO `occupatiorate` VALUES (57, 22.08, 33.12, 0, NULL, NULL, NULL, 443, 17);
INSERT INTO `occupatiorate` VALUES (58, 22.8, 31.2, 0, NULL, NULL, NULL, 443, 1);
INSERT INTO `occupatiorate` VALUES (59, 20.8, 31.2, 0, NULL, NULL, NULL, 444, 1);
INSERT INTO `occupatiorate` VALUES (60, 24.64, 36.96, 0, NULL, NULL, NULL, 444, 23);
INSERT INTO `occupatiorate` VALUES (61, 22.08, 33.12, 0, NULL, NULL, NULL, 444, 17);
INSERT INTO `occupatiorate` VALUES (62, 16.25, 24.38, 0, 20.48, 30.72, 0, 445, 1);
INSERT INTO `occupatiorate` VALUES (63, 16.25, 24.38, 0, 20.48, 30.72, 0, 446, 1);
INSERT INTO `occupatiorate` VALUES (64, 17.25, 25.88, 0, 22.08, 33.12, 0, 446, 17);
INSERT INTO `occupatiorate` VALUES (65, 16.75, 25.13, 0, 21.12, 31.68, 0, 446, 10);
INSERT INTO `occupatiorate` VALUES (66, 18.25, 27.38, 0, 23.04, 34.56, 0, 446, 24);
INSERT INTO `occupatiorate` VALUES (67, 18.25, 27.38, 0, 23.04, 34.56, 0, 446, 25);
INSERT INTO `occupatiorate` VALUES (73, 16.25, 24.38, 0, 20.48, 30.72, 0, 448, 1);
INSERT INTO `occupatiorate` VALUES (74, 16.75, 25.13, 0, 21.12, 31.68, 0, 448, 10);
INSERT INTO `occupatiorate` VALUES (75, 17.25, 25.88, 0, 22.08, 33.12, 0, 448, 17);
INSERT INTO `occupatiorate` VALUES (76, 18.25, 27.38, 0, 23.04, 34.56, 0, 448, 24);
INSERT INTO `occupatiorate` VALUES (77, 18.25, 27.38, 0, 23.04, 34.56, 0, 448, 25);
INSERT INTO `occupatiorate` VALUES (78, 16.25, 24.38, 0, 20.48, 30.72, 0, 449, 1);
INSERT INTO `occupatiorate` VALUES (79, 15.25, 22.88, 0, 19.2, 28.8, 0, 450, 1);
INSERT INTO `occupatiorate` VALUES (80, 15, 22.5, 0, 18.75, 28.13, 0, 451, 1);
INSERT INTO `occupatiorate` VALUES (81, 16, 24, 0, 20, 30, 0, 451, 13);
INSERT INTO `occupatiorate` VALUES (82, 22, 33, 0, 27.5, 41.25, 0, 451, 14);
INSERT INTO `occupatiorate` VALUES (83, 25, 37.5, 0, 31.25, 46.88, 0, 451, 15);
INSERT INTO `occupatiorate` VALUES (84, 15, 22.5, 0, 18.75, 28.13, 0, 452, 26);
INSERT INTO `occupatiorate` VALUES (85, 15, 22.5, 0, 19.05, 28.58, 0, 453, 1);
INSERT INTO `occupatiorate` VALUES (86, 15, 22.5, 0, 16.9, 25.35, 0, 454, 1);
INSERT INTO `occupatiorate` VALUES (87, 15.5, 23.25, 0, 17.4, 26.1, 0, 454, 2);
INSERT INTO `occupatiorate` VALUES (88, 16, 24, 0, 17.9, 26.85, 0, 454, 7);
INSERT INTO `occupatiorate` VALUES (89, 17, 25.5, 0, 18.9, 28.35, 0, 454, 11);
INSERT INTO `occupatiorate` VALUES (90, 20, 30, 0, 22, 33, 0, 454, 23);
INSERT INTO `occupatiorate` VALUES (91, 15.5, 23.25, 0, 19.05, 28.58, 0, 455, 1);
INSERT INTO `occupatiorate` VALUES (92, 15.5, 23.25, 0, 19.05, 28.58, 0, 456, 1);
INSERT INTO `occupatiorate` VALUES (93, 18, 27, 0, 23.05, 34.58, 0, 459, 1);
INSERT INTO `occupatiorate` VALUES (94, 15, 22.5, 0, 18.75, 28.13, 0, 458, 1);
INSERT INTO `occupatiorate` VALUES (95, 16, 24, 0, 20, 30, 0, 457, 27);
INSERT INTO `occupatiorate` VALUES (96, 18, 27, 0, 22.5, 33.75, 0, 457, 28);
INSERT INTO `occupatiorate` VALUES (97, 20, 30, 0, 25, 37.5, 0, 457, 29);
INSERT INTO `occupatiorate` VALUES (98, 21, 31.5, 0, 26.25, 39.38, 0, 457, 30);
INSERT INTO `occupatiorate` VALUES (99, 22, 33, 0, 27.5, 41.25, 0, 457, 31);
INSERT INTO `occupatiorate` VALUES (100, 22, 33, 0, 27.5, 41.25, 0, 457, 32);
INSERT INTO `occupatiorate` VALUES (101, 16, 24, 0, 20, 30, 0, 457, 33);
INSERT INTO `occupatiorate` VALUES (102, 22.5, 33.75, 0, NULL, NULL, NULL, 451, 34);
INSERT INTO `occupatiorate` VALUES (103, 45, 50, 60, 50, 55, 65, 415, 23);
INSERT INTO `occupatiorate` VALUES (104, 45, 67.5, 60, 50, 75, 65, 415, 17);

-- ----------------------------
-- Table structure for office
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office`  (
  `OfficeId` int NOT NULL AUTO_INCREMENT,
  `OfficeName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OfficeAddress` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OfficeZipCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OfficePhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Office_CityId` int NOT NULL,
  PRIMARY KEY (`OfficeId`) USING BTREE,
  INDEX `fk_Office_City1_idx`(`Office_CityId` ASC) USING BTREE,
  CONSTRAINT `fk_Office_City1` FOREIGN KEY (`Office_CityId`) REFERENCES `city` (`CityId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of office
-- ----------------------------
INSERT INTO `office` VALUES (22, 'Support PAY', 'Jane 2332', 'M3M456', '5552225547', 2);

-- ----------------------------
-- Table structure for payrollcash
-- ----------------------------
DROP TABLE IF EXISTS `payrollcash`;
CREATE TABLE `payrollcash`  (
  `PayrollCashId` int NOT NULL AUTO_INCREMENT,
  `PayrollCashAmount` double NOT NULL,
  `PayrollCashFee` double NOT NULL,
  `PayrollCash_CompanyId` int NOT NULL,
  `PayrollCash_ListId` int NOT NULL,
  `PayrollCashComment` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PayrollCashId`) USING BTREE,
  INDEX `PayrollCash_CompanyId`(`PayrollCash_CompanyId` ASC) USING BTREE,
  INDEX `PayrollCash_ListId`(`PayrollCash_ListId` ASC) USING BTREE,
  CONSTRAINT `payrollcash_ibfk_1` FOREIGN KEY (`PayrollCash_CompanyId`) REFERENCES `company` (`CompanyId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `payrollcash_ibfk_2` FOREIGN KEY (`PayrollCash_ListId`) REFERENCES `payrolllist` (`PayrollListId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payrollcash
-- ----------------------------

-- ----------------------------
-- Table structure for payrollcashtransaction
-- ----------------------------
DROP TABLE IF EXISTS `payrollcashtransaction`;
CREATE TABLE `payrollcashtransaction`  (
  `PayrollCashTransactionId` int NOT NULL AUTO_INCREMENT,
  `PayrollCashTransaction_PayrollCashId` int NOT NULL,
  `PayrollCashTransaction_TransactionId` int NOT NULL,
  PRIMARY KEY (`PayrollCashTransactionId`) USING BTREE,
  INDEX `PayrollCashTransaction_PayrollCashId`(`PayrollCashTransaction_PayrollCashId` ASC) USING BTREE,
  INDEX `PayrollCashTransaction_TransactionId`(`PayrollCashTransaction_TransactionId` ASC) USING BTREE,
  CONSTRAINT `payrollcashtransaction_ibfk_1` FOREIGN KEY (`PayrollCashTransaction_PayrollCashId`) REFERENCES `payrollcash` (`PayrollCashId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `payrollcashtransaction_ibfk_2` FOREIGN KEY (`PayrollCashTransaction_TransactionId`) REFERENCES `transaction` (`TransactionId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payrollcashtransaction
-- ----------------------------

-- ----------------------------
-- Table structure for payrolllist
-- ----------------------------
DROP TABLE IF EXISTS `payrolllist`;
CREATE TABLE `payrolllist`  (
  `PayrollListId` int NOT NULL AUTO_INCREMENT,
  `PayrollListOpened` tinyint(1) NOT NULL,
  `PayrollListDate` datetime NOT NULL,
  `PayrollList_CompanyId` int NOT NULL,
  `PayrollListPeriodFrom` date NULL DEFAULT NULL,
  `PayrollListPeriodTo` date NULL DEFAULT NULL,
  `PayrollListLoaded` int NULL DEFAULT NULL,
  `PayrollListLoaded_CompanyInvoiceId` int NOT NULL,
  PRIMARY KEY (`PayrollListId`) USING BTREE,
  INDEX `fk_payrolllist_company_id`(`PayrollList_CompanyId` ASC) USING BTREE,
  CONSTRAINT `fk_payrolllist_company_id` FOREIGN KEY (`PayrollList_CompanyId`) REFERENCES `company` (`CompanyId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 644 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payrolllist
-- ----------------------------
INSERT INTO `payrolllist` VALUES (577, 1, '2022-10-03 18:46:32', 421, '2022-09-26', '2022-10-02', 0, 2);
INSERT INTO `payrolllist` VALUES (578, 1, '2022-10-03 19:21:21', 424, '2022-09-26', '2022-10-02', 0, 1);
INSERT INTO `payrolllist` VALUES (579, 1, '2022-10-03 19:28:54', 438, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (580, 1, '2022-10-03 19:38:21', 453, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (581, 1, '2022-10-03 19:45:44', 459, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (582, 1, '2022-10-03 20:26:49', 457, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (583, 0, '2022-10-03 20:52:29', 441, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (584, 1, '2022-10-03 21:00:38', 435, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (585, 0, '2022-10-03 22:30:42', 460, '2022-09-25', '2022-10-01', 0, 0);
INSERT INTO `payrolllist` VALUES (586, 0, '2022-10-03 23:15:20', 415, '2022-10-03', '2022-10-21', 0, 0);
INSERT INTO `payrolllist` VALUES (587, 1, '2022-10-04 16:34:19', 437, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (588, 1, '2022-10-04 16:34:39', 425, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (589, 0, '2022-10-04 16:34:57', 423, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (590, 0, '2022-10-04 17:06:13', 426, '2022-09-25', '2022-10-01', 0, 0);
INSERT INTO `payrolllist` VALUES (591, 0, '2022-10-04 18:10:22', 440, '2022-09-25', '2022-09-30', 0, 0);
INSERT INTO `payrolllist` VALUES (592, 0, '2022-10-04 18:35:59', 458, '2022-09-16', '2022-09-29', 0, 0);
INSERT INTO `payrolllist` VALUES (593, 1, '2022-10-04 20:26:53', 436, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (594, 0, '2022-10-04 20:57:39', 455, '2022-09-25', '2022-10-01', 0, 0);
INSERT INTO `payrolllist` VALUES (595, 0, '2022-10-04 21:47:21', 428, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (596, 0, '2022-10-04 21:47:38', 429, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (597, 0, '2022-10-04 21:47:58', 430, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (598, 0, '2022-10-04 21:48:16', 431, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (599, 0, '2022-10-04 21:48:55', 432, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (600, 0, '2022-10-04 21:49:20', 433, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (601, 0, '2022-10-04 21:58:18', 434, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (602, 0, '2022-10-04 21:58:40', 463, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (603, 0, '2022-10-04 22:35:30', 451, '2022-09-19', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (605, 1, '2022-10-05 20:14:57', 419, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (606, 1, '2022-10-05 20:15:13', 420, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (607, 1, '2022-10-05 20:15:28', 422, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (608, 1, '2022-10-05 20:15:44', 461, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (609, 1, '2022-10-05 20:15:59', 442, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (610, 1, '2022-10-05 20:16:31', 445, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (611, 1, '2022-10-05 20:16:53', 446, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (612, 1, '2022-10-05 20:17:17', 448, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (613, 1, '2022-10-05 20:17:41', 449, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (614, 1, '2022-10-05 20:17:57', 450, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (615, 1, '2022-10-07 16:38:10', 460, '2022-09-25', '2022-10-01', 0, 0);
INSERT INTO `payrolllist` VALUES (616, 1, '2022-10-07 16:45:41', 440, '2022-09-25', '2022-10-01', 0, 0);
INSERT INTO `payrolllist` VALUES (617, 1, '2022-10-11 17:46:29', 418, '2022-09-26', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (618, 1, '2022-10-11 18:48:07', 419, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (619, 1, '2022-10-11 18:48:38', 421, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (620, 1, '2022-10-11 18:49:07', 422, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (621, 1, '2022-10-11 18:49:21', 423, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (622, 1, '2022-10-11 18:49:35', 423, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (623, 1, '2022-10-11 18:49:49', 424, '2022-10-03', '2022-10-09', 0, 2);
INSERT INTO `payrolllist` VALUES (624, 1, '2022-10-11 18:50:03', 435, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (625, 1, '2022-10-11 18:52:18', 465, '2022-09-12', '2022-09-26', 0, 0);
INSERT INTO `payrolllist` VALUES (626, 1, '2022-10-11 18:52:55', 443, '2022-09-26', '2022-10-02', 0, 0);
INSERT INTO `payrolllist` VALUES (627, 1, '2022-10-11 18:53:34', 439, '2022-09-26', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (628, 1, '2022-10-11 18:53:51', 453, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (629, 1, '2022-10-11 19:07:11', 453, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (630, 1, '2022-10-11 19:07:43', 459, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (631, 1, '2022-10-11 19:08:05', 457, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (632, 1, '2022-10-11 19:08:24', 464, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (633, 1, '2022-10-11 19:09:05', 428, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (634, 1, '2022-10-11 19:09:21', 429, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (635, 1, '2022-10-11 19:09:40', 430, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (636, 1, '2022-10-11 19:09:56', 434, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (637, 1, '2022-10-11 19:10:11', 463, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (638, 1, '2022-10-11 19:10:26', 431, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (639, 1, '2022-10-11 19:10:38', 432, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (640, 1, '2022-10-11 19:11:03', 433, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (641, 1, '2022-10-11 19:15:56', 443, '2022-10-03', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (642, 1, '2022-10-12 21:57:36', 419, '2022-09-26', '2022-10-09', 0, 0);
INSERT INTO `payrolllist` VALUES (643, 1, '2022-10-19 16:37:12', 415, '2022-10-04', '2022-10-12', 0, 0);

-- ----------------------------
-- Table structure for payrolllistpayment
-- ----------------------------
DROP TABLE IF EXISTS `payrolllistpayment`;
CREATE TABLE `payrolllistpayment`  (
  `PayrolllistpaymentId` int NOT NULL AUTO_INCREMENT,
  `PayrolllistpaymentState` int NOT NULL,
  `Payrolllistpayment_PayrollListId` int NOT NULL,
  `PayrolllistpaymentName` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PayrolllistpaymentNum` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PayrolllistpaymentAmount` double NOT NULL,
  `PayrollListPaymentDate` datetime NULL DEFAULT NULL,
  `PayrolllistpaymentAsignature` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PayrolllistpaymentType` int NOT NULL COMMENT '0-List 1-transfered 2-offlist 3-add web',
  `PayrolllistpaymentCommentInf` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PayrolllistpaymentHoursInf` double NOT NULL,
  `PayrolllistpaymentHoursInf_OT` double NOT NULL,
  `PayrolllistpaymentHoursInf_STA` double NOT NULL,
  `Payrolllistpayment_OccupationId` int NULL DEFAULT NULL,
  `PayrolllistpaymentEmployeeRate` double NOT NULL,
  `PayrolllistpaymentEmployeeRate_OT` double NOT NULL,
  `PayrolllistpaymentEmployeeRate_STA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PayrolllistpaymentCompanyRate` double NOT NULL,
  `PayrolllistpaymentCompanyRate_OT` double NOT NULL,
  `PayrolllistpaymentCompanyRate_STA` double NOT NULL,
  `PayrolllistpaymentAmountCompany` double NOT NULL,
  `PayrolllistpaymentPayType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PayrolllistpaymentDescount` double NULL DEFAULT NULL,
  `Payrolllistpayment_P_Hours` double NOT NULL,
  PRIMARY KEY (`PayrolllistpaymentId`) USING BTREE,
  INDEX `fk_payrolllistpayment_list_id`(`Payrolllistpayment_PayrollListId` ASC) USING BTREE,
  CONSTRAINT `payrolllistpayment_ibfk_1` FOREIGN KEY (`Payrolllistpayment_PayrollListId`) REFERENCES `payrolllist` (`PayrollListId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 798 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payrolllistpayment
-- ----------------------------
INSERT INTO `payrolllistpayment` VALUES (177, 0, 577, 'Ademola Nasiru', '1', 337.5, '2022-10-04 16:32:07', '', 0, '22.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 22.5, 0, 0, 14, 15, 22.5, '0', 18.95, 28.425, 0, 426.375, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (178, 0, 577, 'Andres Gutierrez', '2', 138.75, '2022-10-04 16:32:07', '', 0, '9.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 9.25, 0, 0, 14, 15, 22.5, '0', 18.95, 28.425, 0, 175.2875, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (179, 0, 578, 'Roberto Nelmida', '1', 624, '2022-10-04 16:32:34', '', 0, '39 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39, 0, 0, 18, 16, 24, '0', 19.18, 28.77, 0, 748.02, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (180, 0, 579, 'Abimael Mendez', '1', 699.375, '2022-10-04 16:32:43', '', 0, '44 Hours W1, 1.75 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 1.75, 0, 1, 15, 22.5, '0', 18.21, 27.315, 0, 849.04125, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (181, 0, 579, 'Guillermo Lara Pantoja', '2', 637.5, '2022-10-04 16:32:43', '', 0, '42.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.5, 0, 0, 1, 15, 22.5, '0', 18.21, 27.315, 0, 773.925, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (182, 0, 579, 'Karen Lara Flores', '3', 630, '2022-10-04 16:32:43', '', 0, '42 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42, 0, 0, 1, 15, 22.5, '10', 18.21, 27.315, 0, 764.82, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (183, 0, 579, 'Yareli Mora', '4', 630, '2022-10-04 16:32:43', '', 0, '42 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42, 0, 0, 1, 15, 22.5, '0', 18.21, 27.315, 0, 764.82, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (184, 0, 580, 'Candy Inayan', '1', 480, '2022-10-04 16:32:53', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15, 22.5, '0', 19.05, 28.575, 0, 609.6, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (185, 0, 580, 'Davinder Hari', '2', 487.5, '2022-10-04 16:32:53', '', 0, '32.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32.5, 0, 0, 1, 15, 22.5, '0', 19.05, 28.575, 0, 619.125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (186, 0, 580, 'Lizbeth Ang', '3', 555, '2022-10-04 16:32:53', '', 0, '37 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37, 0, 0, 1, 15, 22.5, '0', 19.05, 28.575, 0, 704.85, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (187, 0, 580, 'Mary Ann Parreno', '4', 600, '2022-10-04 16:32:53', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15, 22.5, '0', 19.05, 28.575, 0, 762, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (188, 0, 580, 'Patricia Heron', '5', 555, '2022-10-04 16:32:53', '', 0, '37 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37, 0, 0, 1, 15, 22.5, '0', 19.05, 28.575, 0, 704.85, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (189, 0, 580, 'Rethelje Ledda', '6', 592.5, '2022-10-04 16:32:53', '', 0, '39.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39.5, 0, 0, 1, 15, 22.5, '0', 19.05, 28.575, 0, 752.475, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (190, 0, 581, 'Elizabeth Santiago', '1', 103.5, '2022-10-04 16:33:11', '', 0, '5.75 Hours W1 -  OT Hours W1 -  Hours W2 -  OT Hours W2 -  STAT Hours W1 -  STAT Hours W2 ', 5.75, 0, 0, 1, 18, 27, '0', 23.05, 34.575, 0, 132.5375, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (191, 0, 581, 'Marie Iso', '2', 355.5, '2022-10-04 16:33:11', '', 0, '19.75 Hours W1 -  OT Hours W1 -  Hours W2 -  OT Hours W2 -  STAT Hours W1 -  STAT Hours W2 ', 19.75, 0, 0, 1, 18, 27, '0', 23.05, 34.575, 0, 455.2375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (192, 0, 581, 'Michelle Quedado', '3', 558, '2022-10-04 16:33:11', '', 0, '31 Hours W1 -  OT Hours W1 -  Hours W2 -  OT Hours W2 -  STAT Hours W1 -  STAT Hours W2 ', 31, 0, 0, 1, 18, 27, '0', 23.05, 34.575, 0, 714.55, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (193, 0, 582, 'Aadil Farah', '1', 840, '2022-10-04 16:33:23', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 30, 21, 31.5, '0', 26.25, 39.375, 0, 1050, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (194, 0, 582, 'Abimael Reyes', '2', 392, '2022-10-04 16:33:23', '', 0, '24.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 24.5, 0, 0, 27, 16, 24, '0', 20, 30, 0, 490, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (195, 0, 582, 'Alan Gallegos', '3', 704, '2022-10-04 16:33:23', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 27, 16, 24, '0', 20, 30, 0, 880, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (196, 0, 582, 'Alan Pavel Santiago Rojas', '4', 696, '2022-10-04 16:33:23', '', 0, '43.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43.5, 0, 0, 27, 16, 24, '0', 20, 30, 0, 870, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (197, 0, 582, 'Alexis Valdivia', '5', 968, '2022-10-04 16:33:23', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 31, 22, 33, '0', 27.5, 41.25, 0, 1210, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (198, 0, 582, 'Angel Lara Mendoza', '6', 688, '2022-10-04 16:33:23', '', 0, '43 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43, 0, 0, 27, 16, 24, '0', 20, 30, 0, 860, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (199, 0, 582, 'Antonio Valdivia', '7', 288, '2022-10-04 16:33:23', '', 0, '18 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 18, 0, 0, 27, 16, 24, '0', 20, 30, 0, 360, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (200, 0, 582, 'Claudette Williams', '8', 594, '2022-10-04 16:33:23', '', 0, '33 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 33, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 742.5, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (201, 0, 582, 'Eddie Teodoro', '9', 256, '2022-10-04 16:33:23', '', 0, '16 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 16, 0, 0, 27, 16, 24, '0', 20, 30, 0, 320, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (202, 0, 582, 'Guillermo Lara Pantoja', '10', 248, '2022-10-04 16:33:23', '', 0, '15.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 15.5, 0, 0, 27, 16, 24, '0', 20, 30, 0, 310, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (203, 0, 582, 'Jhonny Ponce Gamboa', '11', 80, '2022-10-04 16:33:23', '', 0, '5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 5, 0, 0, 27, 16, 24, '0', 20, 30, 0, 100, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (204, 0, 582, 'Josue Vasquez', '12', 412, '2022-10-04 16:33:23', '', 0, '25.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 25.75, 0, 0, 27, 16, 24, '0', 20, 30, 0, 515, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (205, 0, 582, 'Karen Alban', '13', 792, '2022-10-04 16:33:23', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 990, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (206, 0, 582, 'Karen Manuel', '14', 798.75, '2022-10-04 16:33:23', '', 0, '44 Hours W1, 0.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0.25, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 998.4375, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (207, 0, 582, 'Love Kalyan', '15', 704, '2022-10-04 16:33:23', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 27, 16, 24, '0', 20, 30, 0, 880, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (208, 0, 582, 'Mariam Shamaon', '16', 540, '2022-10-04 16:33:23', '', 0, '30 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 30, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 675, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (209, 0, 582, 'Maribel Manuel', '17', 306, '2022-10-04 16:33:23', '', 0, '17 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 17, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 382.5, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (210, 0, 582, 'Maritza Valdez', '18', 496, '2022-10-04 16:33:23', '', 0, '31 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31, 0, 0, 27, 16, 24, '0', 20, 30, 0, 620, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (211, 0, 582, 'Mark Manuel', '19', 774, '2022-10-04 16:33:23', '', 0, '43 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 967.5, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (212, 0, 582, 'Miraji Ali', '20', 448, '2022-10-04 16:33:23', '', 0, '28 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 28, 0, 0, 27, 16, 24, '0', 20, 30, 0, 560, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (213, 0, 582, 'Robert Gonzales', '21', 880, '2022-10-04 16:33:23', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 29, 20, 30, '0', 25, 37.5, 0, 1100, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (214, 0, 582, 'Robert Perlora', '22', 148, '2022-10-04 16:33:23', '', 0, '9.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 9.25, 0, 0, 27, 16, 24, '0', 20, 30, 0, 185, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (215, 0, 582, 'Rolly Piano', '23', 336, '2022-10-04 16:33:23', '', 0, '21 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 21, 0, 0, 27, 16, 24, '0', 20, 30, 0, 420, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (216, 0, 582, 'Ryan Calamdag', '24', 839.25, '2022-10-04 16:33:23', '', 0, '44 Hours W1, 1.75 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 1.75, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 1049.0625, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (217, 0, 582, 'Sebastian Ahumada', '25', 891, '2022-10-04 16:33:23', '', 0, '40.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40.5, 0, 0, 32, 22, 33, '0', 27.5, 41.25, 0, 1113.75, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (218, 0, 582, 'Thelma Morris', '26', 576, '2022-10-04 16:33:23', '', 0, '36 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 36, 0, 0, 27, 16, 24, '0', 20, 30, 0, 720, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (219, 0, 583, 'Sharon Naiman', '1', 541.26, '2022-10-04 16:33:35', '', 0, '34.92 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.92, 0, 0, 1, 15.5, 23.25, '0', 19.38, 29.07, 0, 676.7496, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (220, 0, 583, 'David Arobo-Ilesanmi', '2', 214.055, '2022-10-04 16:33:35', '', 0, '13.81 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 13.81, 0, 0, 1, 15.5, 23.25, '0', 19.38, 29.07, 0, 267.6378, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (221, 0, 583, 'Mariam Nakityo', '3', 584.35, '2022-10-04 16:33:35', '', 0, '37.7 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37.7, 0, 0, 1, 15.5, 23.25, '0', 19.38, 29.07, 0, 730.626, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (222, 0, 583, 'Faiza Elmi', '4', 344.875, '2022-10-04 16:33:35', '', 0, '22.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 22.25, 0, 0, 1, 15.5, 23.25, '0', 19.38, 29.07, 0, 431.205, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (223, 0, 585, 'Carolina Castelan', '1', 525, '2022-10-04 16:33:49', '', 0, '35 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35, 0, 0, 1, 15, 22.5, '0', 17, 25.5, 0, 595, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (224, 0, 585, 'Karen Ramirez', '2', 120, '2022-10-04 16:33:49', '', 0, '8 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 8, 0, 0, 1, 15, 22.5, '0', 17, 25.5, 0, 136, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (225, 0, 585, 'Loveleen Kaur Brar', '3', 510, '2022-10-04 16:33:49', '', 0, '34 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34, 0, 0, 1, 15, 22.5, '0', 17, 25.5, 0, 578, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (226, 0, 585, 'Elizabeth Vega', '4', 811.75, '2022-10-04 16:33:49', '', 0, '47.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 47.75, 0, 0, 2, 17, 25.5, '0', 19, 28.5, 0, 907.25, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (227, 0, 585, 'Jashandeep Singh', '5', 630, '2022-10-04 16:33:49', '', 0, '42 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42, 0, 0, 1, 15, 22.5, '0', 17, 25.5, 0, 714, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (228, 0, 585, 'Aanchal Mehta', '6', 690, '2022-10-04 16:33:49', '', 0, '46 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 46, 0, 0, 1, 15, 22.5, '0', 17, 25.5, 0, 782, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (262, 0, 589, 'Aries Relova', '1', 700.35, '2022-10-04 16:48:09', '', 0, '43.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43.5, 0, 0, 1, 16.1, 24.15, '0', 19.81, 29.715, 0, 861.735, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (263, 0, 589, 'Christopher Mostajo', '2', 901.6000000000001, '2022-10-04 16:48:09', '', 0, '56 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 56, 0, 0, 1, 16.1, 24.15, '0', 19.81, 29.715, 0, 1109.36, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (264, 0, 589, 'Jhun Sotelo', '4', 756.7, '2022-10-04 16:48:09', '', 0, '47 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 47, 0, 0, 1, 16.1, 24.15, '0', 19.81, 29.715, 0, 931.07, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (265, 0, 589, 'Quirino Borreta', '5', 780.85, '2022-10-04 16:48:09', '', 0, '48.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 48.5, 0, 0, 1, 16.1, 24.15, '0', 19.81, 29.715, 0, 960.785, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (274, 0, 590, 'Alvin Ramos', '1', 120, '2022-10-04 17:08:58', '', 0, '8 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 8, 0, 0, 1, 15, 22.5, '0', 22.75, 34.125, 0, 182, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (275, 0, 590, 'Hannah Mae', '2', 600, '2022-10-04 17:08:58', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15, 22.5, '0', 22.75, 34.125, 0, 910, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (276, 0, 590, 'Jesuis Agad', '3', 116.25, '2022-10-04 17:08:58', '', 0, '7.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 7.75, 0, 0, 1, 15, 22.5, '0', 22.75, 34.125, 0, 176.3125, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (277, 0, 590, 'Roland Dantes', '4', 97.5, '2022-10-04 17:08:58', '', 0, '6.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 6.5, 0, 0, 1, 15, 22.5, '0', 22.75, 34.125, 0, 147.875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (278, 0, 590, 'Wesley Calma', '5', 745.875, '2022-10-04 17:08:58', '', 0, '38.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 38.25, 0, 0, 17, 19.5, 29.25, '0', 25, 37.5, 0, 956.25, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (308, 0, 591, 'Alvin Abitong', '1', 551.25, '2022-10-04 18:17:52', '', 0, '36.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 36.75, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 621.075, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (309, 0, 591, 'Ariel Dela Cruz', '2', 168.75, '2022-10-04 18:17:52', '', 0, '11.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 11.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 190.125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (310, 0, 591, 'Deimi Aguilar Reyna', '3', 663.75, '2022-10-04 18:17:52', '', 0, '44.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 747.825, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (311, 0, 591, 'Diem Nguyen', '4', 637.5, '2022-10-04 18:17:52', '', 0, '42.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 718.25, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (312, 0, 591, 'Ernesto Mariano', '5', 142.5, '2022-10-04 18:17:52', '', 0, '9.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 9.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 160.55, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (313, 0, 591, 'Esmirna Cordova', '6', 705, '2022-10-04 18:17:52', '', 0, '47 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 47, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 794.3, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (314, 0, 591, 'John Ray Ed', '7', 693.75, '2022-10-04 18:17:52', '', 0, '46.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 46.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 781.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (315, 0, 591, 'Marvin Basco', '8', 727.5, '2022-10-04 18:17:52', '', 0, '48.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 48.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 819.65, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (316, 0, 591, 'May Lapacan', '9', 615, '2022-10-04 18:17:52', '', 0, '41 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 692.9, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (317, 0, 591, 'Michael Deonoso', '10', 690, '2022-10-04 18:17:52', '', 0, '46 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 46, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 777.4, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (318, 0, 591, 'Pauline Garcia', '11', 135, '2022-10-04 18:17:52', '', 0, '9 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 9, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 152.1, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (319, 0, 591, 'Phuc Lam', '12', 795, '2022-10-04 18:17:52', '', 0, '53 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 53, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 895.7, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (320, 0, 591, 'Phung Le', '13', 656.25, '2022-10-04 18:17:52', '', 0, '43.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43.75, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 739.375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (321, 0, 591, 'Rowena Daquiz', '14', 678.75, '2022-10-04 18:17:52', '', 0, '45.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 45.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 764.725, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (322, 0, 591, 'Savetri Singh', '15', 652.5, '2022-10-04 18:17:52', '', 0, '43.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 735.15, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (323, 0, 591, 'Sindy Leal', '16', 802.5, '2022-10-04 18:17:52', '', 0, '53.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 53.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 904.15, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (324, 0, 591, 'Wendy Ramirez Camacio', '17', 847.5, '2022-10-04 18:17:52', '', 0, '56.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 56.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 954.85, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (325, 0, 591, 'Yareli Alvarado', '18', 536.25, '2022-10-04 18:17:52', '', 0, '35.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.75, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 604.175, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (326, 0, 591, 'Yesenia Corral Rosales', '19', 660, '2022-10-04 18:17:52', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 743.6, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (327, 0, 591, 'Jefferson Gomez', '20', 1077.25, '2022-10-04 18:17:52', '', 0, '69.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 69.5, 0, 0, 2, 15.5, 23.25, '0', 17.9, 26.85, 0, 1244.05, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (328, 0, 591, 'Joman Sheshara', '21', 701.375, '2022-10-04 18:17:52', '', 0, '45.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 45.25, 0, 0, 2, 15.5, 23.25, '0', 17.9, 26.85, 0, 809.975, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (329, 0, 591, 'Leopoldo Perez', '22', 759.5, '2022-10-04 18:17:52', '', 0, '49 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 49, 0, 0, 2, 15.5, 23.25, '0', 17.9, 26.85, 0, 877.1, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (330, 0, 591, 'Bernardo Edano', '23', 1116, '2022-10-04 18:17:52', '', 0, '69.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 69.75, 0, 0, 7, 16, 24, '0', 17.4, 26.1, 0, 1213.65, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (331, 0, 591, 'Paulo Basco', '24', 403.75, '2022-10-04 18:17:52', '', 0, '23.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 23.75, 0, 0, 11, 17, 25.5, '0', 18.9, 28.35, 0, 448.875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (332, 0, 591, 'Sherwin Ramirez', '25', 1126.25, '2022-10-04 18:17:52', '', 0, '66.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 66.25, 0, 0, 11, 17, 25.5, '0', 18.9, 28.35, 0, 1252.125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (333, 0, 591, 'Romel Castro', '26', 1049.75, '2022-10-04 18:17:52', '', 0, '61.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 61.75, 0, 0, 11, 17, 25.5, '0', 18.9, 28.35, 0, 1167.075, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (334, 0, 591, 'Justin Franks', '27', 1050, '2022-10-04 18:17:52', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 23, 26.25, 39.375, '0', 28.25, 42.375, 0, 1130, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (335, 0, 591, 'Orlando Romero', '28', 408.75, '2022-10-04 18:17:52', '', 0, '27.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 27.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 460.525, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (336, 0, 592, 'Aracely Ramirez', '1', 1320, '2022-10-04 18:36:17', '', 0, '88 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 88, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1650, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (337, 0, 592, 'Kamalendu Das', '2', 811.75, '2022-10-04 18:36:17', '', 0, '47.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 47.75, 0, 0, 2, 17, 25.5, '0', 0, 0, 0, 0, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (338, 0, 592, 'Marybeth Sumatra', '3', 1185, '2022-10-04 18:36:17', '', 0, '79 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 79, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1481.25, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (339, 0, 592, 'Shana Hendricks', '4', 1320, '2022-10-04 18:36:17', '', 0, '88 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 88, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1650, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (340, 0, 592, 'Tri Lestari', '5', 1185, '2022-10-04 18:36:17', '', 0, '79 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 79, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1481.25, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (345, 0, 594, 'Jacek Bowleg', '1', 658.75, '2022-10-04 20:57:53', '', 0, '42.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.5, 0, 0, 1, 15.5, 23.25, '0', 19.05, 28.575, 0, 809.625, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (346, 0, 595, 'Gurpreet Singh', '1', 1190, '2022-10-04 21:49:51', '', 0, '56 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 56, 0, 0, 23, 21.25, 31.875, '0', 0, 0, 0, 0, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (347, 0, 595, 'Ricardo Barrientos', '2', 680, '2022-10-04 21:49:51', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 19, 17, 25.5, '0', 20.88, 31.32, 0, 835.2, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (348, 0, 595, 'Clint Reyes', '3', 360, '2022-10-04 21:49:51', '', 0, '24 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 24, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 442.08, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (349, 0, 596, 'Dulce Baldivicio', '1', 97.5, '2022-10-04 21:50:09', '', 0, '6.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 6.5, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 119.73, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (350, 0, 596, 'Rodel Baldivicio', '2', 281.1, '2022-10-04 21:50:09', '', 0, '18.74 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 18.74, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 345.1908, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (351, 0, 596, 'Adelina Cortado', '3', 210, '2022-10-04 21:50:09', '', 0, '14 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 14, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 257.88, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (352, 0, 597, 'Fernando Zagala', '1', 363.75, '2022-10-04 21:50:23', '', 0, '24.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 24.25, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 446.685, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (353, 0, 597, 'Franco Dimaandal', '2', 318.75, '2022-10-04 21:50:23', '', 0, '21.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 21.25, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 391.425, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (354, 0, 597, 'Devin Carl Quammie', '3', 60, '2022-10-04 21:50:23', '', 0, '4 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 4, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 73.68, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (355, 0, 598, 'Manpreet Kaur', '1', 480, '2022-10-04 21:50:33', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 589.44, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (356, 0, 598, 'Arshdeep Singh', '2', 480, '2022-10-04 21:50:33', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 589.44, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (357, 0, 598, 'Sukhdeep Singh', '3', 600, '2022-10-04 21:50:33', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 736.8, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (358, 0, 598, 'Navjot Kaur', '4', 600, '2022-10-04 21:50:33', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 736.8, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (359, 0, 598, 'Navneet Kaur Bhupal', '5', 420, '2022-10-04 21:50:33', '', 0, '28 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 28, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 515.76, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (360, 0, 599, 'Ramandeep Kaur', '1', 562.5, '2022-10-04 21:50:51', '', 0, '37.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37.5, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 690.75, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (361, 0, 599, 'Gagandeep Kaur', '2', 750, '2022-10-04 21:50:51', '', 0, '50 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 50, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 921, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (362, 0, 599, 'Manmeet Kaur', '3', 360, '2022-10-04 21:50:51', '', 0, '24 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 24, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 442.08, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (363, 0, 599, 'Navneet Kaur', '4', 240, '2022-10-04 21:50:51', '', 0, '16 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 16, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 294.72, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (364, 0, 599, 'Kiranjit Kaur', '5', 480, '2022-10-04 21:50:51', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 589.44, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (365, 0, 599, 'Rakhvir Talwar', '6', 120, '2022-10-04 21:50:51', '', 0, '8 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 8, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 147.36, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (366, 0, 600, 'Chhinder Sidhu', '1', 600, '2022-10-04 21:50:59', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 736.8, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (367, 0, 600, 'Manjit Dhindsa Kaur', '2', 600, '2022-10-04 21:50:59', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 736.8, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (368, 0, 600, 'Rakhvir Talwar', '3', 600, '2022-10-04 21:50:59', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 736.8, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (369, 0, 601, 'Rahul Behal', '1', 420, '2022-10-04 21:58:55', '', 0, '28 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 28, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 515.76, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (370, 0, 602, 'Hrithik Malhotra', '1', 90, '2022-10-04 21:59:08', '', 0, '6 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 6, 0, 0, 1, 15, 22.5, '0', 18.42, 27.63, 0, 110.52, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (371, 0, 593, 'Anne Marie Smith', '1', 675.36, '2022-10-04 22:23:27', '', 0, '42.21 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.21, 0, 0, 1, 16, 24, '0', 18.21, 27.315, 0, 768.6441, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (372, 0, 593, 'Daine Edward', '2', 692, '2022-10-04 22:23:27', '', 0, '43.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43.25, 0, 0, 1, 16, 24, '0', 18.21, 27.315, 0, 787.5825, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (373, 0, 593, 'Janet Isabel Delfin', '3', 672.6999999999999, '2022-10-04 22:23:27', '', 0, '43.4 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43.4, 0, 0, 1, 15.5, 23.25, '0', 18.21, 27.315, 0, 790.314, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (374, 0, 593, 'Zaira Nayeli Sosa', '4', 661.54, '2022-10-04 22:23:27', '', 0, '42.68 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.68, 0, 0, 1, 15.5, 23.25, '0', 18.21, 27.315, 0, 777.2028, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (421, 0, 586, 'SERGIO', '1', 600, '2022-10-05 00:57:57', '', 0, '30 Hours W1, 5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 30, 5, 0, 1, 16, 24, '', 18.21, 27.315, 0, 682.875, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (422, 0, 586, 'JHON', '2', 920, '2022-10-05 00:57:57', '', 0, '50 Hours W1, 5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 50, 5, 0, 1, 16, 24, '', 18.21, 27.315, 0, 1047.075, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (423, 0, 586, 'JAIRO ', '3', 813.75, '2022-10-05 00:57:57', '', 0, '45 Hours W1, 5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 45, 5, 0, 1, 15.5, 23.25, '', 18.21, 27.315, 0, 956.025, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (424, 0, 586, 'GLORIA', '4', 612.25, '2022-10-05 00:57:57', '', 0, '32 Hours W1, 5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 5, 0, 1, 15.5, 23.25, '', 18.21, 27.315, 0, 719.295, 'PCI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (425, 0, 586, 'JESSIKA', '5', 658.75, '2022-10-05 00:57:57', '', 0, '35 Hours W1, 5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35, 5, 0, 1, 15.5, 23.25, '', 18.21, 27.315, 0, 773.925, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (426, 0, 586, 'ANGIE', '6', 736.25, '2022-10-05 00:57:57', '', 0, '40 Hours W1, 5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 5, 0, 1, 15.5, 23.25, '', 18.21, 27.315, 0, 864.975, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (427, 0, 603, 'Apophia Tebarura', '1', 993.75, '2022-10-05 18:00:01', '', 0, '66.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 66.25, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1242.1875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (428, 0, 603, 'Carlos Garcia', '2', 1241.25, '2022-10-05 18:00:01', '', 0, '82.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 82.75, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1551.5625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (429, 0, 603, 'Damian Diaz', '3', 1192.5, '2022-10-05 18:00:01', '', 0, '79.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 79.5, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1490.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (430, 0, 603, 'Edgar Mendoza', '4', 1646.25, '2022-10-05 18:00:01', '', 0, '109.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 109.75, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 2057.8125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (431, 0, 603, 'Fernando Morales', '5', 1623.75, '2022-10-05 18:00:01', '', 0, '108.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 108.25, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 2029.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (432, 0, 603, 'Eduardo Hernandez', '6', 1143.75, '2022-10-05 18:00:01', '', 0, '76.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 76.25, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1429.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (433, 0, 603, 'May Villanueva', '7', 1361.25, '2022-10-05 18:00:01', '', 0, '90.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 90.75, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1701.5625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (434, 0, 603, 'Oluwagbemiga Adelakun', '8', 982.5, '2022-10-05 18:00:01', '', 0, '65.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 65.5, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1228.125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (435, 0, 603, 'Sivamanthy Selvachanderan', '9', 1578.75, '2022-10-05 18:00:01', '', 0, '105.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 105.25, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1973.4375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (436, 0, 603, 'Tsering Lhamo', '10', 1297.5, '2022-10-05 18:00:01', '', 0, '86.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 86.5, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 1621.875, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (437, 0, 603, 'Victor Escudero', '11', 2156, '2022-10-05 18:00:01', '', 0, '98 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 98, 0, 0, 14, 22, 33, '0', 27.5, 41.25, 0, 2695, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (438, 0, 603, 'Crystal Aquino', '12', 787.5, '2022-10-05 18:00:01', '', 0, '31.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31.5, 0, 0, 15, 25, 37.5, '0', 31.25, 46.875, 0, 984.375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (439, 0, 603, 'Erwin Ellison', '13', 1867.5, '2022-10-05 18:00:01', '', 0, '103.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 103.75, 0, 0, 34, 18, 27, '0', 22.5, 33.75, 0, 2334.375, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (440, 0, 603, 'Pablo  Tejeda', '14', 1984.5, '2022-10-05 18:00:01', '', 0, '110.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 110.25, 0, 0, 34, 18, 27, '0', 22.5, 33.75, 0, 2480.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (441, 0, 603, 'Robert  Conde', '15', 1575, '2022-10-05 18:00:01', '', 0, '87.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 87.5, 0, 0, 34, 18, 27, '0', 22.5, 33.75, 0, 1968.75, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (442, 0, 588, 'Abimbola Adetu', '1', 476.25, '2022-10-05 18:04:27', '', 0, '31.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31.75, 0, 0, 1, 15, 22.5, '0', 18.45, 27.675, 0, 585.7875, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (443, 0, 588, 'Bonifacio Mendoza', '2', 664, '2022-10-05 18:04:27', '', 0, '41.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41.5, 0, 0, 1, 16, 24, '0', 18.45, 27.675, 0, 765.675, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (444, 0, 588, 'Chester Kigi-e', '3', 611.25, '2022-10-05 18:04:27', '', 0, '40.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40.75, 0, 0, 1, 15, 22.5, '0', 18.45, 27.675, 0, 751.8375, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (445, 0, 588, 'Jhasmine Escarda', '4', 622.5, '2022-10-05 18:04:27', '', 0, '41.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41.5, 0, 0, 1, 15, 22.5, '0', 18.45, 27.675, 0, 765.675, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (446, 0, 588, 'Jimmy Valenzona', '5', 622.5, '2022-10-05 18:04:27', '', 0, '41.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41.5, 0, 0, 1, 15, 22.5, '0', 18.45, 27.675, 0, 765.675, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (447, 0, 588, 'Viridiana Hernandez', '6', 622.5, '2022-10-05 18:04:27', '', 0, '41.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41.5, 0, 0, 1, 15, 22.5, '0', 18.45, 27.675, 0, 765.675, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (448, 0, 588, 'Jane Candia', '7', 240, '2022-10-05 18:04:27', '', 0, '16 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 16, 0, 0, 1, 15, 22.5, '0', 18.45, 27.675, 0, 295.2, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (449, 0, 588, 'Ma Lourdes Tutor', '8', 127.5, '2022-10-05 18:04:27', '', 0, '8.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 8.5, 0, 0, 1, 15, 22.5, '0', 18.45, 27.675, 0, 156.825, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (450, 0, 605, 'Abigail Reyes', '1', 507.625, '2022-10-05 20:20:47', '', 0, '32.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 597.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (451, 0, 605, 'Adriana Mendez', '2', 621.25, '2022-10-05 20:20:47', '', 0, '35.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.5, 0, 0, 12, 17.5, 26.25, '0', 20.6, 30.9, 0, 731.3, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (452, 0, 605, 'Carmelita Abaniel', '3', 507.625, '2022-10-05 20:20:47', '', 0, '32.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 597.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (453, 0, 605, 'Carol Dominguez', '4', 472.75, '2022-10-05 20:20:47', '', 0, '30.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 30.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 556.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (454, 0, 605, 'Clayton Ricketts', '5', 804.375, '2022-10-05 20:20:47', '', 0, '41.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41.25, 0, 0, 14, 19.5, 29.25, '0', 23, 34.5, 0, 948.75, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (455, 0, 605, 'Delroy Downsend', '6', 896.5, '2022-10-05 20:20:47', '', 0, '40.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40.75, 0, 0, 16, 22, 33, '0', 23.55, 35.325, 0, 959.6625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (456, 0, 605, 'Eduardo Lopez', '7', 530.875, '2022-10-05 20:20:47', '', 0, '34.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.25, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 625.0625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (457, 0, 605, 'Elna Mae Macarayan', '8', 434, '2022-10-05 20:20:47', '', 0, '28 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 28, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 511, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (458, 0, 605, 'Itzel De Paz', '9', 546.375, '2022-10-05 20:20:47', '', 0, '35.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.25, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 643.3125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (459, 0, 605, 'Jackelyn Munoz', '10', 379.75, '2022-10-05 20:20:47', '', 0, '24.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 24.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 447.125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (460, 0, 605, 'Jacqueline Galicia', '11', 726, '2022-10-05 20:20:47', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 35, 16.5, 24.75, '0', 18.25, 27.375, 0, 803, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (461, 0, 605, 'Laishan Nabocyag', '12', 395.25, '2022-10-05 20:20:47', '', 0, '25.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 25.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 465.375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (462, 0, 605, 'Luis Alberto Gallardo', '13', 527, '2022-10-05 20:20:47', '', 0, '34 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 620.5, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (463, 0, 605, 'Maria De Jesus', '14', 507.625, '2022-10-05 20:20:47', '', 0, '32.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 597.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (464, 0, 605, 'Maria Delgado', '15', 488.25, '2022-10-05 20:20:47', '', 0, '31.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 574.875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (465, 0, 605, 'Marianne Mangacat', '16', 507.625, '2022-10-05 20:20:47', '', 0, '32.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32.75, 0, 0, 1, 15.5, 23.25, '10', 18.25, 27.375, 0, 597.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (466, 0, 605, 'Rebecca Dominguez', '17', 503.75, '2022-10-05 20:20:47', '', 0, '32.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 593.125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (467, 0, 605, 'Rodolfo Valencia', '18', 399.125, '2022-10-05 20:20:47', '', 0, '25.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 25.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 469.9375, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (468, 0, 605, 'Rubai Rubai', '19', 399.125, '2022-10-05 20:20:47', '', 0, '25.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 25.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 469.9375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (469, 0, 605, 'Thuy Le', '20', 488.25, '2022-10-05 20:20:47', '', 0, '31.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 574.875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (470, 0, 605, 'Veronica David', '21', 507.625, '2022-10-05 20:20:47', '', 0, '32.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 597.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (471, 0, 605, 'Xochitl Gomez', '22', 507.625, '2022-10-05 20:20:47', '', 0, '32.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 597.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (472, 0, 606, 'Ana Falfan', '1', 682.5, '2022-10-05 20:21:08', '', 0, '44 Hours W1, 1 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 1, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 853.125, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (473, 0, 606, 'Clint Lockhart', '2', 630, '2022-10-05 20:21:08', '', 0, '42 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42, 0, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 787.5, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (474, 0, 606, 'Dedrie Moxey', '3', 671.25, '2022-10-05 20:21:08', '', 0, '44 Hours W1, 0.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0.5, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 839.0625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (475, 0, 606, 'Glenda Peralta Valdivia', '4', 682.5, '2022-10-05 20:21:08', '', 0, '44 Hours W1, 1 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 1, 0, 1, 15, 22.5, '0', 18.75, 28.125, 0, 853.125, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (476, 0, 607, 'Fernando Ramos', '1', 907.375, '2022-10-05 20:21:18', '', 0, '44 Hours W1, 6.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 6.25, 0, 0, 17, 25.5, '17', 20.06, 30.09, 0, 1070.7025, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (477, 0, 607, 'Christine Dakiwag', '2', 1128.75, '2022-10-05 20:21:18', '', 0, '44 Hours W1, 6.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 6.5, 0, 36, 21, 31.5, '21', 0, 0, 0, 0, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (478, 0, 608, 'Maria Meneses', '1', 720, '2022-10-05 20:21:27', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 18, 27, '18', 20.8, 31.2, 0, 832, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (479, 0, 609, 'Airen Abiera', '1', 855.15625, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 5.75 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 5.75, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1094.6, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (480, 0, 609, 'Cesar Mostoles', '2', 995.3125, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 11.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 11.5, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1274, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (481, 0, 609, 'Dinah Britania', '4', 1117.1875, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 16.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 16.5, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1430, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (482, 0, 609, 'Diomedez Seroma', '5', 1068.4375, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 14.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 14.5, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1367.6, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (483, 0, 609, 'Edwin Sison', '6', 1111, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 16.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 16.25, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1422.2, 'PCI', 0, 10);
INSERT INTO `payrolllistpayment` VALUES (484, 0, 609, 'Ella Palomares', '7', 1117.1875, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 16.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 16.5, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1430, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (485, 0, 609, 'Israel Villafuerte', '9', 621.5625, '2022-10-05 20:21:38', '', 0, '38.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 38.25, 0, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 795.6, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (486, 0, 609, 'John Marquez', '11', 958.75, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 10 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 10, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1227.2, 'PCI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (487, 0, 609, 'Jolly Julian', '12', 1123.28125, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 16.75 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 16.75, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1437.8, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (488, 0, 609, 'Jose Mauricio Hernandez', '13', 824.6875, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 4.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 4.5, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1055.6, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (489, 0, 609, 'Jose Miguel De Leon', '24', 715.5, '2022-10-05 20:21:38', '', 0, '39.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39.75, 0, 0, 17, 18, 27, '18', 22.08, 33.12, 0, 877.68, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (490, 0, 609, 'Julie Licao', '22', 843.125, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 0.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0.25, 0, 23, 19, 28.5, '19', 24.64, 36.96, 0, 1093.4, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (491, 0, 609, 'Liza Delfin', '14', 467.1875, '2022-10-05 20:21:38', '', 0, '28.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 28.75, 0, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 598, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (492, 0, 609, 'Mario Dainguinoo', '17', 897.8125, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 7.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 7.5, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1149.2, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (493, 0, 609, 'Miguel Rivera', '18', 824.6875, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 4.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 4.5, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1055.6, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (494, 0, 609, 'Mike Visconde', '19', 1123.28125, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 16.75 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 16.75, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1437.8, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (495, 0, 609, 'RD Great Segundo', '20', 1068.4375, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 14.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 14.5, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1367.6, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (496, 0, 609, 'Resty Javiar', '21', 891.71875, '2022-10-05 20:21:38', '', 0, '44 Hours W1, 7.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 7.25, 0, 1, 16.25, 24.375, '16.25', 20.8, 31.2, 0, 1141.4, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (497, 0, 610, 'Giovanni Mendigo', '1', 836.875, '2022-10-05 20:21:48', '', 0, '44 Hours W1, 5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 5, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 1054.72, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (498, 0, 611, 'Aaron Escabelles', '1', 891.71875, '2022-10-05 20:21:57', '', 0, '44 Hours W1, 7.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 7.25, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 1123.84, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (499, 0, 611, 'Arnel John Samonte', '2', 690.625, '2022-10-05 20:21:57', '', 0, '42.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.5, 0, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 870.4, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (500, 0, 611, 'Emmanuel James Buslon', '3', 694.6875, '2022-10-05 20:21:57', '', 0, '42.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.75, 0, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 875.52, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (501, 0, 611, 'Joselito Gutierrez', '4', 721.09375, '2022-10-05 20:21:57', '', 0, '44 Hours W1, 0.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0.25, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 908.8, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (502, 0, 611, 'Miriam Vizconde', '5', 794.21875, '2022-10-05 20:21:57', '', 0, '44 Hours W1, 3.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 3.25, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 1000.96, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (503, 0, 611, 'MJ Vizconde', '6', 727.1875, '2022-10-05 20:21:57', '', 0, '44 Hours W1, 0.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0.5, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 916.48, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (504, 0, 611, 'Ramil Sapigao', '7', 769.84375, '2022-10-05 20:21:57', '', 0, '44 Hours W1, 2.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 2.25, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 970.24, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (505, 0, 611, 'Reniel Sapigao', '8', 410.375, '2022-10-05 20:21:57', '', 0, '24.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 24.5, 0, 0, 24, 16.75, 25.125, '16.75', 21.12, 31.68, 0, 517.44, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (506, 0, 612, 'Allainval Tabioda', '1', 330.8125, '2022-10-05 20:22:12', '', 0, '19.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 19.75, 0, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 404.48, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (507, 0, 612, 'Alvin Aragones', '2', 686.75, '2022-10-05 20:22:12', '', 0, '41 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41, 0, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 839.68, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (508, 0, 612, 'Bryan Bala', '3', 789.3125, '2022-10-05 20:22:12', '', 0, '43.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43.25, 0, 0, 25, 18.25, 27.375, '18.25', 23.04, 34.56, 0, 996.48, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (509, 0, 612, 'Edmar Bucayu', '4', 640.6875, '2022-10-05 20:22:12', '', 0, '38.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 38.25, 0, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 783.36, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (510, 0, 612, 'Ella Erika Villamar', '5', 644.875, '2022-10-05 20:22:12', '', 0, '38.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 38.5, 0, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 788.48, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (511, 0, 612, 'Jhoana Galande', '6', 1110.96875, '2022-10-05 20:22:12', '', 0, '44 Hours W1, 11.25 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 11.25, 0, 24, 18.25, 27.375, '18.25', 23.04, 34.56, 0, 1402.56, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (512, 0, 612, 'Kate Lordan', '7', 623.9375, '2022-10-05 20:22:12', '', 0, '37.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37.25, 0, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 762.88, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (513, 0, 612, 'Kier Karlo Vea', '8', 850.0625, '2022-10-05 20:22:12', '', 0, '44 Hours W1, 4.5 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 4.5, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 1039.36, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (514, 0, 612, 'Lorjayson Ambrosio', '9', 628.125, '2022-10-05 20:22:12', '', 0, '37.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37.5, 0, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 768, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (515, 0, 612, 'Melvin Alejo', '10', 674.1875, '2022-10-05 20:22:12', '', 0, '40.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40.25, 0, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 824.32, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (516, 0, 612, 'Rodante Chavez', '11', 134, '2022-10-05 20:22:12', '', 0, '8 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 8, 0, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 163.84, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (517, 0, 612, 'Sherryna Luna', '12', 456.4375, '2022-10-05 20:22:12', '', 0, '27.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 27.25, 0, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 558.08, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (518, 0, 612, 'Tristan Eric Divina', '13', 912.875, '2022-10-05 20:22:12', '', 0, '44 Hours W1, 7 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 7, 0, 1, 16.75, 25.125, '16.75', 20.48, 30.72, 0, 1116.16, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (519, 0, 613, 'Catherine James', '1', 650, '2022-10-05 20:22:19', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 819.2, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (520, 0, 613, 'Lorenzo Bondad', '2', 605.3125, '2022-10-05 20:22:19', '', 0, '37.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37.25, 0, 0, 1, 16.25, 24.375, '16.25', 20.48, 30.72, 0, 762.88, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (521, 0, 614, 'Luwalhati Ingalla', '1', 660, '2022-10-05 20:22:28', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 16.5, 24.75, '16.5', 19.2, 28.8, 0, 768, 'CI', 0, 10);
INSERT INTO `payrolllistpayment` VALUES (522, 0, 614, 'Ma Lourdes Yzabel Inoncillo', '2', 387.75, '2022-10-05 20:22:28', '', 0, '23.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 23.5, 0, 0, 1, 16.5, 24.75, '16.5', 19.2, 28.8, 0, 451.2, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (523, 0, 614, 'Mary Ann Valmocina', '3', 660, '2022-10-05 20:22:28', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 16.5, 24.75, '16.5', 19.2, 28.8, 0, 768, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (524, 0, 614, 'Paola Ortiz', '4', 660, '2022-10-05 20:22:28', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 16.5, 24.75, '16.5', 19.2, 28.8, 0, 768, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (525, 0, 615, 'Aanchal Mehta', '1', 690, '2022-10-07 16:38:34', '', 0, '46 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 46, 0, 0, 1, 15, 22.5, '0', 17, 25.5, 0, 782, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (526, 0, 615, 'Elizabeth Vega', '2', 811.75, '2022-10-07 16:38:34', '', 0, '47.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 47.75, 0, 0, 35, 17, 25.5, '0', 19, 28.5, 0, 907.25, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (527, 0, 615, 'Jashandeep Singh', '3', 630, '2022-10-07 16:38:34', '', 0, '42 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42, 0, 0, 1, 15, 22.5, '0', 17, 25.5, 0, 714, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (528, 0, 615, 'Karen Ramirez', '4', 120, '2022-10-07 16:38:34', '', 0, '8 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 8, 0, 0, 1, 15, 22.5, '0', 17, 25.5, 0, 136, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (529, 0, 615, 'Loveleen Kaur Brar', '5', 510, '2022-10-07 16:38:34', '', 0, '34 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34, 0, 0, 1, 15, 22.5, '0', 17, 25.5, 0, 578, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (530, 0, 616, 'Alvin Abitong', '1', 551.25, '2022-10-07 16:45:57', '', 0, '36.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 36.75, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 621.075, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (531, 0, 616, 'Ariel Dela Cruz', '2', 168.75, '2022-10-07 16:45:57', '', 0, '11.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 11.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 190.125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (532, 0, 616, 'Deimi Aguilar Reyna', '3', 663.75, '2022-10-07 16:45:57', '', 0, '44.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 747.825, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (533, 0, 616, 'Diem Nguyen', '4', 637.5, '2022-10-07 16:45:57', '', 0, '42.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 718.25, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (534, 0, 616, 'Ernesto Mariano', '5', 142.5, '2022-10-07 16:45:57', '', 0, '9.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 9.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 160.55, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (535, 0, 616, 'Esmirna Cordova', '6', 705, '2022-10-07 16:45:57', '', 0, '47 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 47, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 794.3, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (536, 0, 616, 'John Ray Ed', '7', 693.75, '2022-10-07 16:45:57', '', 0, '46.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 46.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 781.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (537, 0, 616, 'Marvin Basco', '8', 727.5, '2022-10-07 16:45:57', '', 0, '48.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 48.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 819.65, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (538, 0, 616, 'May Lapacan', '9', 615, '2022-10-07 16:45:57', '', 0, '41 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 692.9, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (539, 0, 616, 'Michael Deonoso', '10', 690, '2022-10-07 16:45:57', '', 0, '46 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 46, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 777.4, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (540, 0, 616, 'Pauline Garcia', '11', 135, '2022-10-07 16:45:57', '', 0, '9 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 9, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 152.1, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (541, 0, 616, 'Phuc Lam', '12', 795, '2022-10-07 16:45:57', '', 0, '53 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 53, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 895.7, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (542, 0, 616, 'Phung Le', '13', 656.25, '2022-10-07 16:45:57', '', 0, '43.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43.75, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 739.375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (543, 0, 616, 'Rowena Daquiz', '14', 678.75, '2022-10-07 16:45:57', '', 0, '45.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 45.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 764.725, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (544, 0, 616, 'Savetri Singh', '15', 652.5, '2022-10-07 16:45:57', '', 0, '43.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 43.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 735.15, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (545, 0, 616, 'Sindy Leal', '16', 802.5, '2022-10-07 16:45:57', '', 0, '53.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 53.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 904.15, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (546, 0, 616, 'Wendy Ramirez Camacio', '17', 847.5, '2022-10-07 16:45:57', '', 0, '56.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 56.5, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 954.85, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (547, 0, 616, 'Yareli Alvarado', '18', 536.25, '2022-10-07 16:45:57', '', 0, '35.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.75, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 604.175, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (548, 0, 616, 'Yesenia Corral Rosales', '19', 660, '2022-10-07 16:45:57', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 743.6, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (549, 0, 616, 'Jefferson Gomez', '20', 1077.25, '2022-10-07 16:45:57', '', 0, '69.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 69.5, 0, 0, 35, 15.5, 23.25, '0', 17.9, 26.85, 0, 1244.05, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (550, 0, 616, 'Joman Sheshara', '21', 701.375, '2022-10-07 16:45:57', '', 0, '45.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 45.25, 0, 0, 35, 15.5, 23.25, '0', 17.9, 26.85, 0, 809.975, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (551, 0, 616, 'Leopoldo Perez', '22', 759.5, '2022-10-07 16:45:57', '', 0, '49 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 49, 0, 0, 35, 15.5, 23.25, '0', 17.9, 26.85, 0, 877.1, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (552, 0, 616, 'Bernardo Edano', '23', 1116, '2022-10-07 16:45:57', '', 0, '69.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 69.75, 0, 0, 7, 16, 24, '0', 17.4, 26.1, 0, 1213.65, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (553, 0, 616, 'Paulo Basco', '24', 620.5, '2022-10-07 16:45:57', '', 0, '36.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 36.5, 0, 0, 11, 17, 25.5, '0', 18.9, 28.35, 0, 689.85, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (554, 0, 616, 'Sherwin Ramirez', '25', 1126.25, '2022-10-07 16:45:57', '', 0, '66.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 66.25, 0, 0, 11, 17, 25.5, '0', 18.9, 28.35, 0, 1252.125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (555, 0, 616, 'Romel Castro', '26', 1049.75, '2022-10-07 16:45:57', '', 0, '61.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 61.75, 0, 0, 11, 17, 25.5, '0', 18.9, 28.35, 0, 1167.075, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (556, 0, 616, 'Justin Franks', '27', 1050, '2022-10-07 16:45:57', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 23, 26.25, 39.375, '0', 28.25, 42.375, 0, 1130, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (557, 0, 616, 'Orlando Romero', '28', 408.75, '2022-10-07 16:45:57', '', 0, '27.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 27.25, 0, 0, 1, 15, 22.5, '0', 16.9, 25.35, 0, 460.525, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (564, 0, 587, 'Carmelita Manumbali', '1', 671, '2022-10-07 19:07:15', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 825, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (565, 0, 587, 'Dany Nguyen', '2', 868, '2022-10-07 19:07:15', '', 0, '56 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 56, 0, 0, 1, 15.5, 23.25, '0', 18.75, 28.125, 0, 1050, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (566, 0, 587, 'Guillerma Dinglasan', '3', 823.5, '2022-10-07 19:07:15', '', 0, '54 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 54, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 1012.5, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (567, 0, 587, 'Hana', '4', 777.75, '2022-10-07 19:07:15', '', 0, '51 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 51, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 956.25, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (568, 0, 587, 'Hendrawati', '5', 991.25, '2022-10-07 19:07:15', '', 0, '65 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 65, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 1218.75, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (569, 0, 587, 'Hope Rosco', '6', 701.5, '2022-10-07 19:07:15', '', 0, '46 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 46, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 862.5, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (570, 0, 587, 'Maria Jose Gutierrez ', '7', 762.5, '2022-10-07 19:07:15', '', 0, '50 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 50, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 937.5, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (571, 0, 587, 'Michelle Arce', '8', 541.375, '2022-10-07 19:07:15', '', 0, '35.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.5, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 665.625, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (572, 0, 587, 'Midori Serrano', '9', 777.75, '2022-10-07 19:07:15', '', 0, '51 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 51, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 956.25, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (573, 0, 587, 'Noraiza Aborque', '10', 1029.375, '2022-10-07 19:07:15', '', 0, '67.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 67.5, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 1265.625, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (574, 0, 587, 'Pham Huong', '11', 777.75, '2022-10-07 19:07:15', '', 0, '51 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 51, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 956.25, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (575, 0, 587, 'Ricardo Chavez', '12', 782.75, '2022-10-07 19:07:15', '', 0, '50.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 50.5, 0, 0, 1, 15.5, 23.25, '0', 18.75, 28.125, 0, 946.875, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (576, 0, 587, 'Sarabjit Kaur', '13', 312.625, '2022-10-07 19:07:15', '', 0, '20.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 20.5, 0, 0, 1, 15.25, 22.875, '0', 18.75, 28.125, 0, 384.375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (577, 0, 617, 'Edwin Holguin', '1', 1738.5, '2022-10-11 17:46:52', '', 0, '40 Hours W1,  OT Hours W1, 44 Hours W2, 5 OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 84, 5, 0, 11, 19, 28.5, '19', 24.5, 36.75, 0, 2241.75, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (600, 0, 619, 'Ademola Nasiru', '1', 193.75, '2022-10-11 19:14:24', '', 0, '12.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 12.5, 0, 0, 14, 15.5, 23.25, '0', 18.75, 28.125, 0, 234.375, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (601, 0, 620, 'Christine Dakiwag', '1', 1113, '2022-10-11 19:14:35', '', 0, '44 Hours W1, 6 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 6, 0, 36, 21, 31.5, '21', 0, 0, 0, 0, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (602, 0, 620, 'Fernando Ramos', '2', 1003, '2022-10-11 19:14:35', '', 0, '44 Hours W1, 10 OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 10, 0, 0, 17, 25.5, '17', 20.06, 30.09, 0, 1183.54, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (603, 0, 621, 'Aries Relova', '1', 684.2500000000001, '2022-10-11 19:14:44', '', 0, '42.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.5, 0, 0, 1, 16.1, 24.15, '0', 19.81, 29.715, 0, 841.925, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (604, 0, 621, 'Christopher Mostajo', '2', 788.9000000000001, '2022-10-11 19:14:44', '', 0, '49 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 49, 0, 0, 1, 16.1, 24.15, '0', 19.81, 29.715, 0, 970.69, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (605, 0, 621, 'Jhun Sotelo', '3', 660.1, '2022-10-11 19:14:44', '', 0, '41 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41, 0, 0, 1, 16.1, 24.15, '0', 19.81, 29.715, 0, 812.21, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (606, 0, 621, 'Quirino Borreta', '4', 684.2500000000001, '2022-10-11 19:14:44', '', 0, '42.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.5, 0, 0, 1, 16.1, 24.15, '0', 19.81, 29.715, 0, 841.925, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (607, 0, 623, 'Roberto Nelmida', '1', 640, '2022-10-11 19:14:59', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 18, 16, 24, '0', 19.18, 28.77, 0, 767.2, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (608, 0, 624, 'Christopher Joseph', '1', 608.375, '2022-10-11 19:15:09', '', 0, '39.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39.25, 0, 0, 1, 15.5, 23.25, '0', 18.42, 27.63, 0, 722.985, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (609, 0, 624, 'Generose Yap', '2', 488.25, '2022-10-11 19:15:09', '', 0, '31.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31.5, 0, 0, 1, 15.5, 23.25, '0', 18.42, 27.63, 0, 580.23, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (610, 0, 624, 'Hubert Williams', '3', 592.875, '2022-10-11 19:15:09', '', 0, '38.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 38.25, 0, 0, 1, 15.5, 23.25, '0', 18.42, 27.63, 0, 704.565, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (611, 0, 624, 'Kamylle Calimlim', '4', 612.25, '2022-10-11 19:15:09', '', 0, '39.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39.5, 0, 0, 1, 15.5, 23.25, '0', 18.42, 27.63, 0, 727.59, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (612, 0, 624, 'Patricia Reyes', '5', 608.375, '2022-10-11 19:15:09', '', 0, '39.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39.25, 0, 0, 1, 15.5, 23.25, '0', 18.42, 27.63, 0, 722.985, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (613, 0, 624, 'Samayuri Carrera', '6', 612.25, '2022-10-11 19:15:09', '', 0, '39.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39.5, 0, 0, 1, 15.5, 23.25, '0', 18.42, 27.63, 0, 727.59, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (616, 0, 626, 'Adrian Palangeo', '1', 660, '2022-10-11 19:15:30', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 0, 16.5, 24.75, '0', 18.75, 28.125, 0, 750, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (617, 0, 626, 'Charles Ssekatawa', '2', 519.75, '2022-10-11 19:15:30', '', 0, '31.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31.5, 0, 0, 0, 16.5, 24.75, '0', 18.75, 28.125, 0, 590.625, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (618, 0, 626, 'David Arobo-Ilesanmi', '3', 660, '2022-10-11 19:15:30', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 0, 16.5, 24.75, '0', 18.75, 28.125, 0, 750, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (619, 0, 626, 'Hussein Ssenyonjo', '4', 519.75, '2022-10-11 19:15:30', '', 0, '31.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31.5, 0, 0, 0, 16.5, 24.75, '0', 18.75, 28.125, 0, 590.625, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (620, 0, 626, 'Jesuis Zabala', '5', 132, '2022-10-11 19:15:30', '', 0, '8 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 8, 0, 0, 0, 16.5, 24.75, '0', 18.75, 28.125, 0, 150, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (621, 0, 626, 'Macdonald Ombongi', '6', 585.75, '2022-10-11 19:15:30', '', 0, '35.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.5, 0, 0, 0, 16.5, 24.75, '0', 18.75, 28.125, 0, 665.625, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (622, 0, 626, 'Stephen Kariuki', '7', 519.75, '2022-10-11 19:15:30', '', 0, '31.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31.5, 0, 0, 0, 16.5, 24.75, '0', 18.75, 28.125, 0, 590.625, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (623, 0, 641, 'Adrian Palangeo', '7', 660, '2022-10-11 19:16:10', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 56, 24.64, 36.96, '0.00', 0, 0, 0, 0, ' CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (624, 0, 641, 'Charles Ssekatawa', '7', 383.62, '2022-10-11 19:16:10', '', 0, '23.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 23.25, 0, 0, 56, 24.64, 36.96, '0.00', 0, 0, 0, 0, ' CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (625, 0, 641, 'David Arobo-Ilesanmi', '7', 660, '2022-10-11 19:16:10', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 57, 22.08, 33.12, '0.00', 0, 0, 0, 0, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (626, 0, 641, 'Hussein Ssenyonjo', '7', 660, '2022-10-11 19:16:10', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 57, 22.08, 33.12, '0.00', 0, 0, 0, 0, ' CI', 0, 0);
INSERT INTO `payrolllistpayment` VALUES (627, 0, 641, 'Macdonald Ombongi', '7', 589.87, '2022-10-11 19:16:10', '', 0, '35.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.75, 0, 0, 58, 22.8, 31.2, '0.00', 0, 0, 0, 0, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (628, 0, 641, 'Stephen Kariuki', '7', 660, '2022-10-11 19:16:10', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 58, 22.8, 31.2, '0.00', 0, 0, 0, 0, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (629, 0, 627, 'Aaron Gaac', '1', 1385.5, '2022-10-11 19:16:24', '', 0, '81.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 81.5, 0, 0, 21, 17, 25.5, '0', 20.4, 30.6, 0, 1662.6, '', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (630, 0, 627, 'Amy Misa', '2', 1024, '2022-10-11 19:16:24', '', 0, '64 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 64, 0, 0, 1, 16, 24, '0', 18.6, 27.9, 0, 1190.4, '', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (631, 0, 627, 'Daven Dale Gaac', '3', 1489.5, '2022-10-11 19:16:24', '', 0, '82.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 82.75, 0, 0, 37, 18, 27, '0', 21.6, 32.40000000000001, 0, 1787.4, '', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (632, 0, 627, 'Greg Leonce', '4', 1600, '2022-10-11 19:16:24', '', 0, '80 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 80, 0, 0, 22, 20, 30, '0', 24, 36, 0, 1920, '', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (633, 0, 627, 'Narciso Campana', '5', 1300.5, '2022-10-11 19:16:24', '', 0, '76.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 76.5, 0, 0, 21, 17, 25.5, '0', 20.4, 30.6, 0, 1560.6, '', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (634, 0, 627, 'Rigor Pineda', '6', 1024, '2022-10-11 19:16:24', '', 0, '64 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 64, 0, 0, 1, 16, 24, '0', 18.6, 27.9, 0, 1190.4, '', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (635, 0, 628, 'Candy Inayan', '1', 620, '2022-10-11 19:16:39', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15.5, 23.25, '0', 19.05, 28.575, 0, 762, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (636, 0, 628, 'Davinder Hari', '2', 403, '2022-10-11 19:16:39', '', 0, '26 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 26, 0, 0, 1, 15.5, 23.25, '0', 19.05, 28.575, 0, 495.3, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (637, 0, 628, 'Lizbeth Ang', '3', 620, '2022-10-11 19:16:39', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15.5, 23.25, '0', 19.05, 28.575, 0, 762, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (638, 0, 628, 'Mary Ann Parreno', '4', 620, '2022-10-11 19:16:39', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15.5, 23.25, '0', 19.05, 28.575, 0, 762, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (639, 0, 628, 'Patricia Heron', '5', 418.5, '2022-10-11 19:16:39', '', 0, '27 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 27, 0, 0, 1, 15.5, 23.25, '0', 19.05, 28.575, 0, 514.35, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (640, 0, 628, 'Rethelje Ledda', '6', 496, '2022-10-11 19:16:39', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15.5, 23.25, '0', 19.05, 28.575, 0, 609.6, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (643, 0, 631, 'Aadil Farah', '1', 897.75, '2022-10-11 19:17:02', '', 0, '42.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 42.75, 0, 0, 30, 21, 31.5, '0', 26.25, 39.375, 0, 1122.1875, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (644, 0, 631, 'Abimael Reyes', '2', 80, '2022-10-11 19:17:02', '', 0, '5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 5, 0, 0, 27, 16, 24, '0', 20, 30, 0, 100, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (645, 0, 631, 'Alan Gallegos', '3', 432, '2022-10-11 19:17:02', '', 0, '27 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 27, 0, 0, 27, 16, 24, '0', 20, 30, 0, 540, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (646, 0, 631, 'Alan Pavel Santiago Rojas', '4', 312, '2022-10-11 19:17:02', '', 0, '19.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 19.5, 0, 0, 27, 16, 24, '0', 20, 30, 0, 390, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (647, 0, 631, 'Alexis Valdivia', '5', 907.5, '2022-10-11 19:17:02', '', 0, '41.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41.25, 0, 0, 31, 22, 33, '0', 27.5, 41.25, 0, 1134.375, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (648, 0, 631, 'Angel Lara Mendoza', '6', 312, '2022-10-11 19:17:02', '', 0, '19.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 19.5, 0, 0, 27, 16, 24, '0', 20, 30, 0, 390, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (649, 0, 631, 'Antonio Valdivia', '7', 636, '2022-10-11 19:17:02', '', 0, '39.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39.75, 0, 0, 27, 16, 24, '0', 20, 30, 0, 795, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (650, 0, 631, 'Claudette Williams', '8', 378, '2022-10-11 19:17:02', '', 0, '21 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 21, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 472.5, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (651, 0, 631, 'Eddie Teodoro', '9', 56, '2022-10-11 19:17:02', '', 0, '3.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 3.5, 0, 0, 27, 16, 24, '0', 20, 30, 0, 70, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (652, 0, 631, 'Guillermo Lara Pantoja', '10', 144, '2022-10-11 19:17:02', '', 0, '9 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 9, 0, 0, 27, 16, 24, '0', 20, 30, 0, 180, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (653, 0, 631, 'Josue Vasquez', '11', 448, '2022-10-11 19:17:02', '', 0, '28 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 28, 0, 0, 27, 16, 24, '0', 20, 30, 0, 560, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (654, 0, 631, 'Karen Alban', '12', 792, '2022-10-11 19:17:02', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 990, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (655, 0, 631, 'Karen Manuel', '13', 792, '2022-10-11 19:17:02', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 990, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (656, 0, 631, 'Love Kalyan', '14', 704, '2022-10-11 19:17:02', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 27, 16, 24, '0', 20, 30, 0, 880, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (657, 0, 631, 'Mariam Shamaon', '15', 720, '2022-10-11 19:17:02', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 900, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (658, 0, 631, 'Maribel Manuel', '16', 468, '2022-10-11 19:17:02', '', 0, '26 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 26, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 585, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (659, 0, 631, 'Mark Manuel', '17', 792, '2022-10-11 19:17:02', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 990, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (660, 0, 631, 'Miraji Ali', '18', 408, '2022-10-11 19:17:02', '', 0, '25.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 25.5, 0, 0, 27, 16, 24, '0', 20, 30, 0, 510, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (661, 0, 631, 'Robert Gonzales', '19', 880, '2022-10-11 19:17:02', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 29, 20, 30, '0', 25, 37.5, 0, 1100, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (662, 0, 631, 'Rolly Piano', '20', 304, '2022-10-11 19:17:02', '', 0, '19 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 19, 0, 0, 27, 16, 24, '0', 20, 30, 0, 380, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (663, 0, 631, 'Ryan Calamdag', '21', 792, '2022-10-11 19:17:02', '', 0, '44 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 44, 0, 0, 28, 18, 27, '0', 22.5, 33.75, 0, 990, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (664, 0, 631, 'Sebastian Ahumada', '22', 682, '2022-10-11 19:17:02', '', 0, '31 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31, 0, 0, 32, 22, 33, '0', 27.5, 41.25, 0, 852.5, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (665, 0, 632, 'Angel Lara Mendoza', '1', 344, '2022-10-11 19:17:11', '', 0, '21.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 21.5, 0, 0, 1, 16, 24, '0', 19.05, 28.575, 0, 409.575, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (666, 0, 633, 'Clint Reyes', '1', 620, '2022-10-11 19:17:21', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 736.8, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (667, 0, 633, 'Gurpreet Singh', '2', 850, '2022-10-11 19:17:21', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 23, 21.25, 31.875, '21.25', 0, 0, 0, 0, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (668, 0, 633, 'Ricardo Barrientos', '3', 680, '2022-10-11 19:17:21', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 19, 17, 25.5, '17', 20.88, 31.32, 0, 835.2, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (669, 0, 634, 'Adelina Cortado', '1', 155, '2022-10-11 19:17:38', '', 0, '10 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 10, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 184.2, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (670, 0, 634, 'Dulce Baldivicio', '2', 198.09, '2022-10-11 19:17:38', '', 0, '12.78 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 12.78, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 235.4076, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (671, 0, 634, 'Rodel Baldivicio', '3', 216.225, '2022-10-11 19:17:38', '', 0, '13.95 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 13.95, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 256.959, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (672, 0, 635, 'Fernando Zagala', '1', 159.185, '2022-10-11 19:17:47', '', 0, '10.27 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 10.27, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 189.1734, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (673, 0, 635, 'Franco Dimaandal', '2', 309.225, '2022-10-11 19:17:47', '', 0, '19.95 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 19.95, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 367.479, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (674, 0, 635, 'Jerick Cabarloc', '3', 480.5, '2022-10-11 19:17:47', '', 0, '31 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 31, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 571.02, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (675, 0, 636, 'Rahul Behal', '1', 434, '2022-10-11 19:17:56', '', 0, '28 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 28, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 515.76, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (677, 0, 638, 'Arshdeep Singh', '1', 496, '2022-10-11 19:18:17', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 589.44, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (678, 0, 638, 'Manpreet Kaur', '2', 475.23, '2022-10-11 19:18:17', '', 0, '30.66 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 30.66, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 564.7572, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (679, 0, 638, 'Navjot Kaur', '3', 496, '2022-10-11 19:18:17', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 589.44, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (680, 0, 638, 'Navneet Kaur Bhupal', '4', 496, '2022-10-11 19:18:17', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 589.44, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (681, 0, 638, 'Sukhdeep Singh', '5', 620, '2022-10-11 19:18:17', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 736.8, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (682, 0, 639, 'Gagandeep Kaur', '1', 744, '2022-10-11 19:18:26', '', 0, '48 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 48, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 884.16, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (683, 0, 639, 'Kiranjit Kaur', '2', 496, '2022-10-11 19:18:26', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 589.44, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (684, 0, 639, 'Manmeet Kaur', '3', 496, '2022-10-11 19:18:26', '', 0, '32 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 32, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 589.44, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (685, 0, 639, 'Navneet Kaur', '4', 248, '2022-10-11 19:18:26', '', 0, '16 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 16, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 294.72, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (686, 0, 639, 'Ramandeep Kaur', '5', 581.25, '2022-10-11 19:18:26', '', 0, '37.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37.5, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 690.75, 'PCR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (687, 0, 640, 'Chhinder Sidhu', '1', 697.5, '2022-10-11 19:18:39', '', 0, '45 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 45, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 828.9, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (688, 0, 640, 'Manjit Dhindsa Kaur', '2', 697.5, '2022-10-11 19:18:39', '', 0, '45 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 45, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 828.9, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (689, 0, 640, 'Rakhvir Talwar', '3', 608.375, '2022-10-11 19:18:39', '', 0, '39.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39.25, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 722.985, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (690, 0, 637, 'Hrithik Malhotra', '1', 387.5, '2022-10-11 19:28:31', '', 0, '25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 25, 0, 0, 1, 15.5, 23.25, '15.5', 18.42, 27.63, 0, 460.5, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (713, 0, 618, 'Abigail Reyes', '1', 534.75, '2022-10-11 19:37:20', '', 0, '34.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 629.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (714, 0, 618, 'Adriana Mendez', '2', 586.25, '2022-10-11 19:37:20', '', 0, '33.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 33.5, 0, 0, 12, 17.5, 26.25, '0', 20.6, 30.9, 0, 690.1, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (715, 0, 618, 'Carmelita Abaniel', '3', 538.625, '2022-10-11 19:37:20', '', 0, '34.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 634.1875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (716, 0, 618, 'Carol Dominguez', '4', 542.5, '2022-10-11 19:37:20', '', 0, '35 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 638.75, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (717, 0, 618, 'Clayton Ricketts', '5', 780, '2022-10-11 19:37:20', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 14, 19.5, 29.25, '0', 23, 34.5, 0, 920, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (718, 0, 618, 'Delroy Downsend', '6', 858, '2022-10-11 19:37:20', '', 0, '39 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39, 0, 0, 16, 22, 33, '0', 23.55, 35.325, 0, 918.45, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (719, 0, 618, 'Eduardo Lopez', '7', 569.625, '2022-10-11 19:37:20', '', 0, '36.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 36.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 670.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (720, 0, 618, 'Elna Mae Macarayan', '8', 534.75, '2022-10-11 19:37:20', '', 0, '34.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 629.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (721, 0, 618, 'Itzel De Paz', '9', 368.125, '2022-10-11 19:37:20', '', 0, '23.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 23.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 433.4375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (722, 0, 618, 'Jackelyn Munoz', '10', 569.625, '2022-10-11 19:37:20', '', 0, '36.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 36.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 670.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (723, 0, 618, 'Jacqueline Galicia', '11', 688.875, '2022-10-11 19:37:20', '', 0, '41.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41.75, 0, 0, 35, 16.5, 24.75, '0', 18.25, 27.375, 0, 761.9375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (724, 0, 618, 'Laishan Nabocyag', '12', 542.5, '2022-10-11 19:37:20', '', 0, '35 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 638.75, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (725, 0, 618, 'Luis Alberto Gallardo', '13', 585.125, '2022-10-11 19:37:20', '', 0, '37.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 688.9375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (726, 0, 618, 'Maria De Jesus', '14', 546.375, '2022-10-11 19:37:20', '', 0, '35.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.25, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 643.3125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (727, 0, 618, 'Maria Delgado', '15', 596.75, '2022-10-11 19:37:20', '', 0, '38.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 38.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 702.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (728, 0, 618, 'Marianne Mangacat', '16', 511.5, '2022-10-11 19:37:20', '', 0, '33 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 33, 0, 0, 1, 15.5, 23.25, '10', 18.25, 27.375, 0, 602.25, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (729, 0, 618, 'Rebecca Dominguez', '17', 418.5, '2022-10-11 19:37:20', '', 0, '27 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 27, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 492.75, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (730, 0, 618, 'Rodolfo Valencia', '18', 546.375, '2022-10-11 19:37:20', '', 0, '35.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.25, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 643.3125, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (731, 0, 618, 'Rubai Rubai', '19', 538.625, '2022-10-11 19:37:20', '', 0, '34.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 634.1875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (732, 0, 618, 'Thuy Le', '20', 310, '2022-10-11 19:37:20', '', 0, '20 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 20, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 365, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (733, 0, 618, 'Veronica David', '21', 542.5, '2022-10-11 19:37:20', '', 0, '35 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 638.75, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (734, 0, 618, 'Xochitl Gomez', '22', 538.625, '2022-10-11 19:37:20', '', 0, '34.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 634.1875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (735, 0, 625, 'Dale Viado', '1', 102, '2022-10-11 19:42:57', '', 0, '6 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 6, 0, 0, 35, 17, 25.5, '0', 18.42, 27.63, 0, 110.52, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (736, 0, 625, 'Hussein Ssenyonjo', '2', 17, '2022-10-11 19:42:57', '', 0, '1 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 1, 0, 0, 35, 17, 25.5, '0', 18.42, 27.63, 0, 18.42, 'CI', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (737, 0, 630, 'Marie Iso', '1', 387, '2022-10-11 19:48:44', '', 0, '21.5 Hours W1 -  OT Hours W1 -  Hours W2 -  OT Hours W2 -  STAT Hours W1 -  STAT Hours W2 ', 21.5, 0, 0, 1, 18, 27, '0', 23.05, 34.575, 0, 495.575, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (738, 0, 630, 'Michelle Quedado', '2', 706.5, '2022-10-11 19:48:44', '', 0, '39.25 Hours W1 -  OT Hours W1 -  Hours W2 -  OT Hours W2 -  STAT Hours W1 -  STAT Hours W2 ', 39.25, 0, 0, 1, 18, 27, '0', 23.05, 34.575, 0, 904.7125, 'P', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (739, 0, 642, 'Abigail Reyes', '23', 534.75, '2022-10-12 21:57:58', '', 0, '34.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.5, 0, 0, 10, 17.5, 26.25, '0.00', 20.6, 30.9, 0, 629.62, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (740, 0, 642, 'Adriana Mendez', '2', 586.25, '2022-10-12 21:57:58', '', 0, '33.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 33.5, 0, 0, 12, 17.5, 26.25, '0', 20.6, 30.9, 0, 690.1, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (741, 0, 642, 'Carmelita Abaniel', '23', 538.62, '2022-10-12 21:57:58', '', 0, '34.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.75, 0, 0, 11, 18.5, 27.75, '0.00', 21.78, 32.67, 0, 634.18, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (742, 0, 642, 'Carol Dominguez', '23', 542.5, '2022-10-12 21:57:58', '', 0, '35 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35, 0, 0, 12, 20, 30, '0.00', 23.55, 35.33, 0, 638.75, ' CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (743, 0, 642, 'Clayton Ricketts', '23', 780, '2022-10-12 21:57:58', '', 0, '40 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 40, 0, 0, 10, 17.5, 26.25, '0.00', 20.6, 30.9, 0, 920, ' CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (744, 0, 642, 'Delroy Downsend', '6', 858, '2022-10-12 21:57:58', '', 0, '39 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 39, 0, 0, 16, 22, 33, '0', 23.55, 35.325, 0, 918.45, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (745, 0, 642, 'Eduardo Lopez', '7', 569.625, '2022-10-12 21:57:58', '', 0, '36.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 36.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 670.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (746, 0, 642, 'Elna Mae Macarayan', '8', 534.75, '2022-10-12 21:57:58', '', 0, '34.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 629.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (747, 0, 642, 'Itzel De Paz', '9', 368.125, '2022-10-12 21:57:58', '', 0, '23.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 23.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 433.4375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (748, 0, 642, 'Jackelyn Munoz', '10', 569.625, '2022-10-12 21:57:58', '', 0, '36.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 36.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 670.6875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (749, 0, 642, 'Jacqueline Galicia', '11', 688.875, '2022-10-12 21:57:58', '', 0, '41.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 41.75, 0, 0, 35, 16.5, 24.75, '0', 18.25, 27.375, 0, 761.9375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (750, 0, 642, 'Laishan Nabocyag', '12', 542.5, '2022-10-12 21:57:58', '', 0, '35 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 638.75, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (751, 0, 642, 'Luis Alberto Gallardo', '13', 585.125, '2022-10-12 21:57:58', '', 0, '37.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 37.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 688.9375, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (752, 0, 642, 'Maria De Jesus', '14', 546.375, '2022-10-12 21:57:58', '', 0, '35.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.25, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 643.3125, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (753, 0, 642, 'Maria Delgado', '15', 596.75, '2022-10-12 21:57:58', '', 0, '38.5 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 38.5, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 702.625, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (754, 0, 642, 'Marianne Mangacat', '16', 511.5, '2022-10-12 21:57:58', '', 0, '33 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 33, 0, 0, 1, 15.5, 23.25, '10', 18.25, 27.375, 0, 602.25, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (755, 0, 642, 'Rebecca Dominguez', '17', 418.5, '2022-10-12 21:57:58', '', 0, '27 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 27, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 492.75, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (756, 0, 642, 'Rodolfo Valencia', '18', 546.375, '2022-10-12 21:57:58', '', 0, '35.25 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35.25, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 643.3125, 'DDC', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (757, 0, 642, 'Rubai Rubai', '19', 538.625, '2022-10-12 21:57:58', '', 0, '34.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 634.1875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (758, 0, 642, 'Thuy Le', '20', 310, '2022-10-12 21:57:58', '', 0, '20 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 20, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 365, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (759, 0, 642, 'Veronica David', '21', 542.5, '2022-10-12 21:57:58', '', 0, '35 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 35, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 638.75, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (760, 0, 642, 'Xochitl Gomez', '22', 538.625, '2022-10-12 21:57:58', '', 0, '34.75 Hours W1,  OT Hours W1,  Hours W2,  OT Hours W2,  STAT Hours W1,  STAT Hours W2 ', 34.75, 0, 0, 1, 15.5, 23.25, '0', 18.25, 27.375, 0, 634.1875, 'CR', 0, 20);
INSERT INTO `payrolllistpayment` VALUES (761, 0, 629, 'Sergio Aza', '2', 0, NULL, '', 0, '', 40, 0, 0, 1, 0, 0, '0.00', 0, 0, 0, 0, ' CR', 0, 0);
INSERT INTO `payrolllistpayment` VALUES (762, 0, 629, 'Sergio Aza', '2', 600, NULL, '', 0, '', 40, 0, 0, 1, 15, 0, '0.00', 0, 0, 0, 0, ' CR', 0, 0);
INSERT INTO `payrolllistpayment` VALUES (795, 0, 643, 'ANGIE', '4', 3040, NULL, NULL, 0, '', 12, 20, 25, 104, 45, 67.5, '60.00', 50, 75, 65, 3325, ' CR', NULL, 20);
INSERT INTO `payrolllistpayment` VALUES (796, 0, 643, 'GLORIA', '4', 2550, NULL, NULL, 0, '', 20, 15, 15, 103, 45, 50, '60.00', 50, 55, 65, 2800, ' P', NULL, 20);
INSERT INTO `payrolllistpayment` VALUES (797, 0, 643, 'JESSIKA', '4', 3937.5, NULL, NULL, 0, '', 10, 25, 30, 104, 45, 67.5, '60.00', 50, 75, 65, 4325, 'DDC', NULL, 20);

-- ----------------------------
-- Table structure for payrolltransaction
-- ----------------------------
DROP TABLE IF EXISTS `payrolltransaction`;
CREATE TABLE `payrolltransaction`  (
  `PayrollTransactionId` int NOT NULL AUTO_INCREMENT,
  `PayrollTransaction_TransactionId` int NOT NULL,
  `PayrollTransaction_ListId` int NOT NULL,
  `PayrollTransactionClientName` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PayrollTransactionClientPhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PayrollTransaction_PayrolllistpaymentId` int NULL DEFAULT NULL,
  PRIMARY KEY (`PayrollTransactionId`) USING BTREE,
  INDEX `fk_payrolltransaction_transaction_id`(`PayrollTransaction_TransactionId` ASC) USING BTREE,
  INDEX `fk_payrolltransaction_list_id`(`PayrollTransaction_ListId` ASC) USING BTREE,
  CONSTRAINT `fk_payrolltransaction_list_id` FOREIGN KEY (`PayrollTransaction_ListId`) REFERENCES `payrolllist` (`PayrollListId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_payrolltransaction_transaction_id` FOREIGN KEY (`PayrollTransaction_TransactionId`) REFERENCES `transaction` (`TransactionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payrolltransaction
-- ----------------------------

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `ProvinceId` int NOT NULL AUTO_INCREMENT,
  `ProvinceName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProvinceAbbr` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Province_CountryId` int NOT NULL,
  PRIMARY KEY (`ProvinceId`) USING BTREE,
  INDEX `fk_Province_Country1_idx`(`Province_CountryId` ASC) USING BTREE,
  CONSTRAINT `fk_Province_Country1` FOREIGN KEY (`Province_CountryId`) REFERENCES `country` (`CountryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1, 'Ontario', 'ON', 1);
INSERT INTO `province` VALUES (2, 'Quebec', 'QC', 1);
INSERT INTO `province` VALUES (3, 'Nova Scotia', 'NS', 1);
INSERT INTO `province` VALUES (4, 'New Brunswick', 'NB', 1);
INSERT INTO `province` VALUES (5, 'Manitoba', 'MB', 1);
INSERT INTO `province` VALUES (6, 'British Columbia', 'BC', 1);
INSERT INTO `province` VALUES (7, 'Prince Edward', 'PE', 1);
INSERT INTO `province` VALUES (8, 'Saskatchewan', 'SK', 1);
INSERT INTO `province` VALUES (9, 'Alberta', 'AB', 1);
INSERT INTO `province` VALUES (10, 'Newfoundland and Labrador', 'NL', 1);
INSERT INTO `province` VALUES (11, 'Northwest Territories', 'NT', 1);
INSERT INTO `province` VALUES (12, 'Yukon', 'YT', 1);
INSERT INTO `province` VALUES (13, 'Nunavut', 'NU', 1);
INSERT INTO `province` VALUES (17, 'Other Province', 'OP', 1);

-- ----------------------------
-- Table structure for sec_apps
-- ----------------------------
DROP TABLE IF EXISTS `sec_apps`;
CREATE TABLE `sec_apps`  (
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`app_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sec_apps
-- ----------------------------
INSERT INTO `sec_apps` VALUES ('1_app_form_add_users', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('1_form_occupation', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('1_form_occupatiorate', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('1_form_office', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('1_form_teller', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('1_form_tellerlogin', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('1_grid_occupatiorate', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('1_grid_useraccount_Cashier', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('2_blank_importar', 'blank', NULL);
INSERT INTO `sec_apps` VALUES ('2_control_PHPExcel', 'contr', NULL);
INSERT INTO `sec_apps` VALUES ('2_form_company', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('2_form_payrolllist', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('2_form_payrolllistpayment_NUEVO', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('2_form_payrolllistpayment_Status', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('2_form_useraccount_Owner', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('2_grid_company', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('2_grid_payrolllist', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('2_grid_payrolllistpayment', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('2_grid_payrolllistpayment_Invoice_Info', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('2_grid_payrolllist_Close', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('2_grid_payrolltransaction', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('2_grid_useraccount_Owner', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('3_form_check', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('3_form_payrollcash', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('3_form_payrolllistpayment', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('3_grid_check', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('3_grid_payrollcash', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('3_grid_payrolllistpayment', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('3_grid_payrolllistpayment_Pay_Pending', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('4_grid_payrolllistpayment_TimeSheet', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('4_grid_payrolllist_Invoice', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('4_pdfreport_payrolllist', 'reportpdf', NULL);
INSERT INTO `sec_apps` VALUES ('app_change_pswd', 'contr', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_form_add_users', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_form_edit_users', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_form_sec_apps', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_form_sec_groups', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_form_sec_groups_apps', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_grid_sec_apps', 'cons', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_grid_sec_groups', 'cons', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_grid_sec_users', 'cons', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_grid_sec_users_groups', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_Login', 'contr', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_menu', 'menu', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_retrieve_pswd', 'contr', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_search_sec_groups', 'filter', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_settings', 'contr', 'Security Application');
INSERT INTO `sec_apps` VALUES ('app_sync_apps', 'contr', 'Security Application');
INSERT INTO `sec_apps` VALUES ('D_form_check_Returned_Status', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('L_form_payrolllistoffice', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('L_form_transaction_TransPEYROLL', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('L_form_transaction_TransPEYROLL_Copia', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('L_grid_payrolllist', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('L_grid_payrolllistoffice', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('L_grid_payrolllistpayment_All', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('L_grid_payrolllistpayment_Closed', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('L_grid_payrolllist_all', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('L_grid_payrolllist_Closed', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('L_grid_payrolltransaction_all', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('L_grid_transaction_TransPEYROLL', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('menu_v9', '', NULL);

-- ----------------------------
-- Table structure for sec_groups
-- ----------------------------
DROP TABLE IF EXISTS `sec_groups`;
CREATE TABLE `sec_groups`  (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  UNIQUE INDEX `description`(`description` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sec_groups
-- ----------------------------
INSERT INTO `sec_groups` VALUES (1, 'Administrador');
INSERT INTO `sec_groups` VALUES (2, 'Group Default');

-- ----------------------------
-- Table structure for sec_groups_apps
-- ----------------------------
DROP TABLE IF EXISTS `sec_groups_apps`;
CREATE TABLE `sec_groups_apps`  (
  `group_id` int NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priv_access` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_insert` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_delete` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_update` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_export` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_print` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`, `app_name`) USING BTREE,
  INDEX `sec_groups_apps_ibfk_2`(`app_name` ASC) USING BTREE,
  CONSTRAINT `sec_groups_apps_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sec_groups_apps_ibfk_2` FOREIGN KEY (`app_name`) REFERENCES `sec_apps` (`app_name`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sec_groups_apps
-- ----------------------------
INSERT INTO `sec_groups_apps` VALUES (1, '1_app_form_add_users', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '1_form_occupation', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '1_form_occupatiorate', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '1_form_office', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '1_form_teller', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '1_form_tellerlogin', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '1_grid_occupatiorate', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '1_grid_useraccount_Cashier', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_blank_importar', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, '2_control_PHPExcel', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, '2_form_company', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_form_payrolllist', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_form_payrolllistpayment_NUEVO', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_form_payrolllistpayment_Status', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_form_useraccount_Owner', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_grid_company', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_grid_payrolllist', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_grid_payrolllistpayment', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_grid_payrolllistpayment_Invoice_Info', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_grid_payrolllist_Close', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_grid_payrolltransaction', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '2_grid_useraccount_Owner', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '3_form_check', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '3_form_payrollcash', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '3_form_payrolllistpayment', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '3_grid_check', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '3_grid_payrollcash', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '3_grid_payrolllistpayment', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '3_grid_payrolllistpayment_Pay_Pending', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '4_grid_payrolllistpayment_TimeSheet', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '4_grid_payrolllist_Invoice', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, '4_pdfreport_payrolllist', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_change_pswd', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_form_add_users', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_form_edit_users', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_form_sec_apps', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_form_sec_groups', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_form_sec_groups_apps', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_grid_sec_apps', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_grid_sec_groups', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_grid_sec_users', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_grid_sec_users_groups', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_Login', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_menu', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_retrieve_pswd', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_search_sec_groups', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_settings', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'app_sync_apps', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'D_form_check_Returned_Status', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_form_payrolllistoffice', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_form_transaction_TransPEYROLL', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_form_transaction_TransPEYROLL_Copia', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_grid_payrolllist', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_grid_payrolllistoffice', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_grid_payrolllistpayment_All', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_grid_payrolllistpayment_Closed', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_grid_payrolllist_all', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_grid_payrolllist_Closed', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_grid_payrolltransaction_all', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'L_grid_transaction_TransPEYROLL', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'menu_v9', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (2, '1_app_form_add_users', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '1_form_occupation', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '1_form_occupatiorate', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '1_form_office', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '1_form_teller', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '1_form_tellerlogin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '1_grid_occupatiorate', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '1_grid_useraccount_Cashier', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_blank_importar', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_control_PHPExcel', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_form_company', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_form_payrolllist', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_form_payrolllistpayment_NUEVO', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_form_payrolllistpayment_Status', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_form_useraccount_Owner', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_grid_company', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_grid_payrolllist', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_grid_payrolllistpayment', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_grid_payrolllistpayment_Invoice_Info', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_grid_payrolllist_Close', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_grid_payrolltransaction', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '2_grid_useraccount_Owner', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '3_form_check', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '3_form_payrollcash', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '3_form_payrolllistpayment', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '3_grid_check', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '3_grid_payrollcash', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '3_grid_payrolllistpayment', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '3_grid_payrolllistpayment_Pay_Pending', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '4_grid_payrolllistpayment_TimeSheet', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '4_grid_payrolllist_Invoice', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, '4_pdfreport_payrolllist', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'app_change_pswd', 'Y', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_form_add_users', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_form_edit_users', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_form_sec_apps', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_form_sec_groups', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_form_sec_groups_apps', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_grid_sec_apps', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_grid_sec_groups', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_grid_sec_users', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_grid_sec_users_groups', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_Login', 'Y', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_menu', 'Y', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_retrieve_pswd', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_search_sec_groups', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_settings', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'app_sync_apps', 'N', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (2, 'D_form_check_Returned_Status', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_form_payrolllistoffice', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_form_transaction_TransPEYROLL', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_form_transaction_TransPEYROLL_Copia', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_grid_payrolllist', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_grid_payrolllistoffice', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_grid_payrolllistpayment_All', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_grid_payrolllistpayment_Closed', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_grid_payrolllist_all', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_grid_payrolllist_Closed', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_grid_payrolltransaction_all', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'L_grid_transaction_TransPEYROLL', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'menu_v9', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sec_logged
-- ----------------------------
DROP TABLE IF EXISTS `sec_logged`;
CREATE TABLE `sec_logged`  (
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_login` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sc_session` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sec_logged
-- ----------------------------

-- ----------------------------
-- Table structure for sec_settings
-- ----------------------------
DROP TABLE IF EXISTS `sec_settings`;
CREATE TABLE `sec_settings`  (
  `set_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `set_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`set_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sec_settings
-- ----------------------------
INSERT INTO `sec_settings` VALUES ('brute_force', 'N');
INSERT INTO `sec_settings` VALUES ('brute_force_attempts', '10');
INSERT INTO `sec_settings` VALUES ('brute_force_time_block', '10');
INSERT INTO `sec_settings` VALUES ('cookie_expiration_time', '30');
INSERT INTO `sec_settings` VALUES ('enable_2fa', 'N');
INSERT INTO `sec_settings` VALUES ('enable_2fa_expiration_time', '300');
INSERT INTO `sec_settings` VALUES ('new_users', 'Y');
INSERT INTO `sec_settings` VALUES ('remember_me', 'N');
INSERT INTO `sec_settings` VALUES ('retrieve_password', 'Y');
INSERT INTO `sec_settings` VALUES ('session_expire', '');

-- ----------------------------
-- Table structure for sec_users
-- ----------------------------
DROP TABLE IF EXISTS `sec_users`;
CREATE TABLE `sec_users`  (
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pswd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activation_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_admin` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mfa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` longblob NULL,
  PRIMARY KEY (`login`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sec_users
-- ----------------------------
INSERT INTO `sec_users` VALUES ('admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'Jhon Aza', 'admin@admin.com', 'Y', NULL, 'Y', NULL, 0xFFD8FFE000104A46494600010101004800480000FFE2021C4943435F50524F46494C450001010000020C6C636D73021000006D6E74725247422058595A2007DC00010019000300290039616373704150504C0000000000000000000000000000000000000000000000000000F6D6000100000000D32D6C636D7300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A64657363000000FC0000005E637072740000015C0000000B777470740000016800000014626B70740000017C000000147258595A00000190000000146758595A000001A4000000146258595A000001B80000001472545243000001CC0000004067545243000001CC0000004062545243000001CC0000004064657363000000000000000363320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074657874000000004958000058595A20000000000000F6D6000100000000D32D58595A20000000000000031600000333000002A458595A200000000000006FA2000038F50000039058595A2000000000000062990000B785000018DA58595A2000000000000024A000000F840000B6CF63757276000000000000001A000000CB01C903630592086B0BF6103F15511B3421F1299032183B92460551775DED6B707A0589B19A7CAC69BF7DD3C3E930FFFFFFDB0084000506060709070A0B0B0A0D0E0D0E0D1312101012131D15161516151D2B1B201B1B201B2B262E2623262E264436303036444F423F424F5F55555F7872789C9CD2010506060709070A0B0B0A0D0E0D0E0D1312101012131D15161516151D2B1B201B1B201B2B262E2623262E264436303036444F423F424F5F55555F7872789C9CD2FFC200110802EE01F403012200021101031101FFC4001C0000010501010100000000000000000000020103040506000708FFDA0008010100000000D81B86666444645C4ABC5DDC9DDC8888822222802DA08342D360DB60DB6DB0C830DB2DB63EAAA6E1919A91B869C9C6BCA9DDDC88828822820220202D0B600D00340D32DB6CB2D2466FD595C2708C8D4CCD47B8957BBBB913905050101105B40168041B685A6C1B6DA65A16E3B4D7A9919B844464465DCAAA849DDDDC8888288082208082DB4820DB6D8034D36DB42CB00D37E9E644E111112992AAAAF7772F2770F2088A0A0200F0B6DB6800D8342DB4DB42D32D36CB5E9E644E111299112F12F72F77772720F088A2208882083608D000360DB6DB6DB6D34DB01E966466444444A4A5DCAAAA8A89C88A2283C22808D8888B6202DB6D236D8340DB4CB6DB3E92446666A444AA45CABDDDCBC9C889C2823C2280DA700802360DB6D8036DB6DB4DB6D35E8E4466AA4444A444A3CE77772770AA2708A20A0802200B622D8B6D88340D834DB6DB6D7A219A9A9112929289129777722A277220A22088887000B6822D8003600DB60C8B6CB5E86464464AA6A440E2AF1272A2A772270A20A20888A00800203680DB6200DB6D340D86F8C94CC88948B9497B97B9791511113911B54411040416C44005A046C1B006DA06DADF1138A4444A5C6AAAABDDDC9DC834388B68EEE8635D49E011404106D0041B0168441A06DA00DD9A99129172992AF29272F72744F1FF0023D0E964601BF4476FF693D5381005BE116901B016D9006C5A1DC19112912929A9772AF72F0B7E29E310B7FAB43D4E76B74193A9D74CF479EA22228D880360D800808B6D06D8C88D548948B94F9795146AFE63C2C9D7B9A8F41C9C6F407EAB0785A992DFBDED64F03620282000000002D006D94D48C94B8D5555795523E0FC769ABEBFD6763858DE855336C211796F9AC0664FAC7AE6B9D446D0044001B1000016F666A444A44AA4BC4BDC90FCDFE76F467267907A07A1B5E5B0AE21ECE2E53D0FCF7CCE1039A3F53F66BBE410406C011A40016DADA29912912A9AAF128AD679DFCEBACF422A2C445DEEA69BCDB16B1EC51ADFE5A95FA985A1D7FD11A454110006D1A16D05B6F6244464A4A4AAABCBCCE73E56A2D56AA75B663CF29B5BAAB7CA79FE7E3C971AB88AD36175E99EB9B750010046C011B006C3664A45C4A4A4A5DCBD55F3FF008B37A3B0B0D5DE3997C854448750DF43271A91C41A1F49F47F4BE6F84040041B100687627C44445C4A4ABCAD79FF00CDB55635F775BA4D7CFB4B5C679D636B9802456C5D6A45F7A7EF7D2DDE40000046D0001B6F62447C44AAA4BC5DD07E61F147B41BB76A7397177349CC7D71B16B0BA0C46604572D6F7D6FD8A41088800B622000D86C0D55488B89578F9325F21671AB1D1725A499D632ECED8A6E7B43098CB511E5718975A599EBFE8F2C4405B110106DB01D7A929A92A92AAAF2F8FF00CBF04639DB4ED5697537B77A7778A9AC1B81494BD83F31C9CBB999A7FA6A7080802003482DB63AE2222E5355555550F9FBC021C55D0EEB55B4D25C5A5ACD6C0603AC40A9698CA797794B91EDECBEADBC110140004006DA0D829171AAA92AAAAB5F3D78656C4D4FA8FAFE9274F9B3E49B42CC448D551CA166701E2D9F6CEFFEB4D1A00235CD8880360DEB48894894B8954B83E63F1DAD97ED9EB9B8B97E4CA9AE9B4C478AC31001AA9CD61FC5FCFC2559FD85A740146D000041B00D629A9A92AAAAAA9D57C798DACF47FA23D03413A5BEFCC740196DA851E2458D5994F3DF24F388D2EDBEBAD8F368802D8808B42DEAC94D495495578FAB3E23A16FDBFDEB69732A519C82121162031160C4AEC4F99796E12315D7D8BAA11111100110016B524A444A44A4BC48DFC8FE6C1F427B66D2C1E64148C9D169886CC78A10315E4FE639484379F636A1040438004441B6B5044446AA4AAA7CA9F3178C37F50FAC5E37534D01FB4B696E841CFE729464CE9F1BCABCE70E31359F635D700F008B60222D37A8522325522552E52F997C36CBEB7D0B3458BC0E5E46F375AF991333E7782CDC7B7D76A1B8F8AF3906FD33EAB986880202020220DE9C94B95C3E525234EF9E7E7FD17A0CBB29D3A1E4A0D6DAFAE69B37E7F432234261A84DC94F368E7EDFEF7364920008236228DB5A725552222E352258DE6DF385D66BDEAA29B2549573F411B212A9F47654D0AC2D67F338F83EA1E6F0FE9ADF4F9AFA0080A368080DE94954954889494959F1AF9EB6557F4079A677414093E9F516DF4C7CDFE36ADE8FCEAC264BB7CBD17A0F9E2FD2DAF9F6B2B8504101B4100D1992F12971A91710787792EFABFDFEB6A39EAE1B0C77D09E85E6BF13FA3DB4C6A9E8EA0B0BADF3FA99FEFDB1B4B5B23E4010101100D1197192A9729AA97623C22D2FFDDAE6165205C4C73CA7E86D3F9EFCB5EC074F9AA8856933C7361E5D52F7B4EC6E6E2DE4908B6080202DE90888949088B8D57A8BE66D0FB462FD275D319A8C9F997B36E2FF00CEBC2AABDAACE3B112079F62A4F914295EA7A8B4BBBEB07390100051A4D0992A9171F112F1742F9D1AF70D9682BEBE30B14FE913ACBCEFCEB31A5948DC582E44F3EF228F67BBBDB9BED25BC85401101E643484AA4486A4A4A5DCDE37CDBD33496B2063C7CFB3EA364B9CF20F37F4ED24B9210E9FCF7CFBC99EBBD15BDD5F6A2FE73A08203C2D0685CE25255222E255EEA4F39D56927BE9029F29ECD71362D7E4FC9DDD8CD723D7E77CDB198A3B99973737BA8D45B3C88803C001A0222555222E225E5581E29AFBFB19ECE52B3793AEE746A8C066EE98BD7E2D363B0591A991252D2D6F35DACB9985DC01C0097C465C4A4A4AA4ABCB03C4AC2D2C22642A7D6F7BF37B5EBD0EB3C4E0FD5195A5B88B4995ADF3C9EE56A58D95EEAB5BA1B17891BE106FAF9C5522E3552525EE567CB3036126A721A5F71BCF997C774F6993A7B3FAA5AF353B6A6A98B8BB6629A4CDB0BBD4EBB4D6B2CB80501B1D0129AA9AAA912AF2F0D578043BCC640F54DCE83C73E7DAEE6D2C7DB5DA6C3EC3A96AA345AC37654EB9D3EAB517939DE141001BE23225255525255EE0AFF15C4EDF06CD8E83658CF2BA4A533B8D3D6B4E6ADCCAD2D6A91392275C6874DA9D058C871050006F4DC55255255525E556EB7CB7C8B71A6A8ABC6F585440A069C986DEE2C353E699BA7614889F9B737DA3D1E8ADE639C28083786444AA44AAAAA5C4D56E27E7FB5F50D3EAA3F9A51534AC1C062D6EFD1B5782A1F37773CD2912BB3AEEF2F341A2B99EF1A080F5E11A9129172AAAAAAB55992F9F9AD9EFF6DA18B1B3587CB573527477EF798E3AB12A154889C9F757771777F776728FB9B50BC35222225555555E46EB323E358CDAED7D174706AF318CC5353E759EBF0DE7943369F8B8C95DB0BCB9B3B8BABBB69AEAF0885E9A91912F112AF2F737598EF36F2BD0FA1FA7EA5FA6C9799E0F4132CF5B07CD7008DC73525357ACEEAE6C6CEDAE6DEC5E25410BE2223555225E525546EB31BE6F95CF6E3D6B6BA3759CDE7231B6DE1FCA33B15E0694D54DFB4BCB7B0B0B2B7B8B192E2A08DE1191F29AA92AAF22B55B8EF34ACCAF7A8FADE9EE82153D7553596F3AF386ABB63948C44446FDB5DDBD84E9F656F6925F2056EF8888B9C3E52E52E5466BB23E63020E26D3D77757B22B9BAEAECBE43CE6B56DB418A8C444452ADAEADECE64B9D6B6935F3E10D0192A3A7CAABC6BDC8D57E53CCEB21E6B3369B7D54D8D61519ECCD057239AD918D88A44472AD6EEE6C66C89963653E51222E814D48C88B9578BB91B8197F37AB0C7557316B292E2AABA03071AD2E1CC9D7AA99392ED2E6EACE649913A7D84A7493B404444A444AAAA5C88DC0CEF9FD63F8EA58515CB188E3630425B57DCF6729F948DE9569737565324C9953E74990EF25E9B84A7C444A87DCA2D43A0C456CCCDE6AB6156CD90DC318C326DE7C697559525227A65A5C5CD9CC94F4999325CA3712FCC954CD794B889785A87498E83369682AEAA99B69B80AF48B1BA6566B58CAF5237E6D95BDC59CE94F3D2A54B7A4BBDA1522252522EE322E0661D3E5A34A834D475F511E255904993693A24C96359474B1CE44DB3B7B4B29F2DC7DF9525E7DD734A44A444A445CAA5C2CC4AACE9846A9A987002355B4DF499EDB76129223B1A1CDAECFCEB3B5B39B31E75C932DE7DD2D39B865CA4A4AA4AAA0D454815B5ECC0ABAD08AC8D747475C65D9F29199125F97E9503CA73136CE7CA7DE71E98F3CEB9A83322225543225556DFBD83439C8B0E340A98CDC46A243191C12A64A28F327CC99E976B13358ACDB331F749D9521E7CF526666AA45C45C7CF6A359031B9EA28D0A346AC88CC3891A3F109C894FBEDCCB09F6FE8B3409206571B4846AFBEF3EE6B5C714D4948B895CD06D2ECAAB0798A689123330A0370A0C616C78E44A98FA4D9F3753B62479C2E8F96C0E75B75E92EBBAE274CCCB8948AF37371285D858BC3D2C48915B8D061C68D162098B9226CD9452AC667A25CC7724386A69173DE7D956A43FDB3371D32252593B3DBBE68C495CFF9851438911B8F5D12BD988C71A1CA9D652E5BB3B43BF065E7DD2233E089458BC6447B62E3864E29397FB8D2F2B82C84C8B87C057C2AF699810A0B1118E457EC27DBD84A76CFD06740E7DD7488CCF85B8D4B83C7EA49C3332B1DB696D9C077906333675BE7392AE815E11EBA144891B9D932ADEE6D25C99BB6B48208E3CE91191F10834C577979B8E1C8D5EC6CE6BE2A6A3CD430B1AEC16320D5C16EB6B22426E5D8CB9D736B63267EC2C21349C6E191191AF2A036D78A3AE397FBFB99520CD0D4B8423B116C63663134F530EBEB21467EC6D8AC6D6C2768348F5636EB626E92991AA97208B7E18E4DF41D74B7DD352E7395791A658ABB148D9EC8E7E1C68B1DF9921D9F617DA2B01A5966DB5CE199F12911770A37E1573EA17725C75489578979541A699A74B156EBE92A6BE183D2EC6D2CDF2AB6AD1B06D78C8CCB9489794007CBBD42C9E71C352E2E2EE153569A6D88D57D2DE699683B957A0C7EB33044454233255252244046A44C788C8D55497B90451785A6DA6C61C065A6C00400ECA52AA910F7729292F2F29A700B568FB8AA5C6AAAAA9C02008802D8736DB0CB682A808AA4E938BC9DCAA84428A86D9F464BD332425E25554541040116C45B144064010784539C375C544545E5136C10DBE78A9A6DE9917712AF2A2F7727080036DA37C9CDB42828A89CAF387C9DC3DCA2AC73671DD7FB393750A7C444A9CA485C8BC0222D3689DC08D8A20A20F19B868A8829DC88C888C47E4965CF6E8BC47C3C84E1912AF2088000272208088A270F139C648A29C83C2DB7CD4590F3792B2DB45570C0844DC71E352EE44106C03BB8450501393855C255514EE11406DBE8ECBCE47C9DCED63352398178CDE74CCB8B84511B0054E440E14141EEE53554E4441E6D1B6D234775D8597D15ADC4190D4329721E375C70B9454500005179110051103B908957B93845051B016A309C2CBE9E87D222746096E4990E9BC7CA8888002229CA9C228DF20F72129777220F0083602DD7BC30F2DB5CEEAE7B115D9CE4C337CD179444790413915384444453B8548979104505B4641A6EB8CA1E737B1B23E8D11A7DE992DC2335EE2541014404EE4E8D53595AC95A5CCD5E25EEEE0140006DA8CD51C89D068B750F09E942452A63AF11A9F11A20208A0A8D3D155C1904D5556D5205C7ACDA1728A0080B60D37199A1936106A35CDE5D75EF38F4B90F38AAA6F22208A8A0B510A41A08A020246CF515BEA64F0A000B6D034315280AC61D2B9A2A6C4FAC5873EFCC75C7155C7138513BA29972220A887020F2244F36DDDD888B40D832DB2C47AF8F61128BC27E9F838AD66E2374D9EFBE6AAE9708A1F535A120A207228C508D9A667D95A43F04F68D008836DB6D311D88D551ADE1F9FF00917D09A5CA41F6182B3AC1C90AE38E2A320F964AA376E8F2222733E77E3FE97E2B6B9568EDB46FFA66EA4836DB4DB51D98B169AAB46C783C7DB7B262F25EEDCDD84D71F70DE702274C769FCB2C7D45C101EE16BCE3C1AB374EE6F342A02E4BF5BF637C19699698661D751D26B99F07BF85EF79DC4FA8EBA15C49789D393D11B9CFAE77CA743EA22A803C347F37D046B7A5655244661B2B4F56F41D2B2D351E3C6855B9DCDEE7BC67D07FFFC400190101010101010100000000000000000000000102030405FFDA0008010210000000EA1284A8A02C520001289405080012928058B72000000510000000288000000A08001C3CBADF6EC0055C8013CBE7E7CB4F57ABB016520039F9262C73BEDDF5A15160070E5CF5BE33D0CCE9BDEC150031E3BAE35BECA37D014803CF7CF271CE6E75D7D5BC7AA82C00F274C78FCFAEB339C4EDF4B3D7A8A200F2EFE64DF4D673CF9CCFD5EDBD8A200E3C3C1D35D3533CF9673F53D176148039F93CFA4A9273BF43D1740A8039F0E59E99F363BFA77E7CFA3B7501600E17E6F7F4F9FAEF9EB5E7EBE8CF50000F2F3F25DDAB313B76DFA005203C9C5B7039F4D65E9D7A7790A9503C5C71BC79FD37867AE5F427AAD82A00F3F978E73D673DF35F47A6FA6D85962C079BC1AE7D7D6D7CDE9CFD7D3BEB562C0013E5F2B7D3DB3CB9F3F777ABA40005F1FCCDF7EBACF8E7B3D3D4D520005E7F3386AFA38F1F67A7B59756C8000CF93C3AE9384FA7BE956EAC957200C792F8E4E9EAEDE6F655D5A92A5805E7F3FD1AE79E973C3DDB356C0801797CAEFDE5D67867D3E85D5A45C805F3FCBDF6BA633CEF7F476D5A220071F9B8D6D3733862FD7DEB4420133E3F24BAAB33999E9F5575AD2204CC73F9F95AB99997DBEB85BBD243398AF2F925B359CCBDFDF60357499C8D279BCB911AF4FA75003AE7302D49C38F39D3AF6D800D6402882A160128001482A000000A1002280014800250001440025A80016580026A0B0067308E9A0096E6D20665D03CBCBDE05C6774A81AC2B1C6AF9BA7B2525CD59A20F4BCA4E14D4C75E94973BFFFC400190101010101010100000000000000000000000102030405FFDA0008010310000000E7515152A00819B2EE50254B2C04B08174001058B21624B740012C582596213A00045960084B360012A580112B4001D7D331C79A00834005F47A356B87979010B9D8037E9D6E4BB9E5E7CF344528075EBD339EB39CAC639C0234035E9D63A2E79C8931CD443403BBB5DF5E9B6B3C7C7CAF0825280F4E7A7BBBE78B77A5E3F2EF1C095403B5FA5738C6B7BE935F2F8F3C8134037EAF6E5C796FA76BBBF2F87380280D7BBBCBB92D6E7CDE38C895402FB3B3976EF79F933DFAF97CDCE02CA03D7CFEC78FC5ECE7CB79E5EDC79671A0280F7DF66F19E7275EAF2F0E7E685CEA4D00FA1D6E27A64E9C6EE78AF8B140A03E9F6F4635D7CAEEE7BCFCBEDF3B2A19D82CF57BBD5BE9E66F3AB7C5E3D7872A0A01ECF7EB2F0B1F5396BC3AF263050A2C17EA766F8F975AD5F0F28CE6D0A2C0F5FD29E8EB9C63878B8738C25A4D0B037F4BADD71E9AF070E517122D50584E9E9F6574D71F9EE325C64D1341513AFB397B3B4E3E3E7EBF1664CC2AA94963A7D3F1E3A6B9E3A7A7C1CD301A282C3AFD9F3795317D5D3C7E639D92DB36204F4FD89E4CE26BD1BE7C7C7CA652ADD2541DBE8FA3A72E6C5DEF371F1F191537602FB7D9BE99C5CCD6E38FC9339CDB695355D3E95DB3BC4D6B33C3E4A33896DB3543D5EBDEB3617972F04A2B3856EA09EAF674A4C73F3F9650A39DD5A904DFA3B7573E1C39A82ACCEAC22C011400A96CB958B2C00002D8200000014200000058A40000002C000000000016A55C009458016C80D6B9822EA5C80CE3B135AB1AC6608BA900B3E577F796E6C9AD309063FFC40026100002020201030501010101000000000001020003041105101240131420305006151660FFDA00080101000102019AF175E06BE07A9F918468CD11A235F5EB5F8666BA6BE066B461FD8D74D6A19AFCC3D35F4E8887E1AFD8D43D3447E56A1FB35D35FA3AD7423E47A9FD33F1D1F919A3F1D7EA9F8EBF4CFF00E2B5FAA7E1A9AD6BCCC8CE3CBA64BF30BCE579DEB96F28F9765BC8738650897DB55F8B8F663DB7E4E3737564EFC5D6BC966E43FA1BF36BBF1ACF41AAA2F38D7F0E125B525E99D57F414E4FDFAF37232795E592562BC40B8F9A87330312EDB294CCA9DE0CCC7CEC2E5C5BF92ED9BCA5BC815C9C745E3EDB71B271B17916766C42EEF93BE4F03BD9FD656C0E66ACD57FC636F2BCABB558871AEAAA18D754D7A6563E367DF6D5CA2E7FBB1978D9BCA605A84EFD4C3CEC6E771B33F119B94E419E94C4B2DABDCE7D7899B514B72307238FDB3A641BBD5AF22AE42F55A8E0B525685C5AF1AD1F8561C8BB3F2BD7C5BACB1329A59C6E4E0A5B4F31572E390C836E33203DDDE19320D9B3D31E61CC27FC2B9B96CE775B2A43914B23D61EBB38CBB8F38FEBBE41B3D4DE84D40409AC6893088FC13394BF2327BBD90AC64DAB819AB50CCAB902D958F9745951AFB7B3B7B3B75DBD15A875CCC5087F02C6E772B7DF4E52657B5B78D38B527ABEFBDED996F0D1ED571CE1FB4F6A69F48D4C902A224E3B9043E7EB90B392BB4A159331B293925E53DDD73D0F6F571EB83FE7FF009E704615981ECAFC3F68F876536A2321AED0FC7E62379FCD5F733C276B5AA2D7563D7815E0AE2D584B8DEDFD16A9A95ADABF4EFA463BD1958D9548112DDF1D91579EC79C72B0C0B4D54E1D5C6558298AB8E942D5D857B0A940A430B156B74BEBCBA6C5D4A9F1CE2379C67332F2F358F461E1518831D69158454ECED2BDA57B74CAE3B3B2C162E4A66277EC362B609F38CFE858CB4D15E061D18F557D813B0204EDD76E8A95ED2A53B5838B4654CD5301941C11E764D99D6BBCE368C4A6BAD5400BDA001AE9AD329054A90638B66536647E80D138A3E7644CDACC51C5578EB5A8004DEF7DDF062492C4C31E641C96CA2D0C5944E3479CC39FAA5738A4A15009B2FDFEA7A82CF57D4EFF0054DA6C2E6CEF25E654B8E4CD102631C1FB8F85FD48694CE36BA67AAD90F9EFCA7FB4BCAD7982FF005BD53735F7E7B731FEFB730BCAAF2032EEB2F994A618671898C9F41F1FFAC5B2602E32166B2CBAF0F896D74E463E6D398977A8F7DD979D976643D8B6ADD8D91EE1726F6BC3F41381AD483E18FAFF00AA5B1688BFD22F24A9ED071EF43E6B671C8A32B16C2B7D990E0F73661CD3647B0652E4D92D8209FCED60A9FB0F824F39550BCD9E36AB9C3DDC9DB982F57EEA9F22868D6ACA51EC3613564A64C0CE9915D48312FA94715482A41F319797C8B5F130F82AEFA326C1C6AE07F84BC3E471E9857D3FCBF01FF3DFD3FF003B5CB2BAF1AEC37A68C674A891C84A17FD0B6EAE60D80A953E619FD052947F39326AB308E0D92BC9F52CCA44F4B9E9C46299CAD383453476A35957B5BA84C638DC90AAAC81A4982CACA548F3796A6E1C2CFE928C4BBD2B311F891C2D5C7FB74AE8890CCD3D871FDBDB80FC6360FF0098B85E9F615CB82118451959194F999A332CE242D582B4FF00455F23EB1BACCFBB9ECFE5789E31234CC9C961719CF516761AFD234B51CAE6F1F8364CB881C6315757AD948F32D1CD62F06D8CD43EDB01B853C28E32C6C4AD600E72834EC5E1FF00C3FF0028F1678A6E06AE1F2A5AD92CB35532BA356D5B03E5B4B28C3C6A22456EED924DCD8CD4A4B0B8E7931F2B1C8B85FEB1B0BDA725F21DE08A159191AB6AD948F2CCB27763953BEE2CD65973B6163ED4B96394BC971D8D6A30E863B5F664DD98FA595C564646ADAA6AC83E5DA9912A6160B03D8F765552BC6B33AABFD436D96E6667BB388AE967A8ECEF9163CCE6AD1BA295657ADA96AD948F2EC3C90AED5BC5F917FBC391855D6DCC721C6FF40DCB0E532794C9E5AAE43D4BE2648B9EF7BADB658CA555DD4A956ADAA6A9908F2D87238D458B67A8ED9193C7514289FD253BC6E47FD4C9CB06B38965AF92F8F9C6C7626C74545BAE8229528693532153E5196AF209491336EC4C7C4B29C92FCC0B13A1865230B30E7599168C7779EA643D6F65DD04114D72A353565483E498F39D14355393A92F4945DEE739CADB5CD6AA14396F589E39320CB9BE222C4359ACD454A9F24C79CC2D2D8EEF8B571D93C532A727EFD6DB6CEC0BB5B3DC5694F15ECEAAF2DF6DF35892B959A8A1523C931E66229A6CC4BD2542EC4BF857E09B81FF009CBB8EFF003BDA251561E2618971CACA2E637C84595C4886B28548F24C797CCA01B1ECA9A86D92E2E5B94A4F4D12A7ADB2B22FC8C8B523BFC845891624435952A7E5BF04C7991392447ADB16DA4896067BB22CCABB21192D1654AB322CB6ED9663F21162458B10A142A479063CC89902D5A2CC76A8D7192CAAFC5CDC718D4D271528A68CB7CB6B0AC76D7C845891608B14A1523C832C9912F965359C5BF19AA8A3B1AAC8C4F61ED9AA5AED964CC7D135D4C3E422448B0458B10A10478E63CC897CAE5F5D3671D9755B5B872ECC7A3463956E664DADDD2B4B3E6B122458B04116290478E63CC899128970328BB1B3A8C9F71EE0E59B8E4597E4E5D995956D71DF1EA967CD62448B160822C52A478E63CBE648C7974BA095DF4E62E77BE6C9F73665D9976E47AA4008142CBBE6B122458B0410458A41DEF7E198D2F9923145E962FA66A5B7D5AEC5B519ED6B4B2A76B4A5224C8F9AC4891208208208A4107EDDCDFC4C6968C818C2D5B5193642CD30EDEC84A925140256650F88822448B04104104580823C531A5B2F18E1C588EA5594F4EE2CCEAEC772953D00CB5F88822C489160820820808301F0CC6964BC50183AD88CAD197B5658D04D88A811A000589655F01162C48B16083A08209B041DF84634B25B280432BAB2B56EA6B6428C8102FA69599A51DA4357663357D04589162C1041D4404180F86618F2C55AC821C3291E97A6D5BD3E99AC56ABA334A34476F6351ECC71B7715D8B162C5820EA2083A09BDF807A19EDCD0D08D306420823454A11AD740AA26B41427A75AA556F1B99C5F6AC582083A880F41E118B4A633CB234234C195868822374D4D68000023402A8544A97B6CA6EE36DE1DF156083A8826F60EFEF54A30C5372B4B61841E8632F6E98688D6B5A000004D76AAAA85A51174C3B7B1F1AEE2EEC0D7410110751F6814E1D58C8087168B218618610C35A6066BE02080682E9400AB875AAF4035AED6AAFE3AEE3D97A8E9B9B07E9A716AC455884CB065A590C2083D1A18618D0FC4411400076A001571EAD74035AD6BB5AABB07238D6AE6F7F5A578D84A907C08B92E52083D4C6863430CD74D401400076050B8B4856EA3E3AD69ABB312FE36CA66FE5B82538B4E381F033685D7368604107A18418DD0FC40508AA813B425755557C07D1AD14B717238C6A3E75514E2A560183E26068E9978CCA6303D0C60610DD40ED544AD6B5408152BA68D39D7DBA2A68F8AAD184952A8E87E4445731D3270D9595934D1A1861E81457D895AA2A840B5D3551AB1D57A0F0E8C4A71C00A3E9308216C308BF0EDC76AD90A35650D7E98A96A15F6256A8AA16AC454965AA9E25698D82AA00FB0C219761A3259856E11ACA1A8D3E88AC2768AC22575E2D7546636AA43E1E3E3518C00F04C6AD6FEE9A7A9F09B01B07D9FB418830970D31809B6CA154DFC87DB8B8555407D9BDEE1F8329ABD65BA11F325B27D61401BF98FAF736883EDDCDEFBB7BDEFAB54699EB7BAF77EF3DDFAFA18CA937BF10983E5BF96F7D77BDCDF4DF43D75E3EC19B3163B6FE3B9BF96FC2D4DF5DFDE60848E82336F7BEBBEBBE9B9BFB4F5D6B5D35E01F86C12629679BDEFE1B9BDEF737F8C6084ED7A13531266F7BDCDF7F76F737F96C60E8E696866F737BF90FA77F5EB5E212483D2D38C62969B0764EF7AD083C7DF886102032E989D316E6EA5B70183AEBF2CF5DDD310A8A1C1680B11D57EDD7D5BF10C336483B32E38514672625AD0468B04D0FA77E36FED3364AB771371C1892F5E3AE620C062C1E335AD9EDCB8E77FDF1CF27283237F6EF70962ACA4CB4E1404B6494707A2C137BE9BDC1F65998D986BFF2070A3816E09B806FE7DB835C2F754FF45464FC37D3737BDEF64B1101969C39BF532ABE332411D041019BEA3EAD92D58AB5F4B25BC6FF009CB9B5DBF13D37BDEC9D9E82036CC26C9CD12D81EB78082A41066F7D37F3EF026FE1BFA5ABBA6266F4DEE6F7B24925896241536CC33C8E4D42C6CBAF8EBE12AC877BEBBDEE6F7D36F78FA770D82C6C96E657995E5132FBAFA660E674DEF64ECC249624B1565379BF25178ABEE362F1F6ACB2294826C1DF5DEFBB7D32B283D7D3737F066CEE52DE51B91B32AEA364835E757CF5F9B80E974DEF7092766124BB1B2B6B8F2162AF1F6D86C36598EF6058937019B9B24B0804CBB09AA2CDCDEF7B9BE533ADB0C162E2E76709BEAA6BBB0796479B266C9D92C58BBBB54D71BC554FA98CF7CC99C45CF0443D41104D9220E9BCB698BF4E65B977B42D8B85A9BD7A5DB01DD633B230323A1E861863163692F51C88C2A1FFC400461000010302020607050407060701000000010002110321123104102241516120303240507181051323429152A1B1C1144353627282E13354609293D106243444557390F0FFDA0008010100033F01FF001E9FFE4950A5DA7808547431551729AC3B4B4598718545E365C0A9ABCBC5D8C124847B1447AAAAF74BC38CA60F947F993DB6DDE68D56F6427D329E1F872506E73FB969344E7215370DA042A55059C3C4834494412DA31E6B4CAA4E224A2D374F319109AE1C1606CCCFDCA8B8C17603FF00EE09AF66721537766C555A661ED4D2C8329A048FAA6B4ED48FDE0AB35B2D7072687455616F354AAB65A41F0E652692554ACE2D0E2070430A04F34E890DC7C46F41AE8198F977844101C047DA4D8BEF54DFD8D8767C8AA945F86AB803C72445F8A6BD906EB0883709ED3B2552759C30BB927B2ED74AC4D822FCD54D1EACB7E9B952ACD17BA69F0A80A951658CBB705A454C537E4A95501D86E2CE8CD7B9823B277A833F82F964154AA8DA6CF34E6DD8EF39DE852760A9D9FC16CDB2DDC151ADF0DF63BBFA27D33EEDF046E2B03AE364EF4690DBBB38F0F34D737739A5166D37E888DFE889477A2D762695102AE5C536D0E0420478384DA6CC2DBB8A754ACE249B280D745866B055269E71309BA4D07B3B27F34E63B0930E4D802A08E0E09DFD5A9C649123884DDCE3E442A9A36CFBCC6CFB27F254EBB7130FA1CC270D8AA4F276F45CD20BA6DE7298586F6DFF00D53A83A587666ECE1E4A956A65A6EDE1C3C961783683939398E870D7C51A2F901549C87D532AB7313E0A49E4852A676AFB82AAF7127329B5681B4546E63880A5984EEB422FA430F6DB9730B73DB7FA2C4EC6D3FEE998B05445B763A42C76913F428BDA5576891B411A6EC8B4AC4139B646CF0B1724FA6FC4DCD36AD321F769CC70E69CC300E2694D7647D1548F97EAA1109A73585E1CC247355700C5E070D4DA7489E48D4AD89388833C8A70C37123B2EFC8A34DD89A364E7C95B183619A654A7B6279F04C3D9A89ED370B49A59130B754A72A97CA5E3EF549C24B1AEE625A568553E6703FBC133E572704421B95A110642B4184654AF25CD1C4A0FEEEF536DC3C0C0B94E7EFB29330A335BDA5566083708021CCBEE7377C27D17F2DDC1C151A877B4F053B3EFC8F4533F181F32AF121DE410666C2134645EDE60AA872A93E69DBF5348E8839AE68EABA70B91EA9BEF2DE06DA74C9283DD385309CACB109619FC554A653621E1345DA7E856C9A75487B37710B0C96C386E20E5E6AAB44901C3EAB4736C17E4132A0B3C8F45A2E18F7927862CD3316C8B6E909C8EA28EA28A3A88D4D0E050881BD0CC0BAB780C094F71E5B938A84EB4CDB7A638454877E2A9D4EC381E4539A6C1381CBEE4F27B441E37BA34DD0FCF8EFFB91CCB9C27296A6C5EAB4FF0024A6116781E54C0FC53DC7B44FAA74A30AEB672D7CBA3C94E413C6E4090D758A9F01C34D17D52A1BA98168EC1699E6C07F35A3EEC65566765C6381BA79CDBF454DC727054CFCCF8E10A89BE03F54D3B9373C087D9081400C9454C95B2D4382BE4B6B5E13A88C8ADC5371A79119A0EF00DDC94BE374A9772E8DF245DF28FA2E4804382128421AEEADAA10D4235DD11ACB6A8423BFC050E5064AB6A94EDC9CE57402010410E95B5DB5E6ACA1C842842EA2A847DD89F000DD225D94225E558292A564840B6A1DCA1DAEEB6C79A9A2DF2F00C55E256E57588AB051DD73E86D0F35149B1C3BF965324668BEA389CE5464A5CA5CA00EAEFD55B55F5DD7FCBB7BFF00C3288AEFF3565742DD31D766A755F5FC46F9AF82DEFF00210669479EADA5B23A03A1CFA9086BB2B9D5275FC4695F0C78001558ACA5E1431BAB728509837AA2333098EC8A0EE9060406F4D26FE88261CCC29FF75CD35CD57D57D78B4860E6B0B07807C5A4791592C55DA39A860509B0AA4180E3E8B4C7B6D49FF45ED2FD8D4FA2D2DA76A93DBE853D8540CD4EFD451D58AC9C8A704E84E1BE2C8919A7031740DD6CABAB6A9D241E1E025DEEF92B85FA1D50EA824E70AABBB349A3EF5ED1AF760B71C82D35D77E9447F0844E7A4573EB0A86F7D6FF0051686C9F8957FD5584EC6915FF00CE0AAE732CA9FC6C1F92A5BE896FF0190A8CD9E3F02A93C6CB81F546152060BDA09E6A903B55E9B479CFE0B417642BD6FE11842D1DBFF6B447FECAB298326E843F949FC94EFD17FD3FE88BB768E7D21387EAA9FA391DEC70FBD0E2533ED205B62B6B5F69DE01741D4650FD2D8DE6B47C6ECF1FDC9B5B49A6CDC4DD06D864A37AC366AAEF1388A976D4C724E29EC2838205A5C2C42DA053F0F6DDF552F40ED1BF05233B2E0B7954DA27DD831C568EE6DC5F9222EC33C94F9A6BB308B5D19CE4AA1CA531F406366D4668537C2DA5EEE88F0094EA6403927B6BE26D8A77B48D42F30E8B108B3DA8D63AC4120AA7324A2F381802AAFBA381CC3C169553B316E6ABB2CE6C2AA6C18B48A6FEC985145E7F7552D33156AE269B4C35BC57B2837FE9A9FD150D1D9EFE837080769BE7BD7C209E72129E4DDA534E8FB398DCAA36D85389164E63AC1171E6885018AABBB32994E906992E46A5495B4A690F013843B9AC4DC456173D0A1FF1130FCB50B5DF5B14C76E54999357BBF9480A94412B4600AA3935BB9567EE8F34E22335EE7456D36F6AA184346D128D21F2B6FE7BD6CA15746A8C3939A422E760DE0907D1169C945F0AA445D03942139AA410253DA792DB637920CA61BC16D9D50BE18F01C740AC2D03805150A3EE68692DCE9BE0F914DD2347A75064E6A94C76625523C953DEA9D3C9BA84A1ED1F6E6217A3A28B7372BAF86B60A6D0F6C5ECCAD71E69A9B098FDDEAAB0ECD42B4BFB4AB1CDCB00B6AF7FED177D967E5AA2A1D575F0C780CD32B056730AB93CD32BD07D3A825AF1057B4FD972CF72748A1362CED0F45ECD367BCD23C2A34B57B3EA76749A47F982D1FF0068DFAAA03E76FD5684CCEBD31FCC17B2DBFAF6B8F06ED7E0B4DD27E168D41EC0FB6375A7C953D07441485DD9BCF13ABE1AD928695A23A2CF65D9FEC8060A5A54B5C2C1E723E6A9D46CB5CD3E47A2150D1A838070F786CD0334FA34313C43DF7F21ABE26AB850C1E03211C5EF06ECD487856D4D70BC1F35ECE7F6B47A27F902F647F74A3F45EC7FEE947E8BD98DCB45A3FE40A9521B0C68F2108BEB7BD7E63256D5F0D172F766E5369D6260163B306E17B32A8914B09E2C25BF8268EC697A4B7F9E7F15A66EF68D5F5685ED2FFC81FF0027F55A79CFDA353D1A162FED34CD21DEA02D0347762653977DA75CAB2B152FD576A81E041D881428E93500C88E971D437AA951D0D088689CF51C30A427318DA8371828974391451D4105659A86152ED571E060390FD2FD3A70139C5368D10379CFA0131ED21C2426518A8CEC94400A7A2405257C30842BF82073561D29A79F41BC50033D46A3B926614D645EC9AF1651AB34180A1A468980E64C7DE831AB09410435C95B40232AF650DF0380B6F105B2D3CB50470D9D75504C94E7BE14346A7D0D2DEC68185063A1D6053610E298184A63DDBCADB640200702839A0A0A2C4EAE6B9A9D58AA93AB7957F039088B8C96C969DDAC82AF1BD3DC6538050111A5E2E2353E98C26ED5FBAAAD53736E1AAEA7476F92908B4A910ADAF0B0A9BEADC3C1410BDD693C9C14AB22D1659B9C10A60494D77D503039A0FC273E95D450C24E4A076B9426BB319AC2E969BAC6C9D4251854C354D8783FF66EE04ABA042220A70A61B923F6A677045B309C4183CD1C361935123CD11D0845A2DBE518519A2E13F444875B7A895753E13340F25BD14DAA1341361215637658AD36866D9086F90A9385D520E33E8A9B810989813153400CA557AC60582C2C9213459368E8F1BD5D100F8563A6E1C9612470443AE56E43120531DB95324DB7AA4772A53DA2148D8D21B97CCAB31D1B2AA6F29A0A1C103B93698E69A5BC97C60B9A2F715657F09B2F77A49E056D85054EB09853567051E3A82128351715819014BEC54957503C2F6654C212B8EAB22884609530211C5851411588AC0C9588950A4A80A4F85CCAC0FE4B6C2DAF34206A1A89DCAA33209FEF118C8A7074F144A853B214052EF0FC6D2AC78842CA48E8872A6D26C9BC137820B0B56655D594273AEAFE19329CC38828B8532ADA821AF35080D585073B56272862DAF0CCD4A2C2781585C2E9B873595D7342109375280B4A69B280A5173D5D6E5BD596D1F0CB9D41C141446F4E000E088BCA04668136501438EF4EC28B9A512A510B1395B56DF866DEA840A108B559020DD3838C146D2E5273C970568D407476FC336CF40ABACE5362CA0A2458A80B655D1946149E86D7865CEBBA19A2892A05D045B0A55A1044A28742DE1973D0002684651E088528A8D5653080E84B511E179F442C91CD59156D72A3A53A9C3C225611D20A102AFAC7540A69DCA9B95566574E6E63C0DC73507BCC3820E6AA4E1927D374B45938663BFBDC8344F5F7EB2EADA8154DFB9476555A798EF6E764B8A685B3DD6FAAFD0978E935DB930E4154665751DD89C9139A0D435C1EF579EA014C76E551B92233EE6E7A6B421AB6B5EFEF58583AA0531DB916F653DB98EBDCEC97141A3A17D5214B485063AD1D5973A7AD0534EE437593D998EACA2734028E9CEA9123BB973A10688EE0D72FB2AA83187A873935BD5420429506465D49EB24C041835498EE2D272E91392DE501D6613CB50288BB7B9B9C6C9AC1AB70CD40EECF7E7609AD1D74A2C3072D6D7659A7373E89EAFED2005B56E6E6A3CFBAB9E6020DB9407700427533C426B85B5029A72B2A83723D513904EDE9ADD400BA7D4B372E28347757543C93298EE9065A616E75BA0C39854CF25C0A7F255782ABF6554E09FC97129837203500A6CC129CE32F3E880EEAE7904E483040EEC0A23B2613DBDA6A63B7F5402A637CAAAEECB63CD4F6DD280CBBB803BD30E6111D9710AB8DE0AAC3E44EFD995FB8E5FB8E4FFD995A41C98B49766E03C90F99C4A6B721E343FC356565B5E3D65350ABF8EECADA778F6C95DAF3F1ED82B3D523C60F43615B5488EB8F855BA1B0B65593A9D683E4A4748F88DBA1B0B65591043963A63B89F06B2B9D7B256CAB2C4C2160AAEA67BEB1B9B805A337E7FA5D6883E6FB968878AD139AD08EF23D1688EC9FF72A4EC9E3B9D95CEBB2B7AEBC1559539DD62603DE6934C4C9E01690E3B14E3CEEB4EA932E3F82AA4F690DEF2550E2552391210BED94EDC557192F683066569F44C907E909E3B74C9F254AB30398E04771CD5F5597E3AAD758986162A784E6DB7782ECCA60DDD5B4EE541DF2A7D1762A4E83F71F355066DFE21BC7F44D7B641EBEE55F5595CF9A6D3A904EE4085C51A3A54EE729D63B8CE5F551DC41BAAFA156C54EF49D9B781E4A8D76CB0DF78DE3B8D94633CCA3534A7906D920E602D29CDCD073490B1D31F7F736CF256EADA37A6954C0995A20FD637EAB4527FB467D56867F5ACFAAA2EC8CF92099569B9872215466905B8B0D661B3B73BCD7BFA77185EDB38770D95EEB46A9C654858A984466B82C15DCCE370ADAF9F5D7C0DF53AB61BE5D4868925369B6E6383779FF0065A549C2EC0DE0D5A2E8D44371B8BE2FCCA79AB89A60EEBAAAED18690605E0F3E6AD6D75E9C61AAF1EAB4C61B90EF30A8696F0E334DF19E611735AF05A6DB5877A07ABB2BADA463512FC1CD085EEB482D3BD4B541582AB5FC0AC4C07B839B48C228AB0EA431B9F90E7CD39EF92649DE82D0F48A2C155D81EDB621BC2F66D3189D5CBF9009D59D02CC6E4357A6A3AAE9F4DD2D7107885EF362B0B9C9FBD6C892263ABBADB0AC16C953A43FCD4B510F6BB9A2FA415D59175013AEDD6FC27F922B1556F53869C7DAB2F7954BBD00E4BF152AA572FC2E03089BA2821CD0285AFB91014EB9FC955FD0B46ACD710F552A68F4DCF8970DDD498451F781180B614E90EF35B2BFFC40028100100020104020203000203010000000001001121103141516171208191A1B1C1D130E1F1F0FFDA0008010100013F10A8784081018102040810254A950812A532A54A952B456892A54A89A5449572A3195134244892B42622411224A8844EE0D0D9047416996B484A840950840950254342B5B61F0A952A56952A531892A24A951224489A2448912244CCA8C11C2244CC61224A8841A1B3B418825708102040812A04AD02042674A952A54A952A54AD6A26952A24A951D1256A92A313112544891226624489BC462444489A2B10818C510204204340812A0421F0A952A04AF856952B5A892A71133AB2A54A952A2412B42448C654488C46247415BC1125448F940854A95020421034099812A57CAA56B52B5A8CA8CA951AD523195189989A562244224489134489123090448E81204095084A9502040952B4AD03E15A54A952BE152A24A892A24A952889A546134511988912246244891342448C244891A810204210254A81034A81A07C0224AF854A95F0AF824A952A312246531226A24ABD0A8918C752448254495021084A840D087C0952A57FC35198D2B4495AD4A8CA8CA951891224A8231224652022448912241394112040950D15332A1A103434B22C2069C4A95F0A952A54A892A56AE892A2448C48E8C48C495118E23125446089122448E83E552A54084A9B4CBB40950232BE152A54AD2A318EAC4892A3A545D189AD44892B45448ED18C4891224A890D084A950257C034AB604AD2B5AF832B5AD195A3A546246568912244D1D534495122448C62448E88D6A1A10D6BE26B52BE15A54AD6C971DB5535A89135654489A3A266371189A72D12246123662A309021081A5684210D02540FF82A56AA1006E3ABCCBE027704A2C94615F773202DB298FD4BB7A063481A81C170312A31BF8A4489288C48C4951232A244CC631D2D2BD4212B434AD6B421AD43E6DDCA8FC60ED975B4BF5FA8D6E57310DB7E91EB03C0A33601ECA9504C70EE12846CF0ECFA8D5DC63ED0CA74EE03B837E496867DC4BCE85D689A31D6A24495108CA08D458B1891D0495E343E15095095FF0005695F06A801CB0C55565F36F809B3DDB383F106510FE4C81EF17FC85BEE5C3C7A8A880E9D9023782EE9FBB128287DDC23F66DF70BA68E4FFD968D4957DF99B7D0185230C75C38F64ADD8E366550A6D047ABACFD42071D91976EA9A5448C63163122311D1512544239227895021084256B52A12B4212BE4A77128D8BA85F4F0C0C49B4BFE18A115C2A9CC51AA7771F48FB06E644904B60765F270F8964707391F4C46D3451FF00E3307326CB77DECDCC63B6E2FF009531003B773381DFC917D85ED7CF8638B8B9DAFD44C2CFBA65010119B00EF6CA5940E64AAA6089718C6546E32A244892A244891223125448EFA10840D021F1087C025699A89685C03CF99426A734C14454EF830A3B292BA928AA6CFD44E466EF91DFD470133B4A6A08470C723D2441B2D50148E2F865B56DB3CBFF0027704C02C1E4AFA9FB67F3EDBD75115CB06D5F8A798F55984B517D3D2772F054C572DBA731AAE9B390EC96D6D39ED5D90B80AF952E01FA61802A408B1DF1BC72A1D95DCF64B76DEC8DCB90C63311254756318C654632A26A6843521F2AF82C118C9DF11431800712F40C93802358F6AD9B1FF52E6141672307F9CB0DC07F896704A3D59C32EC5F1317D7880F4564FE9040AEC62FC9C472EEBC9FACC47D89A07B3B31B5BD9BB278624A958E07BEC82A17D07B2030342AD9AF03A99B21646F2E5724A806DDEF7E7C201AF0EC0F87A634F41E19F820CC98835C252037B8CA030F3705130361B97AB1254631952A3A3A24637A1A06B50D2A57FC0E80C3F7EFC4A1B2E3B3D7444D299DF6EFF0C7100B6F7DB9FE613B0D2DDABFD92F0186D54F0CA1C3D8DE51688E3D61DF7EE3F62550D62BCC10E9B4EC78EBF906B6A99A7F4F3092DA77BC279C7FA890437A8DA9C81C3099B2CE2E6FE686CEC7B205C37BE1EC882E6C367FF752C450E06BF118201E7F15C6261583D788A631716F3C4024C0E507F66C172748914BA81E37DA6FF71A81F60E3F1136C5EC9912A24A8912244891DA318E891256A4254AD486B5A5EB6D9CBB47CA01F658A925DE3C4D8174112799BE0FF43385D283B8E25BC2465B0ECBE3BEA362C078DBD2136EF55BFDC4167760FF000888F98368414BAA3492CFED687D32969D9FEE4A81BC9F2FECCCB084F253FEE629A48AC1336BAC8CBA16C5D78F12EE524B802A6CBD8979603D854594B6DE659A1AD73B41EA0F1EDD4459BA308CDBDEC7A84A8E8B2F44891892A3A31D6A07C095A10207C8E760163E86176F52E2CFACCB1410EE2381933500D68523B274C4A90961AB3F4D77CC480DE14771B472895BB834F88765E0D84FCC1A3928FF0084255561727EA5FE2B9BAFECCAF1897F3BCB2C3E88C52D0BEBB887B3B8E41CF188D7662BDF79C331B1B2320AA00A24AFDE879C2A29CDCAE242F2327B612FB1333645892A5448C632A35A3A3195086843421A1F36D45232EC7719AFF4FA85037E098624E86B21910FD59EF6F4C46013B30FFB85054EE847C435F0A43845AC45B3A7CA0F0E49E40A554F1E3D416C0E0FFB62030591ABFA894FB008796CC080AAE56AFDECCB179FF1FA813241B788941B72586C8D032E3247720D94C55F105DE321312BD841575114F156DB312B7BF3F063A268C74631DA54521A10D4FF0088DD3B12D768AC1E3BFB9854A17DC1E376F7537E0760DC84A8EB71AFB77036E1CD4FE18F9A319A18855EC8D22165AEC541EC9B3E7F31E299C3FADD0C031600AFDB588105271575FAA8100C39F7F05871BDF47E8094F83FB1558CC7C6B32C0916CE258E256A316EA2562206D0471286DC2606E4AC37C4AC903043164595A31233118912319512313E24AF984345770D8BA398D96A6DF5376F3B4573B11DE5F44DD27202FCB0C44A267001EA98B527C11103F7BFDDC08BF4B27F65244BAC87D41E5B76CE18F10C6087411F95BDB1260ABFFB9864573051831765C36942E09B12E18AE0328989464218A244549625E63968788E560F2C20B69E25E154F39875DFD4A8C631D2A546318CB8CC68687C4F810D389559FF00D4BFF63B62E6C368095C12AE1E664D9AEE1F4CC642FB9C03EA2E45C3B950A6DC473701B24E309471015B40ADA1AB10F8436F137B114DD414DA7133902396D4528C1411814359E4EE66636368477C83D66145ACC62C63195AB19513474095081F03FE0B096BDD6F3CD82C04BB1E2A5CC4B0657072E20310031083136950C6D3615021366A1BAE1FD4B98045A4C52CD90AB6958E20A6102D897D8FB84A2A122A8C6070CA9AB68CF7AB1D2B47E0C63165C186A68687CB3196DEAF7B8A2E44C3E2501F104116B896A921E8E107189D0D1DB9E181EA0F89541C28C276D0E0A99429059BD0D1C42682AA81DA3891E25F6DDC0322B4755951D18C624653A9A90F956B80B2A06C3696BB673F88140EA30E205892B1895D62027861E33C53C53A54A912E6276A8D532455E932CDD048D4C794A65D623A992E3572A7E84242C21D5D50D1D1D1231D086A6B5A1ADE842B6C0D1193CB281D9018553508552A0C4C71748132DCA084353198DBD22F278822FC02A2E6D6608F0CAD633100E65AD2E6388C58C9BC12B465474A8C6568C624A3425C1FF88970AD3D3091ED305314FCC21421620518D318540403981EE22B796712C0CC6B798A81A0730452DCC18631089B97DF50C08E99C2E900ABAD1D1F831D5D1D495083A9A1AD4230546572605C428EE52BEE3A93112A23232123E72B50AC2D6F0AC2DBB17CB8EB41261857BC18432CB9DE0B9B9B1951A712E4F137B11432A606967AB24263E88318C58EAC74631D188421A07CAE1F04C4ECE4654F285F6A263562540CC0986FE20E174C00DCD9AC9C5D3F8802FEC451A6877BB8358C3433BC070C3CE60DE16D72C575C4CDBCB0412D864ECC57390C8C2302EAE0329B3A6D2841B0F88D9BE366628A9B8D47515DFC4116A2F97A824F1071163A318C745C65E8EA685C2590D4D6F4346A9EC9802E5606E2536B62000BDA54B6DDEF161C4768532062B28D4DEE4BEC8B2AAF9C5166546ACDB31892C562639DAA5C15984816FF0025165CA686A9DC880CBEA3EDB9B53EE33BB6FBA8170794A80BF8DA6E021806C7F52E51D3976CEA651293FF0052A0F80C5D1D1D18E8E84A84B8C0CB8684343558A20DCDCB882DA96AB4005CE7BEA0D419B5AAFF0010EAA784FA17FC42FD111FDB5021993AFF008328E7FB67F08C8A50BDFF00EA3544EB07F610BC67563F316AF9FBFD03102D1E7F83000B51802FD84DD04F7016D4040B107E50FE2D2FEEBC1F95B8E47D7D7E061FF83FD981D9F53229B7DD3FF08E6A4FABFB0E63BBBA4AB46D647FEA2C441ED892838E1B8697B97FCC16C0143775C1D58C7463A26ABD6F4351D4D0D6987D4B465A41B63883196F68F31D87B0CCC5400A0E00EA2DB7047285BB5F112350EB05423C54734BFDC79B06BC440C559F4CDAD93721B14AF1C9D300030A6F074C7D5EBFB30173CE732A4F270760EEA300AA71C1F519C10F30B912FEA38D88659CF21298E771514A89ECE7F30C38AB649B3EE37D9FCC061A0BF48B09A3D30EC81B187F51596CE25E03B814793E1A11D18E8C65C632A243FE0BD2F43521002B5750E621B2181DB2C5F1675025A3DD2090D494711BD26D65CCA06AE8F32B425ACA6310B08C5D29A8759562AA6D0A114188616A6EA54E332CE76C90A4B33A846EB5C1120C55ED13B840B20600FF0031DFA42A045EBD4FE12436EE2D867265DEA737B76B8259B61EE60655BF3EE29933360DF31EE3374D88D2CE67FF006326542813BB8FC5C1A79A60831D58C6319518E843E47C0F85EA0EF2D65F72C02836B8E9F6CA87433FFA72455E3DB08DC7C1294BA8731B45D6D3210C99AC44B42DA5199946918A5793CC08CB093960F592B76B2BF31DFD606FF84A9863E434B795FF00733AD9FB8B585F52B4128A878A74F21111783BD15BCF30D54AB08751916B08977A7E56180C0FDCC57983B8EC43BFC41D7DE25CA8E8C768C65E8EA7CEC972E1A1A54AC738679A8C4563B60F68C87194FC2470EC0FDF2418ADA1543ED98CB46EE0897053A5650543D86620DE0ED4408AA917166FF9FD12D46616F12CCD288AA07E078AFB71F718DD4389F52CB6BD1A67163A4B8B1C28E62ADFEE88656579B83444B8051945FE0FDCAEC876D2CA5731032BBFA8936F4304125C58C58E8E9518EA6A7C0D4D4653A26518C32E16C4595043C3CFBEA3AF6A72BD9FD45CE5D627DA5412FD5FFBA5D917D09FEB3401FBA0FF0032D43CE2BF01878EBA8DEDC076F7185B3DDFFC1B101668F3BA841452DB679FB7F66D8A05B1FD798106F609FA95AB9BF1C1310136E20372A3818D958BE688C589B0EFC03E656987285572C6AEA563C6B2B31C50D18C7474632E1A9A5EA687CAF63A8F23D23A9C44270C2B08F407FB1DB71EFF00D310DB93A27F202F73CDE6C7EB9FFA27AA287FC44A96147A211C257C4AB087219A21B4A18B235C62CEE9944AF9B2FEC40018BDA84FC189FF0063FE54E07E3C7F302FF33C89D80BF82180836237779DA22CDC0B880BEE2AC4CA003EA79A2626C40A21541D1D1747463330D0D0D2E1F0BF88B21661159BC7048B011A5D45ADE09975A1CCED7DCF2FE60CB52C2907780DEC94A461E90D4A6FB82EBC074F32F57894318388588CF17770B0B5BC51B698F295D2E5CE26CBCC0DCB8BA95D1C68AE26798C97458D1746A3ABA9F2AD4F9EC974BC91B8085A836E605C36432F130F1FC8D59E08295F8991385E617CC56BCCDD02A22E0DE6740AC95644B7816702C001B3B840C972975BCAADF310737073E238A7EA2D3551C2ED955B7617845BB325F998257CCD99B72D3406316312568C7518686A6B7A12F57699F6E44B1B10E33399976F39C0B96803001CEDE62CF87052EB39F12C8F4304A86201DCB3984346362E637600477C8A860382356C41E7F11DAE6525B8DF8F3306606D662FC1B440B310D5236B3962DCA6B31AE3D936262D152F55D2E3174254353FE3B8CCF119B18BB966D6C32DE61A9BCCC67890A6760B2AAC4B97B4A4234F5EE95E7A8349F32CFF00A8D28F1631AB625A800DDE08D2D3E2B07EE317E02DDE988C6C832ABA65FF00A10D37C42AF0865EC7DC75BC112D9EEC801550B3B12EC7E0664DE6DCB6A6023D08C7574B8697A12E10D07E37A9A0C090B5FA8A2196EFFA89DDCB62AE386E0992FA1003ABDE01BADB88C4CAABCCAA6D057EA2C559E9E42E4F5122A7E6C35B4D86C68BD18AB5AA0373060BDCBD96FA8199997EE8AEF6665EE1CCDB5EA227B44DDD8DE057141E62F80E3599B5309A03A353118C63A90D487C0FF80C8496C18B1F88A2EEF30365CC785ADC04BCBAD9B653467218C136D6F656DB73EA540F62BC4337169F462FD4705F38F5039EA5ED28B30965A2E58AE4C8710AC065574E98835572F70F631C9D92BAC8D468B6CA2319C4C8252E0976EF08B11CC9168E497D4C5A17F0B8E952E0C3E27C2FE4A738652640FD91E8B59C93F17299317B9318856F47EEE040DB22A66BCCB20AAB3BA2E381586DF518F20237C0D67F3008DAABFA866DE637504CBDED1CA9BD44AA7657BB20195B31B6829D32D0BBAF2C7B8F7B0C1FA850ADE2662AABDB52E5C18A2CEFA5B50F1168D7065CBD563A9A1F03FE251E25B42DCBF12B5E15F5088AFA9B346C96920516597DE62ADFCD9DFDC6F25B9AC30940A2FF0071CE38AC7AA8F991778408F9A6BB951BC2BCB11A8677C41604A9FDCA98F41105D76659DE0AD0712D4296FEE063BDB1EC1C4B95F0A8434BCCB13626CCDBD252FE55A0FC4D4F89AA9B6122EE89817753F995DC1C416938895FB83666F033192BE92D53F181A1F7E161B1950A2FAB8D2EEB1637104E6BDBC433D9812819F137BB2ED2EB41016D7FB43332076C644D9718AF1C406F2E66A6FA56AB489C614D9D79C161A5C7521A9A9F3B868E3C337A1A0725C0CCBF5171F7CC5AB7EA2246E4B0D9BCE1332B361F72BC90CE2E3AD038E58DB85BAE06368D7EE183E6545770703880D4E0DA303677730E3897B446C97B4B843E2399C6718A3C4A34F04183AB72A3172E1A17A1A5CBD0F85CBD0F0C58602C19330157730DCA0CC7A4CAA314BCCB38337106DF8833251E7786C325CD9B1E60726EE2BCF706156A0B1D78C9BC47D9FB8B956784A20DF5DAE324C5C5021BCF771E21A566540D461EB4EFF8922832E2C62E8683065E84BD0D2E5FC2B4ED66C61009BCC7184E2182B8081B1D1A565456798BBD5DF5364575D439BB3FFD88F6A5571022EEAC7E611AB863DCBC137EE00148AACAEE30858EE7A99223A0BFA8DB72C2933095A621B6930069DFF1C4E10F85B0DA108684BD4D73AD92F42C4DAC7BE21F7B884E2A8B177E2610E1FD544896C06513040C6232051DB536D6F75481D20BDF682C50A963625138828477FE4B3D5C3707956F287F888EDA9538684E210B87336106D0CE314E1282603494BD16318620C20CBC68425CB97ADE84628F0CDACDEC27D1370DDC10D0E06BAA8172B8AF5EA0B6F5FB8389CDA89DB8816D460B7DCB1B504420DF89BB7502EAF626303F52C38A6344C602535842ABC4DF83021A92D8F811A6F1C2D25097AE7408425C18434BF91162D030CDECC98A69B4AE5B0060C311656A8D57FB96D914DE3B859130EBDC2A2E3350166C83CCCB1B69C3F7012DB955077FB21A45DF398A7315FDA30A09417DE1BBE189C68419D1C26D20DA1D0F3AC283A5CB8B021A5C2E07CAE15F26C830CC8C38BC428C14036896E7C4F7C6EBCCBA79D9E267163F931DCDC9182B3642B6717FB23D172DA10539FF00536037FEC712F6CC76B999AD88A17980127282940D4D08340C9A513283698C7AB1A8BD065C351830840D474AD18B48C312E65466E25ABF12C6D98641942FA8A61DBF30346D03EE001955DBDCE5178BFB8118005BEF7856ECDC9CCBB1B2FF00B104055848E698D4AB4993C420B9B153741968E970613845A36136E944E31CC9AC5E2046E5CB83A5C1966830745E834B8CB888E5C337F44BEE6ECC086180B96237AFCF30800066EAF10A660266123B0CA2B2DEBA2012DC8CA4B87B629007671374AF1282CC413C4C937CA2FF000207C174D3B65A57438B1AC2831D061086A6843697A0E972FE0DA99BDA75E6D0EE39B2E56686607AAB8DD455430ABEA5C587137F4336B9FEC7DCA9957BDC2A55D1F999616A53AE6102A02BA488743534187429C3E01466B43A1C465425CBD065CB972F4187C2E28CAD3BB33111B97E9E406214A2F3C24CEDB30258BE606B5C753122533B4795FD4A70DB03421E6FB84C59D741063183E01A774DF3CA6351116379B20C51C770A45D0ACB97060E83A5CB8699D0F83A06206A19D2D2C2C365E2547192FA84B9574C4EEB2562B9972BF330A27564337330484EE5CB9B23660D43465C26E24E1599E61A468E31752FEB42842A2D0BA0E80CB60C212E10D483A90D2E3AA70C6544FB89934B1B16E63A8B5DEDC4461B621957291894718847152A6D9946D0A4DD06B31109F0C72C11B902DA2CB631A14F64CB628B29CF731DA1B8A52B79C3AD010968E3C41EA7BEA0C204257C4D0F8A8B02E033285AAF109984B8D115A6DD4E0661D14E60A6608B2EC40710A7E62157511855A018A8E137C080CA751586D70AD9C45567333856DA09A41BE628A57422A0950AB8B302097071A00E60C1972E0E6592E5C60E8434B972CC77051DCB5378F709B5833A4AB88C499658C4B349B0F12D29B968AB88211D93CDA18239CDA9669DA0F24ACC24BC9702718D6524632A7644AEA541636280829808C1065C21A0EA1ADCBD18A11D47280D04CCAEA1AB995C19CC260A890F66830B9B971B5E6A668CEFDA3CA316E8E425DD9899EB1469546561374B120225E205912C5A1F12C914965495A622341314197A065E83ADC197074B8E505946FE302310D899A5E24743A9CA5F4E7286A4D23681071190C46B31B8904198F70C22547398663D0BD53D4A09CC4F8051836484A82E2AB987113A09F506A0C18F6830F283F0030753418371E14A206C104E08F52853793965387DC0E61CCCDA55A86D7C329D4314A404DBB5454996578E655B98219835D5CCB0E58D1CCAC4C0840D00406A31B8101708F2DBD3B47739E60C20FB4CC18420EB7A1B68C0099445B0E0118289CC7058B7A48B11DD70EB458BC5442B7866EC4CC820C74E8A421A769480E85D2B9E399431DB4AF3304A88F88103404A950351300C90F7099C9B78DA2E983BE20E6103061060D41D030268158989C752BB10C6239605B18C31A542493722A164DE76EB41165C37C46D14BC465E7A9B710730B664E62F5161CD8C41F1A0681EE0306D100B9776C0841A542040952A309613C401B250AE1FC8892FACCB841D2E0E8998A3B8618CC0C621116341AA4388D47A96349518AC796FE27640DED133066295B43702A02E58DF1075159962DED0DB324459454C2685310C33368679611847DC41881020434210206A912306F12E94830610D1FA0AC4B32B0328D1A108AE1ABA895133EEFD4AA59016E5C059C914E2618998D5DA52B10DDCB1A3EF0F51DFF731ED021B4CD2A870B445031CB36C6797453C8A0791890D068420435CCA95189133060C185C404301C041E0D012897A1A1A3A8108CDE5AD9944B213BCBB70FEA2F41F7C46992B4198636895B452ED12F68D66310EBC473C1306D027863AD05B19CFE1030289532557FC4DE395BB123A1074BD060CB8699D18C65C194D56046560941A020CBD2E0C1964B97A30682212E1CF7F19784460F4824BF727EA32B91D90D62338E0750BA9DAA78E19C42F334AAA27918ACBA3A81E0FB84B720233B3CFFD6558DF965C5165C210D2E10DF43E0A474207A13B40206740409509752EF418B0972E5CCC48C611331D2D3AE194B4ABBE2012C62DC433655FA8DD87D27FDC903B5A3FFA6307FE9C6EE8867F86766F70CC04089AD480943F1B7E6674BAE0428A0A8C2C595A12FE461A7118C742C6BA770281A2425CBD6B4A84B97A082174351890344122F6FE0E486137B324D985C51D989123531A54A6541B2917AC9D198F0C77FE92CDA78EC42E801E231737952B4AD46BCCC684B2591742E230080A20210964B830732E5CC6B7A14D53089948A8A8B1596F5332373F00D7645DBFD28EFADE9886F14F21F52DC7E096188BB34F6CFE055C4B7ECDC43B01F50494949772BE0E812E10D2E5CB8232C9645C41954B2084341D56E83A5CBD0F84B8B2FE017CCA54522C7CA291742443AD14388A7515D2985CB60C18425698EFE04CC586D19728682932622A0C40BA8610841D2E5A5E82B4134B97A165DC62D458DC6E5CB62B2E63B9716292A232A53B989422E85F7083787C4D1D5DF45A86F1458D051561E52EADC2842081972F45CB97A2E5B052E10DC18CB8DD4BF3162DCB8DCB9F52E288CCC7418A9518A944087A84C4615A3B6A32E0E62C52F12F32C08DDDE669820CF8B0C3292E1A818B065E8BD1EDA4859697331237AA688CA95A328891A944B8DCA89A7B810855CC689A3F0583199B89D18A10AE39952F50AFF311573168B4329697A6C68BC24740CB7427DC62CCC58BE232E15ADC6A51A3A5CB96751840D0B9995F0A34B9CCB62CB8B04A9835DCA7D53379298F333234E748B052C458AF73EE1EE0C18A7A85C7DCC4C4B25914D0EF2E3EA7D4BF13788C46667DC47B8F94A4A2544D0BEF40D08BAD448ED304B22E62C5CCC1314B1DE0E65C6FAA06EED957CC117B81B845246176879B00C03081A2CEE15CCC417A998DC4D2A39884BA96DCC694CA7B89E654A224FBD0DE98D2E5C20CB97A66666F1971854626D071186F2C0BA177136CEC44AEEB760F82132724225CBA60B52A33177BC16F68D0BD0102114E8FBD6B463F88BD4AA8B2E5E95A24498952A246BBD3F32A07C332B4BD19610D2C9E6710C5E25E6228A8B2F511BF96045C8D9B79386504C3698605CCF721F9210342E103B988474BF31FB8B515769E4CAEBE3994E8FB97112B574C77097065C58665EAE8D4B2A5F9889B23174657B9E514CCF52C9CF2E8093C34C15AE6B3A534CDD0E299B2026CDE590A83E25CB84B8A4F58AB79B4B8AC62CC772E3B412592C8D458C6E54B95312C964A41972D972E5CB9716352C971628CE6E27B88655A1F828B1F6CD980E64488CF238F5092E231BBE0887304C4D9295060CB60E964B34B971F715EE5F99731134B96CBD0BB2BCA108C97D1FE216ABFCA20838F2C46ED35E2259F7A3FDFA855D1F75FD804B11972F32FCC22C0D2E32EBA8B17CC5C6F1877458B7D316D3B5DE2AC5826CE70F94A023053700CD8A53A61F686859CCBD0EA1045C160346FCCC267825B165CBD2E5E8EDA66D53B16C7806786C9FA2619EECAD9F8216AD4DFCDFB62AEBBA80392EEF98636BBD92953207EA10DDC732F15F97FD4A598FA6FFB1B34E9FF0044628C2ADDC76D46008E1C9ECE2172E5CBF318BB8BE22097374618618A1881F515A3A63D25AC4BE202DF68CA1A08615B912CF99F515CCCA51BDD3115511A03701065D4BD1F72DEE5F714964BA8BA35107317826E1FA3043281006C1AD4671BCB8B2E20F04DD03F52CDA0F75079FCC558742646F0E4FB4EE015E19654B25CBD4C61F68E3BC6022232AF9A96895598F0FCCBA36F11CBC898E568CD8DA962C1F70C78EF87B9504D9310605D4A5E6746859BC1211420970611EE5F99898EE592E5C52A37DF020E4E5EE2C62E5CB973C25CB971659332E5E895287D42335AAAE3A3A5F11160B771EC259E229E7437971861530686EE819C9E61DDE60AAE9BCDC422CE0936CA34A7A9B8D0DAE3486C8C4ED9F257509F79AA1E4DE0E31710788895998AAA0210331A1E304C132E30A83058E1988465186A32955558A8B1B8B4CB62CB970D0ED1B04DF5BB2CA9B4DFC44B4A05B4983EA73597BFFD48B0A2B9C7FA4ACC0F55FF00315C76EC3FC609CFE6113B2B1FDFD40B8ABF88EBDE02360B7C27278788B2C88EE30FB68308DA0DACC1B730252331B6BB4B4FB855D4CAEE1526920FB99D5DD956CD98A9B62C854BB2124E151FD8AF2E624717BCB73645FE9163682EFEE60C4B418242F43EB1504C065798F7B31FF813115B547F893694973DA5C65CB6310005ABC46980981A3F2F0FDC7170C360FBDD605E88B0B50DD65925CD85CF98B8838052068A6D2B455A78DE264D8B8865E204311C3AFC30851FA17ECA8A096995B59CD646325B0486872F224C0EC98AE62929111BF116F4288C2FECC50AD72A05C60603CCADCE63561AFB94BBB3585234B2E534AC817F8E65B1745C71AEF27A600CEE109CEF28711BB1308293C72FCE20388398C092962BD2FB8CB53B7A22DC77CCB905A76A6605D04CA2E860536458D060840E736CF6F03A8814E5CBBE260D937AF319114A96018B8B9E71BD7EE026691EBE5AC5B1636DA2972DA6DB5E71B4C3FCD620D5EC7BCC629619DE3C22E4A7F31580B009AB1B29D9151B91B6CF93DCBC4740B1CA6EC577A23DC3ADE517B219E480FF008A1E2FD4457E51C5A893EE42B26E420C4F10645B5C4E5F055F71AED1016189E65CBBA82E6284B413A8BF71315515B97798688318B83FF998A1BBDE54146E66A5B3999EE6731971DA510010E56F5598C95D59C006C440A73845555C9BCA719951DBC5451ABDECFC4ED976979BECDA0EA146BAEA2C6F5DB2578EE7385584686DB41CE337DC05E023513094F824B454529CFBF10D5C9DF63118A451B62CD47908B89BD18B68061BA2AD3697A7A98CE49CDA2842A7FFC400321100020201020502040503050000000000000102110321311012404151203013506181042232719152A1B1142342E1F0FFDA0008010201013F00EA2FD7AFC834F907DBE41AFC8297CBA59A2B6D59F1DB7B90CF25BEA7FA8FA11CB17DFDEAF71B489CDF763499C887057B9AA4296BA919B5B3A2396F47D3B9A4C726D8D5A2FE826BB8E2C71747210938BA97F224A84DA14974939D68869925B313D4714F663C6D6C466D6E85CACE41E34F712688DF9E11DBA293A426D36DAD4538CBB9A3DC7699CECF88FC119A7FF62A15168D0A18B7E8B23B925FC8DAA251D744549126C7343C88F8ACF8D242CB223999F1B5213B24464D313B57D0EF3651292489651CA4C506282472AB25143434533164A66E87131EDEC57B35F998DD227372628890B8318F8316E6277128877E876333D04848447850D0D0D3E115A98969C23D0C919FB09168E6473A39CE739CE6437F41B4C82D486C223B7432DC96294A4B41E38ADE6BEDA9CB897FC9FF000278BCBFE078A2F692FF0004B1648BFD2E8E593D9321826F56ABF7D058D2EE89463E50F0786858649EC4382DBA16EE5A929A71957645AB21180DC39569A9370AB31644A2FF00B0B2EA9324F5D44E24942AD31C6B53137743AE8E7FADFEC2FD4D793935D8E495E8CE49F91D2543D12465755FB1396A9F668D7B31CA7E47275B9865BBF0883B76316CBA19BAC84F7473DEE9171FFCC6E3F5FE479529528ABFAEA5DB32BDBF6165A8D35685283DACA8FF0057F63961E4949572C569DD98C96E47A1CFFA86ED23BF09495114E4FE82DC98D26888BF71B21AB23A23BF055D0668DAB2B4398737E0D5B2AE921DC77439B7A0B1492B6892D7414997663543BA20AC5D14B1D5B5B1354C515566962924D0D2921422BB12D871D4514C4B5A20994DB22925C17AEBDA6AD332C45934A1454858E57B116EF639B424DB472F767C48F623F9A6417A1087D0648EE648D322C8C9AEE2C88F88BC8F222736C8A6C84124417A16C2E8671B3246846A477D474912922ED98A0A8A117C50BA19DA44E2A489469D08546848845B6455244A542DBA6C8FF2B20CC98EC70922A424C8E36CC78D2631BB6476F42E8B2FE96458A4348A472A125E06D9397086CBD0BA14667F9189919116312EFC1B24DD96629F6F4AE87F1125C9C22C4CE639CE6B1C9F06C52643335B91CB1658BA1C995449CDC9DFA75E2D8F8589EA45BA1334F55FB16599D6B6570427C11658DF1A31AB925E85213F6ACBE3923CD128AE084F83E0FD1F87852B7EA4CE6343EDE9B2FD3971F743E0855C18F82394C78F99FD04ABD84CE6E3637EC64C37AA1A685C13398774242890C4FB8925EE365FB4E29EE3C0BB31E191F0A7E058A5E18B14BC0B079646115EEB7D0FD8D4D3DCAF9FF735EBFBFC83BF0EFD777E0F6F75CA2B7673BEC98FE2BDA91CB93FA8E5C9FD5FE0FF00712ECC5925DE2C524F67ED773410BC7B4E4914DFD0518AEDEBCD83995C5B8CBB347E1FF112BE4C95CEBBAD9FB3DCA9BD50B543F3ECEAF44B51E3E55ABD7D329521E56AEFEDDDB22F2356E9173F2BF839A69F67FD8CD8BE234D7E5956FD8C1964D72CD54969E53FBFAD12342F51917A7B1829A6FEA67BB5E86E91DECE56DAADC76DA6EB4F08E654269AB43251D6D68FC9194ADA6BD4B62B52CFFFC40030110002020102040503030403000000000000010211032131101230411320225161044071328191425260A123B1F0FFDA0008010301013F00F25FD827D0BE084DFB7D83F2AE1AF9971D7DBEF59DB87EDF76CBE17C2FE3EFD17F7F5D78E293238A24B027B1E07C92C725DBAACE6EA256C8C16826E2733149F06AD12845F6B258DAD53BEA5AE9A80A290AACE5F9B1DD1CC9AA148E648924F5436EC714C69AE35E7FFDB74A115BB134C8BEC34293429A64A298ED1CEF614DA1BB1D7B7092D6FA3EAE8C55B293D13391ADC69A762A6ACE53C343832A4537D8A29F197475E8C17A5B15D89E9AB138B14058D8B13EE78511628D9E143E07850F0BF63242844A16354FA1A7457E946A462D91C27A50F20F236733A22C4C4F5398CB04D1DE8B27BF434E8A7E912B64209243932C7C10845887B197497096FD0AE8A76605EA1BE336C498989BB2CB10F66657A9A8DEABEC62CC0335351459CA728A0C7168424C9EC64DF83DFA1AF46375FB90CB0845A7BFB0A73924D41FEE7365FED5FC8E5917F4AFE48E66B78BFF00B3C6C6FF00A90A71F744BEA31AD9DFE09E66FB488CE5ECC8E7ADD343CB092DD5995707DFCC974E314A116B7B143FE44DAD1B13D0C9E23BAD08C32393211945FC1971A734BE351E154DC5DD7C0B48E8494B57445CEE88BD754665171BAD483717F0376FECA2DF84BF257A13F6D452D37D052C6D6A73625B26D8DDBBD911D5B7FC1F4EAEFF00263868D7B33D3B342C70ECC78D599E1B2F766454A8C6B525FA9F97BF520AF0FEE62A699E138ECDFE06A7F0253F82185B4DCA4EBD9696249687D3ADFF002C962E69732752FF004C9788B7498A72FED39F235A47FD9084B9B9A6D5D68BD8CCEDB31A544DFA9FD8FD33F40928C99D8688C193A8C7DD8C86888CB64496A521226EA2495C84BD23DDF04FCD4BA3F4F3A957B92752425A11827ADFEC49C62B416ADB7B21414BF4BB142B7164837485F2729B19E56635BB324AA35EE57434E92CFCCA29EE998E7A13C8F6473BA2DB8BFC0A728BD09E59B5B91934CF15558F334C94ED191DEA294230DF526DC9EBC1FD8A74CC2D684E16EC49A124D12C29ADF53C262C6AF7455D243C6EB527E9812AA18CBB1F05F618A7A262768B698B2A7BA3C284968D21FD3E339211F61D3D89CA894B99FC1265F175669AFD8C1A4C84C621EDA3173B7BB1266C8CB2765922B8BAE2BAF8F5684F9654277C15899A139248934D908F331F068D38F6F2D74F17EA5F932C08646B72338B39A345A2796951927624463486B52FC9A70A13E34BA7857AD7E4946D1282159CD2439C86D94416A226BD4FC8DD7934EB615EB435A13C6C685B926ECEC24C8AA28CD0777C7F235C761570B398AE97D3A7CE2251D09419C83C6720A3A95B143564F027B684B1497C963B7A15C52E37D2C78DC884145508B544970A1AD0512ACAD0AE124A8925653EC532D1A948BE9514607C170651431F16599255163E14388D346965F0A7E7AE38E552131313E37A0F8687618CCF3B75E671397872F0BE345797164ECC4C437A0F73B7068BA63921BD4C997957C8DF9E868E57C684BA18F3568C8C93F23458D8D93CB5B0DB6FA8915D28CDAEE47EA5ADD0BEA22C59A1EE3CB0F743CD15DC79FD9129C9F552A2BFCFAFFC0575526CA5EE5C7E4E65EC5C7D8B88E2BB32BAAFA55C1F9A88CA9EBAA251EEB6E8F634F71AD44B4E8CA4A2ADB31E5E66FCAA36249BA1B827A6A5C5F63D2E854BE7E071E82287B1635D0FAD6D35AE947D1FE96FC895B1B36B1553A352F548BD4521C572A7E47C37E1CCCFFFD9);
INSERT INTO `sec_users` VALUES ('Jhonaza', 'd4f5fa791b6a5ac2106f7fa5a62b960eb6e52692dd34d3446bf009f2c927bb289a608e0bc53a37e4e51fc691722f97d5ac0e188f1c89267e996478f5bef1e44a', 'Jhon Jairo Aza', 'jhonjairoaza@gmail.com', 'Y', '', '', '', '');
INSERT INTO `sec_users` VALUES ('JJ-80', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', 'Jhon Aza', 'jhon@holdingsgroup.ca', 'Y', '', '', '', '');
INSERT INTO `sec_users` VALUES ('kcortes', '6b7005454fe3d3a26e374cb90f00c84541718826ce256df6616d3e33867e894cd2aafb0902d83cfcf6bd9e7fb5017506566ff14403f1cd197e2cd1764970b806', 'KC', 'kc.knightstar@gmail.com', 'Y', '', '', '', '');

-- ----------------------------
-- Table structure for sec_users_apps
-- ----------------------------
DROP TABLE IF EXISTS `sec_users_apps`;
CREATE TABLE `sec_users_apps`  (
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priv_access` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_insert` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_delete` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_update` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_export` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_print` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`login`, `app_name`) USING BTREE,
  INDEX `sec_users_apps_ibfk_2`(`app_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sec_users_apps
-- ----------------------------

-- ----------------------------
-- Table structure for sec_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `sec_users_groups`;
CREATE TABLE `sec_users_groups`  (
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`login`, `group_id`) USING BTREE,
  INDEX `sec_users_groups_ibfk_2`(`group_id` ASC) USING BTREE,
  CONSTRAINT `sec_users_groups_ibfk_1` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sec_users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sec_users_groups
-- ----------------------------
INSERT INTO `sec_users_groups` VALUES ('admin', 1);
INSERT INTO `sec_users_groups` VALUES ('kcortes', 1);

-- ----------------------------
-- Table structure for sec_users_social
-- ----------------------------
DROP TABLE IF EXISTS `sec_users_social`;
CREATE TABLE `sec_users_social`  (
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`login`, `resource`, `resource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sec_users_social
-- ----------------------------

-- ----------------------------
-- Table structure for teller
-- ----------------------------
DROP TABLE IF EXISTS `teller`;
CREATE TABLE `teller`  (
  `TellerId` int NOT NULL AUTO_INCREMENT,
  `TellerName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TellerDeviceId` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TellerCreationDate` datetime NOT NULL,
  `Teller_OfficeId` int NOT NULL,
  `TellerAsignaturePaid` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`TellerId`) USING BTREE,
  INDEX `fk_Teller_Office1_idx`(`Teller_OfficeId` ASC) USING BTREE,
  CONSTRAINT `fk_Teller_Office1` FOREIGN KEY (`Teller_OfficeId`) REFERENCES `office` (`OfficeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teller
-- ----------------------------
INSERT INTO `teller` VALUES (41, 'Teller 1', '', '2022-04-13 18:06:46', 22, b'0');

-- ----------------------------
-- Table structure for tellerlogin
-- ----------------------------
DROP TABLE IF EXISTS `tellerlogin`;
CREATE TABLE `tellerlogin`  (
  `TellerLoginId` int NOT NULL AUTO_INCREMENT,
  `TellerLogin_TellerId` int NOT NULL,
  `TellerLogin_UserAccountId` int NOT NULL,
  PRIMARY KEY (`TellerLoginId`) USING BTREE,
  INDEX `fk_TellerLogin_Teller1_idx`(`TellerLogin_TellerId` ASC) USING BTREE,
  INDEX `fk_TellerLogin_UserAccountId`(`TellerLogin_UserAccountId` ASC) USING BTREE,
  CONSTRAINT `fk_TellerLogin_Teller1` FOREIGN KEY (`TellerLogin_TellerId`) REFERENCES `teller` (`TellerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TellerLogin_UserAccountId` FOREIGN KEY (`TellerLogin_UserAccountId`) REFERENCES `useraccount` (`UserAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tellerlogin
-- ----------------------------
INSERT INTO `tellerlogin` VALUES (2, 41, 2763);

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `TransactionId` int NOT NULL AUTO_INCREMENT,
  `TransactionDate` datetime NOT NULL,
  `TransactionAmount` double NOT NULL,
  `Transaction_TransactionTypeId` int NOT NULL,
  `Transaction_TellerId` int NOT NULL,
  `Transaction_CurrencyId` int NOT NULL,
  PRIMARY KEY (`TransactionId`) USING BTREE,
  INDEX `fk_TransactionRegister_Transaction1_idx`(`Transaction_TransactionTypeId` ASC) USING BTREE,
  INDEX `fk_TransactionRegister_Teller1_idx`(`Transaction_TellerId` ASC) USING BTREE,
  INDEX `fk_Transaction_Currency1`(`Transaction_CurrencyId` ASC) USING BTREE,
  INDEX `idx_transactionDate`(`TransactionId` ASC, `TransactionDate` ASC) USING BTREE,
  CONSTRAINT `fk_TransactionRegister_Teller1` FOREIGN KEY (`Transaction_TellerId`) REFERENCES `teller` (`TellerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TransactionRegister_Transaction1` FOREIGN KEY (`Transaction_TransactionTypeId`) REFERENCES `transactiontype` (`TransactionTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_Currency1` FOREIGN KEY (`Transaction_CurrencyId`) REFERENCES `currency` (`CurrencyId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES (126, '2022-09-14 21:06:20', 1102.6, 30, 41, 1);
INSERT INTO `transaction` VALUES (127, '2022-09-23 17:22:41', 1102.6, 30, 41, 1);

-- ----------------------------
-- Table structure for transactiontype
-- ----------------------------
DROP TABLE IF EXISTS `transactiontype`;
CREATE TABLE `transactiontype`  (
  `TransactionTypeId` int NOT NULL AUTO_INCREMENT,
  `TransactionTypeName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`TransactionTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transactiontype
-- ----------------------------
INSERT INTO `transactiontype` VALUES (1, 'FIRST_BALANCE');
INSERT INTO `transactiontype` VALUES (2, 'CASH_OVER');
INSERT INTO `transactiontype` VALUES (3, 'CASH_SHORT');
INSERT INTO `transactiontype` VALUES (4, 'DENOMINATIONS_NOT_MATCH');
INSERT INTO `transactiontype` VALUES (5, 'TRANSFER_TO_TELLER');
INSERT INTO `transactiontype` VALUES (6, 'TRANSFER_FROM_TELLER');
INSERT INTO `transactiontype` VALUES (7, 'RATE_CHANGE');
INSERT INTO `transactiontype` VALUES (8, 'CHECK_ON_HOLD');
INSERT INTO `transactiontype` VALUES (9, 'CHECK DEPOSIT');
INSERT INTO `transactiontype` VALUES (10, 'TRANSFER_FROM_RESERVE');
INSERT INTO `transactiontype` VALUES (11, 'TRANSFER_TO_RESERVE');
INSERT INTO `transactiontype` VALUES (12, 'TRANSFER_FROM_BANK');
INSERT INTO `transactiontype` VALUES (13, 'RESERVE_TELLER_PERMISSION');
INSERT INTO `transactiontype` VALUES (14, 'EXPENSES_&_COST_OUT');
INSERT INTO `transactiontype` VALUES (15, 'EXPENSES_&_COST__IN');
INSERT INTO `transactiontype` VALUES (16, 'PINLESS_PHONE');
INSERT INTO `transactiontype` VALUES (17, 'WIRE_TRANSFER_DEBIT');
INSERT INTO `transactiontype` VALUES (18, 'SHIPPING_PARCEL');
INSERT INTO `transactiontype` VALUES (19, 'CHECK_RETURNED');
INSERT INTO `transactiontype` VALUES (20, 'CHECK_PAID');
INSERT INTO `transactiontype` VALUES (21, 'CURRENCYEXCHANGE_BUY');
INSERT INTO `transactiontype` VALUES (22, 'CURRENCYEXCHANGE_SELL');
INSERT INTO `transactiontype` VALUES (23, 'PENALTY_PAYMENT');
INSERT INTO `transactiontype` VALUES (24, 'PENALTY_AMOUNT_UPDATE');
INSERT INTO `transactiontype` VALUES (25, 'WIRE_TRANSFER_CASH_SEND');
INSERT INTO `transactiontype` VALUES (26, 'WIRE_TRANSFER_REFUND');
INSERT INTO `transactiontype` VALUES (27, 'CLOSE_WIRE_TRANSFER');
INSERT INTO `transactiontype` VALUES (28, 'CLOSE_PINLESSPHONE');
INSERT INTO `transactiontype` VALUES (29, 'CHECK_PAYROLL');
INSERT INTO `transactiontype` VALUES (30, 'PAYROLL PAYMENT ');
INSERT INTO `transactiontype` VALUES (31, 'PAYROLL_LIST_CLOSE');
INSERT INTO `transactiontype` VALUES (32, 'PENALTY_PAYMENT_COST_AMOUNT');
INSERT INTO `transactiontype` VALUES (33, 'LOAD_IMAGE_CHECK');
INSERT INTO `transactiontype` VALUES (34, 'WIRE_TRANSFER_CASH_PAYMENT');
INSERT INTO `transactiontype` VALUES (35, 'SHIPPING_PARCEL_PAYMENT');
INSERT INTO `transactiontype` VALUES (36, 'PINLESS_PHONE_PAYMENT');
INSERT INTO `transactiontype` VALUES (37, '000');
INSERT INTO `transactiontype` VALUES (38, 'PAY_CHECK_MAKER');
INSERT INTO `transactiontype` VALUES (39, 'WIRE_TRANSFER_VOID');
INSERT INTO `transactiontype` VALUES (40, 'WIRE_TRANSFER_REPLACING');
INSERT INTO `transactiontype` VALUES (41, 'DEPOSIT CASH');
INSERT INTO `transactiontype` VALUES (42, 'PAY_PAYROLL_OFFLIST');
INSERT INTO `transactiontype` VALUES (43, 'TRANSFERED_PAYROLL_CLOSED_LIST_POSITIVE');
INSERT INTO `transactiontype` VALUES (44, 'TRANSFER_FROM_PAYROLL');
INSERT INTO `transactiontype` VALUES (45, 'TRANSFER_TO_PAYROLL');
INSERT INTO `transactiontype` VALUES (46, 'AJUSTMENT_PAYROLL_INCREASE_POSITIVE');
INSERT INTO `transactiontype` VALUES (47, 'AJUSTMENT_PAYROLL_DECREASE_POSITIVE');
INSERT INTO `transactiontype` VALUES (48, 'TRANSFERED_PAYROLL_CLOSED_LIST_NEGATIVE');
INSERT INTO `transactiontype` VALUES (49, 'ADJUSTMENT_PAYROLL_CLOSED_LIST_POSITIVE');
INSERT INTO `transactiontype` VALUES (50, 'ADJUSTMENT_PAYROLL_CLOSED_LIST_NEGATIVE');
INSERT INTO `transactiontype` VALUES (51, 'AJUSTMENT_PAYROLL_INCREASE_NEGATIVE');
INSERT INTO `transactiontype` VALUES (52, 'AJUSTMENT_PAYROLL_DECREASE_NEGATIVE');
INSERT INTO `transactiontype` VALUES (53, 'COMMISSION_PAYROLL_LIST_CLOSE');
INSERT INTO `transactiontype` VALUES (54, 'LIBRE_');
INSERT INTO `transactiontype` VALUES (55, 'LIBRE_');

-- ----------------------------
-- Table structure for useraccount
-- ----------------------------
DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE `useraccount`  (
  `UserAccountId` int NOT NULL AUTO_INCREMENT,
  `UserAccountSIN` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserAccountFullName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserAccountEmail` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserAccountAddress` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserAccountMobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserAccount_UserStatusId` int NOT NULL,
  `UserAccountRegisterDate` date NOT NULL,
  `UserAccount_GenderId` int NOT NULL,
  `UserAccount_CityId` int NOT NULL,
  `UserAccount_UserRoleId` int NOT NULL,
  `UserAccount_login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`UserAccountId`) USING BTREE,
  INDEX `fk_UserAccount_Gender1_idx`(`UserAccount_GenderId` ASC) USING BTREE,
  INDEX `fk_UserAccount_City1_idx`(`UserAccount_CityId` ASC) USING BTREE,
  INDEX `fk_UserAccount_UserRole1_idx`(`UserAccount_UserRoleId` ASC) USING BTREE,
  INDEX `fk_UserAccount_UserStatus1_idx`(`UserAccount_UserStatusId` ASC) USING BTREE,
  INDEX `fk_UserAccount_login`(`UserAccount_login` ASC) USING BTREE,
  CONSTRAINT `fk_UserAccount_City1` FOREIGN KEY (`UserAccount_CityId`) REFERENCES `city` (`CityId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserAccount_Gender1` FOREIGN KEY (`UserAccount_GenderId`) REFERENCES `gender` (`GenderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserAccount_UserRole1` FOREIGN KEY (`UserAccount_UserRoleId`) REFERENCES `userrole` (`UserRoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserAccount_UserStatus1` FOREIGN KEY (`UserAccount_UserStatusId`) REFERENCES `userstatus` (`UserStatusId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2822 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of useraccount
-- ----------------------------
INSERT INTO `useraccount` VALUES (2763, '', 'Jhon Jairo Aza', 'jhonjairoaza@gmail.com', 'James 15 Finalyway', '4373285913', 1, '2022-04-22', 1, 53, 3, 'Jhonaza');
INSERT INTO `useraccount` VALUES (2764, '', 'Sergio Aza', 'sergioaaza@gmail.com', '', '2222288888', 1, '2022-04-22', 1, 283, 4, '');
INSERT INTO `useraccount` VALUES (2767, '', 'NA', '', '', '1111111111', 1, '2022-06-20', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2772, '', 'NA', 'info@na.ca', '1275 finch', '1111111111', 1, '2022-06-20', 1, 45, 4, '');
INSERT INTO `useraccount` VALUES (2773, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2774, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2775, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2776, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2777, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2778, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2779, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2780, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2781, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2782, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2783, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2784, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2785, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2786, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2787, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2788, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2789, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2790, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2791, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2792, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2793, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2794, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2795, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2796, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2797, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2798, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2799, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2800, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2801, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2802, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2803, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2804, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2805, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2806, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2807, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2808, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2809, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2810, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2811, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2812, '', 'N/A', '', '', '', 1, '2022-06-24', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2813, '', 'NA', '', '', '', 1, '2022-06-30', 3, 45, 4, '');
INSERT INTO `useraccount` VALUES (2814, '', 'cajero', 'g@d.com', '', '', 1, '2022-09-14', 3, 45, 3, 'cajero');
INSERT INTO `useraccount` VALUES (2815, '', 'KC', 'kc.knightstar@gmail.com', '', '', 1, '2022-09-14', 3, 45, 3, 'kcortes');
INSERT INTO `useraccount` VALUES (2816, '', 'N/A', '', '', '', 1, '2022-09-27', 3, 23, 4, '');
INSERT INTO `useraccount` VALUES (2817, '', 'N/A', '', '', '', 1, '2022-09-27', 3, 46, 4, '');
INSERT INTO `useraccount` VALUES (2818, '', 'N/A', '', '', '', 1, '2022-09-27', 3, 13, 4, '');
INSERT INTO `useraccount` VALUES (2819, '', 'N/A', '', '', '', 1, '2022-10-04', 3, 23, 4, '');
INSERT INTO `useraccount` VALUES (2820, '', 'NA', '', '', '', 1, '2022-10-07', 3, 384, 4, '');
INSERT INTO `useraccount` VALUES (2821, '', 'N/A', '', '', '', 1, '2022-10-11', 3, 384, 4, '');

-- ----------------------------
-- Table structure for useraccounttransaction
-- ----------------------------
DROP TABLE IF EXISTS `useraccounttransaction`;
CREATE TABLE `useraccounttransaction`  (
  `UserAccountTransactiont_UserAccountId` int NOT NULL,
  `UserAccountTransaction_TransactionId` int NOT NULL,
  INDEX `fk_UserAccount_has_Transaction_Transaction1_idx`(`UserAccountTransaction_TransactionId` ASC) USING BTREE,
  INDEX `fk_UserAccount_has_Transaction_UserAccount1_idx`(`UserAccountTransactiont_UserAccountId` ASC) USING BTREE,
  CONSTRAINT `fk_UserAccount_has_Transaction_Transaction1` FOREIGN KEY (`UserAccountTransaction_TransactionId`) REFERENCES `transaction` (`TransactionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserAccount_has_Transaction_UserAccount1` FOREIGN KEY (`UserAccountTransactiont_UserAccountId`) REFERENCES `useraccount` (`UserAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of useraccounttransaction
-- ----------------------------
INSERT INTO `useraccounttransaction` VALUES (2764, 126);
INSERT INTO `useraccounttransaction` VALUES (2763, 126);
INSERT INTO `useraccounttransaction` VALUES (2764, 127);
INSERT INTO `useraccounttransaction` VALUES (2763, 127);

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `UserRoleId` int NOT NULL AUTO_INCREMENT,
  `UserRoleName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`UserRoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (1, 'Manager');
INSERT INTO `userrole` VALUES (2, 'Employee');
INSERT INTO `userrole` VALUES (3, 'Cashier');
INSERT INTO `userrole` VALUES (4, 'Owner');

-- ----------------------------
-- Table structure for userstatus
-- ----------------------------
DROP TABLE IF EXISTS `userstatus`;
CREATE TABLE `userstatus`  (
  `UserStatusId` int NOT NULL AUTO_INCREMENT,
  `UserStatusName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`UserStatusId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userstatus
-- ----------------------------
INSERT INTO `userstatus` VALUES (1, 'Active');
INSERT INTO `userstatus` VALUES (2, 'Inactive');

SET FOREIGN_KEY_CHECKS = 1;
