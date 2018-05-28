-- Scenario file for Shogun Scenario
---------------------------------------
-- Globals
---------------------------------------
local g_bScenarioDone = false;
local g_iHandicap = Game:GetHandicapType();

local g_kiGameTurnLength = 100;

function ExperienceForUnitClasses(iPlayer, iCity, iUnit, iBuilding, bGold, bFaith)
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity);
	
	if (pCity:IsHasBuilding(GameInfo.Buildings["BUILDING_YARI_DRILL_YARD"])) then
		print('Building has Yari Drill Yard. We trained unit: ' .. iUnit);
	end
end
GameEvents.CityTrained.Add(ExperienceForUnitClasses);

---------------------------------------
-- UI Handlers
---------------------------------------
ContextPtr:SetUpdate(function()

	if (g_bScenarioDone) then
		ContextPtr:ClearUpdate(); 
		ContextPtr:SetHide( true );
	end

	local iTurnsRemaining = g_kiGameTurnLength - Game.GetGameTurn();
	local turnsRemainingText = Locale.ConvertTextKey("TXT_KEY_SHOGUN_SCENARIO_TURNS_REMAINING", iTurnsRemaining);
	Controls.TurnsRemainingLabel:LocalizeAndSetText(turnsRemainingText);
	Controls.Grid:DoAutoSize();
end);

function OnBriefingButton()

    UI.AddPopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TEXT,
                   Data1 = 800,
                   Data2 = Game.GetActivePlayer(),
                   Option1 = true,
                   Text = "TXT_KEY_SHOGUN_SCENARIO_CIV5_DAWN_TEXT" } );
end
Controls.BriefingButton:RegisterCallback( Mouse.eLClick, OnBriefingButton );

function OnEnterCityScreen()
    ContextPtr:SetHide( true );
end
Events.SerialEventEnterCityScreen.Add( OnEnterCityScreen );

function OnExitCityScreen()

	if (Game:GetGameState() ~= GameplayGameStateTypes.GAMESTATE_EXTENDED) then 
    		ContextPtr:SetHide( false );
	end
end
Events.SerialEventExitCityScreen.Add( OnExitCityScreen );

---------------------------------------
-- Special Scenarios Rules
---------------------------------------
function CityHasMajorityReligion(pCity, eReligion)
	local iReligiousMajority = pCity:GetReligiousMajority();
	local eCityReligion = GameInfo.Religions[iReligiousMajority].Type;
	return eCityReligion == eReligion;
end

function ReligiousUnitsRequireCorrectReligion(playerID, cityID, iUnit)
	local eUnitRequiresReligionInCity = GameInfo.Units[iUnit].RequiresReligionInCity;
	if eUnitRequiresReligionInCity ~= nil then
		local pPlayer = Players[playerID];
		local pCity = pPlayer:GetCityByID(cityID);
		if pCity ~= nil then
			return CityHasMajorityReligion(pCity, eUnitRequiresReligionInCity);
		end
	end	
	return true;
end
GameEvents.CityCanTrain.Add( ReligiousUnitsRequireCorrectReligion );

function ReligiousBuildingsRequireCorrectReligion(playerID, cityID, iBuilding)
	local eBuildingRequiresReligionInCity = GameInfo.Buildings[iBuilding].RequiresReligionInCity;
	if eBuildingRequiresReligionInCity then
		local pPlayer = Players[playerID];
		local pCity = pPlayer:GetCityByID(cityID);
		if pCity ~= nil then
			return CityHasMajorityReligion(pCity, eBuildingRequiresReligionInCity);
		end
	end
	return true;
end
GameEvents.CityCanConstruct.Add( ReligiousBuildingsRequireCorrectReligion );
---------------------------------------
-- Setup
---------------------------------------
function SetInitialCityBuilds()
	local pCity;
	
	-- Satsuma
	pCity = Map.GetPlot(5,9):GetPlotCity();
	pCity:PushOrder (OrderTypes.ORDER_TRAIN, GameInfo.Units["UNIT_SPEARMAN"].ID, -1, 0, false, false);
	
	-- Owari
	pCity = Map.GetPlot(44,16):GetPlotCity();
	pCity:PushOrder (OrderTypes.ORDER_TRAIN, GameInfo.Units["UNIT_SPEARMAN"].ID, -1, 0, false, false);
	
	-- Izu
	pCity = Map.GetPlot(52,8):GetPlotCity();
	pCity:PushOrder (OrderTypes.ORDER_TRAIN, GameInfo.Units["UNIT_SPEARMAN"].ID, -1, 0, false, false);
end

