/********* PROJECTION AND SELECTION *********/

--  /*** Can query information on Champion Skills given that they owe the Champion ***/

	SELECT s.Type, s.Description, s.Effect
	FROM Player_Purchase_Champion pc, Champion_Skills1 s
	WHERE pc.player_id = INPUT1 AND player_region = INPUT2 AND champion_id = INPUT3 AND s.championID = INPUT3

--  /*** Player can look back on the Reports they filed ***/

	SELECT reportID, reportedID, reportedRegion, time, offendingAction
	FROM Report_A_Player
	WHERE reporterID = INPUT1 AND reporterRegion = INPUT2;


/********* JOINING TWO TABLES *********/

/*** Find the player name, player region, account status, and division of all players who purchased
     a certain champion ***/

SELECT p.Username, p.Region, p.accountStatus, p.division
FROM Player p
JOIN Player_Purchase_Champion c
ON p.Username = c.playerID AND p.Region = c.playerRegion AND c.championID = INPUT1 


/********* DIVISION *********/

/*** Find the player who has been reported by all other players ***/

SELECT *
FROM Player p
WHERE NOT EXISTS(
	SELECT p1.Username, p1.Region
	FROM Player p1
	MINUS
	SELECT r.reporterID, r.reporterRegion
	FROM Report_A_Player r
	WHERE r.reporteeID = p.Username AND r.reporteeRegion = p.Region)


/********* AGGREGATE FUNCTIONS *********/

/*** Find the players who have purchased the most champions ***/

SELECT p.Username, p.Region, COUNT(*) 
FROM Player p, Player_Purchase_Champion c
WHERE p.Username = INPUT1, c.playerID = INPUT1, p.Region = INPUT2, c.playerRegion = INPUT2
GROUP BY p.Username, p.Region
HAVING COUNT(*) =
	(SELECT MAX(c) FROM
		(SELECT COUNT(*) AS c
			FROM Player p, Player_Purchase_Champion c
			WHERE p.Username = INPUT1, c.playerID = INPUT1, p.Region = INPUT2, c.playerRegion = INPUT2
			GROUP BY p.Username, p.Region))


/*** Find the average amount of times a player has been reported ***/

SELECT AVG(times_reported)
FROM Player








/********* OTHER FUNCTIONALITY *********/


--  /**** Can Report other Players ****/

	INSERT into Report_A_Player
	VALUES(reportID, reporteeID, reporteeRegion, reportedID, reportedRegion, reportedTimeDayMonthYear, offendingAction);


--  /**** Can purchase Champions with fixed IP or RP ****/
		
		-- Step 1: Check if player has enough currency to make the purchase

		SELECT ipPoints 
		FROM Player
		WHERE Username = INPUT1 AND Region = INPUT2

		/* OR

		SELECT rpPoints 
		FROM Player
		WHERE Username = INPUT1 AND Region = INPUT2
		
		*/

		-- If Player doesnt have enough ipPoints/rpPoints to purchase, cancel query, throw error


		-- Step 2: Log the purchase in the table

		INSERT into Player_Purchase_Champion
		VALUES(playerID, playerRegion, championID, cost, purchasedWith);
		
		-- Depending on whether purchasedWith was with rp or ip 

		UPDATE Player
		SET ipPoints = ipPoints - cost
		WHERE Username = playerID AND Region = playerRegion

		/* 
		OR 

		UPDATE Player
		SET riotPoints = riotPoints - cost
		WHERE Username = playerID AND Region = playerRegion

		*/

