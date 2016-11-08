Player Functionality: User must supply Username, Password and Region information prior to any actions below
Can Report other Players
	INSERT into Report_A_Player
	VALUES(reportID, reporteeID, reporteeRegion, reportedID, reportedRegion, reportedTimeDayMonthYear, offendingAction);


Player can look back on the Reports they filed
	SELECT reportID, reportedID, reportedRegion, time, offendingAction
	FROM Report_A_Player
		WHERE reporterID= INPUT1 AND reporterRegion = INPUT2;


FIX
Can purchase Champions with fixed IP or RP
		INSERT into Player_Purchase_Champion
		VALUES(playerID, playerRegion, championID, cost);
		
		UPDATE Player
		SET ipPoints = ipPoints - cost


Can purchase Items with fixed IP or RP
	INSERT into Player_Purchase_Champion
	VALUES(playerID, playerRegion, championID, cost);
	
		UPDATE Player
SET ipPoints = ipPoints - cost


Can upgrade Items with fixed IP or RP
	INSERT into Purchase_And_Upgrade
		VALUES(
Can level up Champions with active ability of specific Items
	
Can equip Items to Champions
	SELECT COUNT(*)
	FROM Player_Purchase_Champion
	WHERE player_id = INPUT1 AND player_region = INPUT2 AND champion_id = INPUT3

	If the count > 0
	
	INSERT into Champion_Wield_Item
VALUES (champion_id, item_id, player_id);

	Else throw an error (“Player doesn’t own champion”)
	
	
Can query information on Champion Skills given that they owe the Champion
	SELECT s.Type, s.Description, s.Effect
	FROM Player_Purchase_Champion pc, Champion_Skills1 s
	WHERE pc.player_id = INPUT1 AND player_region = INPUT2 AND champion_id = INPUT3 AND s.championID = INPUT3

Can query information on Champion Stats given that they owe the Champion
SELECT s.Type, s.baseValue, s.growthPerLevel
	FROM Player_Purchase_Champion pc, Champion_Stats1 s
	WHERE pc.player_id = INPUT1 AND player_region = INPUT2 AND champion_id = INPUT3 AND s.championID = INPUT3


Player Query Access:
For a given Player find Champions such that all Skills is at maximum level
Find all Items that this Player can currently upgrade with upgrade point balance


Game Moderators Functionality: User must supply Username, Password and Region information prior to any actions below
Can look at all reports made by all players and modify account status
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


Report_A_Player(report_id, reportee_pid, reportee_region, reported_pid, reported_region, time, offending_action)