-- TODO: refactor this into a nice, neat method (should be easy!)
function SetInitialReligions()
	local iUesugiPlayer = -1;
	local iOtomoPlayer = -1;
	local iIkkoIkkiPlayer = -1;
	local pBungoCity = nil;
	local pEchigoCity = nil;
	local pEchizenCity = nil;

	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[iPlayer];
		if (pPlayer:IsAlive()) then
			local civType = pPlayer:GetCivilizationType();
			local pCapital = pPlayer:GetCapitalCity();
			if (pCapital == nil) then
				print ("Initial religion setup error");
			elseif (civType == GameInfo.Civilizations["CIVILIZATION_OTOMO"].ID) then
				iOtomoPlayer = iPlayer;
				pBungoCity = pCapital;
			elseif (civType == GameInfo.Civilizations["CIVILIZATION_UESUGI"].ID) then
				iUesugiPlayer = iPlayer;
				pEchigoCity = pCapital;
			elseif (civType == GameInfo.Civilizations["CIVILIZATION_MONGOL"].ID) then
				iIkkoIkkiPlayer = iPlayer;
				pEchizenCity = pCapital;
			end
		end
	end
	
	if (pBungoCity == nil) then
		print("Didn't find Bungo correctly - aborting");
		return;
	end
	
	if (pEchigoCity == nil) then
		print("Didn't find Echigo correctly - aborting");
		return;
	end
	
	if (pEchizenCity == nil) then
		print("Didn't find Echizen correctly - aborting");
	end
	
	if (iOtomoPlayer == -1) then
		print("Didn't find Otomo correctly - aborting");
		return;
	end
	
	if (iUesugiPlayer == -1) then
		print("Didn't find Bungo correctly - aborting");
		return;
	end
	
	if (iIkkoIkkiPlayer = -1) then
		print("Didn't find Ikko Ikki correctly - aborting");
	end

	-- First pass to set religions
	eReligion = GameInfoTypes["RELIGION_CHRISTIANITY"];
	eBelief1 = GameInfoTypes["BELIEF_WORLD_CHURCH"];
	eBelief2 = GameInfoTypes["BELIEF_CATHEDRALS"];
	eBelief3 = GameInfoTypes["BELIEF_CHRISTIAN_WARRIORS"];
	Game.FoundPantheon(iOtomoPlayer, eBelief1);
	Game.FoundReligion(iOtomoPlayer, eReligion, nil, eBelief2, eBelief3, -1, -1, pBungoCity);
	--Game.EnhanceReligion(iOtomoPlayer, eReligion, eBelief4, eBelief5);
	pBungoCity:AdoptReligionFully(eReligion);
	
	eReligion = GameInfoTypes["RELIGION_SHINTO"];
	eBelief1 = GameInfoTypes["BELIEF_CEREMONIAL_BURIAL"];
	eBelief2 = GameInfoTypes["BELIEF_PAGODAS"];
	eBelief3 = GameInfoTypes["BELIEF_HOLY_WARRIORS"];
	Game.FoundPantheon(iUesugiPlayer, eBelief1);
	Game.FoundReligion(iUesugiPlayer, eReligion, nil, eBelief2, eBelief3, -1, -1, pEchigoCity);
	--Game.EnhanceReligion(iMeccaPlayer, eReligion, eBelief4, eBelief5);
	pBungoCity:AdoptReligionFully(eReligion);
	
	eReligion = GameInfoTypes["RELIGION_BUDDHISM"];
	eBelief1 = GameInfoTypes["BELIEF_CEREMONIAL_BURIAL"];
	eBelief2 = GameInfoTypes["BELIEF_PAGODAS"];
	eBelief3 = GameInfoTypes["BELIEF_HOLY_WARRIORS"];
	Game.FoundPantheon(iIkkoIkkiPlayer, eBelief1);
	Game.FoundReligion(iIkkoIkkiPlayer, eReligion, nil, eBelief2, eBelief3, -1, -1, pEchigoCity);
	--Game.EnhanceReligion(iMeccaPlayer, eReligion, eBelief4, eBelief5);
	pEchizenCity:AdoptReligionFully(eReligion);
end

---------------------------------------------------------------------
-- INITIAL INITIALIZATION
---------------------------------------------------------------------

local savedData = Modding.OpenSaveData();
local iValue = savedData.GetValue("ScenarioInitialized");

if (iValue == nil) then

	print ("In Initial Initialization");
	savedData.SetValue("ScenarioInitialized", 1);
	
	SetInitialCityBuilds();
	SetInitialReligions();
	
	-- For final score on victory screen not to be crazy inflated
	Game.SetEstimateEndTurn(100);
	
	-- Game Options (some also set in WorldBuilder)
	Game.SetOption("GAMEOPTION_NO_LEAGUES", true);
	
end