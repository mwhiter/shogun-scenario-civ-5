-- Units
DELETE FROM 'Units';
DELETE FROM 'Unit_Builds';
DELETE FROM 'Unit_ClassUpgrades';
DELETE FROM 'Unit_FreePromotions';
DELETE FROM 'Unit_Flavors';
DELETE FROM 'Unit_ResourceQuantityRequirements';
DELETE FROM 'Unit_UniqueNames';
DELETE FROM 'Unit_YieldFromKills';
DELETE FROM 'UnitGameplay2DScripts';
DELETE FROM 'UnitClasses';

-- Buildings
DELETE FROM 'Buildings';
DELETE FROM 'Building_BuildingClassHappiness';
DELETE FROM 'Building_BuildingClassYieldChanges';
DELETE FROM 'Building_ClassesNeededInCity';
DELETE FROM 'Building_FreeUnits';
DELETE FROM 'Building_DomainFreeExperiences';
DELETE FROM 'Building_DomainProductionModifiers';
DELETE FROM 'Building_Flavors';
DELETE FROM 'Building_GlobalYieldModifiers';
DELETE FROM 'Building_HurryModifiers';
DELETE FROM 'Building_LocalResourceAnds';
DELETE FROM 'Building_LocalResourceOrs';
DELETE FROM 'Building_PrereqBuildingClasses';
DELETE FROM 'Building_ResourceQuantity';
DELETE FROM 'Building_ResourceQuantityRequirements';
DELETE FROM 'Building_RiverPlotYieldChanges';
DELETE FROM 'Building_SeaPlotYieldChanges';
DELETE FROM 'Building_LakePlotYieldChanges';
DELETE FROM 'Building_SeaResourceYieldChanges';
DELETE FROM 'Building_ResourceYieldChanges';
DELETE FROM 'Building_FeatureYieldChanges';
DELETE FROM 'Building_TerrainYieldChanges';
DELETE FROM 'Building_SpecialistYieldChanges';
DELETE FROM 'Building_UnitCombatProductionModifiers';
DELETE FROM 'Building_YieldChanges';
DELETE FROM 'Building_YieldChangesPerPop';
DELETE FROM 'Building_TechEnhancedYieldChanges';
DELETE FROM 'Building_YieldModifiers';
DELETE FROM 'BuildingClasses';

-- Eras & Technology
--DELETE FROM 'Eras' WHERE Type == 'ERA_ANCIENT';
DELETE FROM 'Eras' WHERE Type == 'ERA_CLASSICAL';
DELETE FROM 'Eras' WHERE Type == 'ERA_MEDIEVAL';
DELETE FROM 'Eras' WHERE Type == 'ERA_INDUSTRIAL';
DELETE FROM 'Eras' WHERE Type == 'ERA_RENAISSANCE';
DELETE FROM 'Eras' WHERE Type == 'ERA_MODERN';
DELETE FROM 'Eras' WHERE Type == 'ERA_POSTMODERN';
DELETE FROM 'Eras' WHERE Type == 'ERA_FUTURE';
UPDATE 'Eras' SET Type == 'ERA_INDUSTRIAL' WHERE ID == '0';

DELETE FROM 'Technologies';
DELETE FROM 'Technology_Flavors';
DELETE FROM 'Technology_PrereqTechs';

-- Civilizations & Leaders
-- Deleting table causes crash; delete individually (sigh)
-- Vanilla
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_AMERICA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_WASHINGTON';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_ARABIA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_HARUN_AL_RASHID';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_AZTEC';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_MONTEZUMA';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_CHINA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_WU_ZETIAN';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_EGYPT';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_RAMESSES';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_ENGLAND';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_ELIZABETH';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_FRANCE';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_NAPOLEON';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_GERMANY';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_BISMARCK';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_GREECE';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_ALEXANDER';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_INDIA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_GANDHI';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_IROQUOIS';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_HIAWATHA';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_JAPAN';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_ODA_NOBUNAGA';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_OTTOMAN';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_SULEIMAN';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_PERSIA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_DARIUS';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_ROME';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_AUGUSTUS';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_RUSSIA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_CATHERINE';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_SIAM';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_RAMKHAMHAENG';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_SONGHAI';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_ASKIA';

-- Xpac 1
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_AUSTRIA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_MARIA';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_BYZANTIUM';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_THEODORA';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_CARTHAGE';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_DIDO';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_CELTS';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_BOUDICCA';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_ETHIOPIA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_SELASSIE';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_HUNS';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_ATTILA';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_MAYA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_PACAL';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_NETHERLANDS';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_WILLIAM';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_SWEDEN';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_GUSTAVUS_ADOLPHUS';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_SPAIN';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_ISABELLA';