--  /**** Can purchase Items with fixed IP or RP ****/

		-- Step 1: Check if player has enough currency to make the purchase

		SELECT ipPoints 
		FROM Player
		WHERE Username = INPUT1 AND Region = INPUT2

		/* OR

		SELECT rpPoints 
		FROM Player
		WHERE Username = INPUT1 AND Region = INPUT2
		
		*/

		-- If Player doesnt have enough ipPoints/rpPoints to purchase cancel query

		-- Step 2: Log the purchase in the table

		INSERT into Purchase_And_Upgrade
		VALUES(playerID, playerRegion, itemID, Cost, upgradeConversion, purchasedWith);
		
		-- Depending on whether purchasedWith was with rp or ip

		UPDATE Player
		SET ipPoints = ipPoints - cost
		WHERE Username = playerID AND Region = playerRegion

		/* 
		OR 

		UPDATE Player
		SET riotPoints = riotPoints - cost
		WHERE Username = playerID AND Region = playerRegion

		*/

--  /**** Can equip Items to Champions ****/

	SELECT COUNT(*)
	FROM Player_Purchase_Champion
	WHERE player_id = INPUT1 AND player_region = INPUT2 AND champion_id = INPUT3

	-- If the count > 0
	
	INSERT into Champion_Wield_Item
	VALUES (champion_id, item_id, player_id);

	-- Else throw an error (“Player doesn’t own champion”) 
	

--  /**** Can query information on Champion Stats given that they owe the Champion ****/

	SELECT s.Type, s.baseValue, s.growthPerLevel
	FROM Player_Purchase_Champion pc, Champion_Stats1 s
	WHERE pc.player_id = INPUT1 AND player_region = INPUT2 AND champion_id = INPUT3 AND s.championID = INPUT3



/************** GAME MODERATOR FUNCTIONALITY **************/

-- /**** PRE-REQUISITE: CHECK TO SEE IF ACCOUNT IS AN ADMIN ACCOUNT ****/

-- /**** Can look at all reports made by all players ****/

	SELECT *
	FROM Report_A_Player

-- /**** Update player account status ****/

	-- INPUT1 is one of: "Banned, OK, Chat-restricted"
	Update Player
	SET accountStatus = INPUT1
	WHERE Username = INPUT2 AND Region = INPUT3


/* FUNCTIONALITY LEFT TO IMPLEMENT 

-- [HARD] Can level up Champions with active ability of specific Items
-- [HARD] Can upgrade Items with fixed IP or RP 

Player Query Access:
For a given Player find Champions such that all Skills is at maximum level
Find all Items that this Player can currently upgrade with upgrade point balance


Game Moderators Functionality: User must supply Username, and Region information prior to any actions below


Can modify the price of Champions and Items
Can modify skills attributes (ex. duration or damage of skill)
Can modify stats of Champion (ex. Attack Damage growth stats)
Can distribute Items to Players
Can add, modify and delete Champion instances
Can add, modify and delete Item instances
Can add, modify and delete Skills
Can add, modify and delete Stats


Game Moderator Update:
Award IP periodically to Players in the Master Division based on combined Level of all the Players owned Champions 


Game Moderator Query Access:
Generate a list of all Reports that a Player has been involved in a certain time period
List all the Players in a certain Region that has higher Division ranking than a certain Player
Find Champions of a certain type that every Player owns











Player(username, region, password, level, times_reported, riot points, ip points, divison, account status)

Champion(name , level, ip cost, role, passive skill, faction, skill points)

Player_Purchase_Champion(player_id, player_region,  champion_id, cost)

Items(name, cost, upgrade_points, active_ability, type)

Purchase_And_Upgrade(player_id, player_region, item_id, cost, upgrade_conversion)

Item_UpgradeInto_Item(item_id1, item_id2, upgrade_points_required)

**Champion_Wield_Item(champion_id, item_id, owner_id)


Champion_Skills1(champion_id, type, description, level, effect)
Champion_Skills2(champion_id, Level, damage, duration, cooldown)

Champion_Stats1(champion_id, type, base_value, champion_level, growth_per_level)
Champion_Stats2(champion_id, champion_level, growth_per_level, current_value)


Report_A_Player(report_id, reportee_pid, reportee_region, reported_pid, reported_region, time, offending_action) */