-- Xpac 2
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_ASSYRIA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_ASHURBANIPAL';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_BRAZIL';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_PEDRO';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_INDONESIA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_GAJAH_MADA';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_MOROCCO';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_AHMAD_ALMANSUR';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_POLAND';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_CASIMIR';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_PORTUGAL';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_MARIA_I';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_SHOSHONE';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_POCATELLO';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_VENICE';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_ENRICO_DANDOLO';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_ZULU';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_SHAKA';

-- DLC
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_BABYLON';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_NEBUCHADNEZZAR';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_DENMARK';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_HARALD';
DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_INCA';
DELETE FROM 'Leaders' WHERE Type= 'LEADER_PACHACUTI';
-- Commented out because CTD otherwise (suspect minimum # of civilizations: 4 perhaps?)
--DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_KOREA';
--DELETE FROM 'Leaders' WHERE Type= 'LEADER_SEJONG';
--DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_MONGOL';
--DELETE FROM 'Leaders' WHERE Type= 'LEADER_GENGHIS_KHAN';
--DELETE FROM 'Civilizations' WHERE Type = 'CIVILIZATION_POLYNESIA';
--DELETE FROM 'Leaders' WHERE Type= 'LEADER_KAMEHAMEHA';

DELETE FROM 'Civilization_BuildingClassOverrides';
DELETE FROM 'Civilization_FreeBuildingClasses';
DELETE FROM 'Civilization_FreeTechs';
DELETE FROM 'Civilization_FreeUnits';
DELETE FROM 'Civilization_UnitClassOverrides';
DELETE FROM 'Leader_Traits';
DELETE FROM 'Traits';

-- Culture
DELETE FROM 'Policies';
DELETE FROM 'Policy_CityYieldChanges';
DELETE FROM 'Policy_CoastalCityYieldChanges';
DELETE FROM 'Policy_CapitalYieldChanges';
DELETE FROM 'Policy_CapitalYieldPerPopChanges';
DELETE FROM 'Policy_CapitalYieldModifiers';
DELETE FROM 'Policy_Flavors';
DELETE FROM 'Policy_HurryModifiers';
DELETE FROM 'Policy_SpecialistExtraYields';
DELETE FROM 'Policy_BuildingClassYieldModifiers';
DELETE FROM 'Policy_BuildingClassYieldChanges';
DELETE FROM 'Policy_BuildingClassCultureChanges';
DELETE FROM 'Policy_BuildingClassProductionModifiers';
DELETE FROM 'Policy_BuildingClassHappiness';
DELETE FROM 'Policy_ImprovementYieldChanges';
DELETE FROM 'Policy_ImprovementCultureChanges';
DELETE FROM 'Policy_FreePromotions';
DELETE FROM 'Policy_UnitCombatProductionModifiers';
DELETE FROM 'Policy_FreeUnitClasses';
DELETE FROM 'PolicyBranchTypes';
DELETE FROM 'PolicyBranch_Disables';
DELETE FROM 'Policy_GreatWorkYieldChanges';

-- Religion
--DELETE FROM 'Beliefs';
DELETE FROM 'Belief_BuildingClassYieldChanges';
DELETE FROM 'Belief_BuildingClassHappiness';
DELETE FROM 'Belief_CityYieldChanges';
DELETE FROM 'Belief_EraFaithUnitPurchase';
DELETE FROM 'Belief_FeatureYieldChanges';
DELETE FROM 'Belief_ImprovementYieldChanges';
DELETE FROM 'Belief_MaxYieldModifierPerFollower';
DELETE FROM 'Belief_ResourceYieldChanges';
DELETE FROM 'Belief_TerrainYieldChanges';
DELETE FROM 'Belief_YieldChangeAnySpecialist';
DELETE FROM 'Belief_YieldChangePerForeignCity';
DELETE FROM 'Belief_YieldChangePerXForeignFollowers';
DELETE FROM 'Belief_YieldChangeTradeRoute';
DELETE FROM 'Belief_YieldChangeNaturalWonder';
DELETE FROM 'Belief_YieldChangeWorldWonder';
DELETE FROM 'HandicapInfo_AIFreeTechs';

-- Misc stuff
DELETE FROM 'Improvements';
DELETE FROM 'LeagueProjects';
DELETE FROM 'Resolutions';