drop table Player_Purchase_Champion;
drop table Player;
drop table Champion;
drop table Item;
drop table Purchase_And_Upgrade;
drop table Item_upgradeInto_Item;
drop table Champion_Wield_Item;
drop table Champion_Skills1;
drop table Champion_Skills2;
drop table Champion_Stats1;
drop table Champion_Stats2;
drop table Report_A_Player;

CREATE TABLE Player(
	Username varchar(15),
	Region varchar(10),
	Password varchar(15),
	playerLevel INTEGER,
	timesReported INTEGER,
	riotPoints INTEGER,
	ipPoints INTEGER,
	Division varchar(10),
	accountStatus varchar(10),
	PRIMARY KEY(Username, Region)
	);

ALTER TABLE Player
ADD CHECK (playerLevel > 0)

grant select on Player to public;


CREATE TABLE Champion(
	Name varchar(30),
	championLevel INTEGER,
	ipCost INTEGER,
	Role varchar(10),
	passiveSkill varchar(50),
	Faction varchar(30),
	skillPoints INTEGER,
	PRIMARY KEY (Name));

grant select on Champion to public;

CREATE TABLE Player_Purchase_Champion(
	playerID varchar(15),
	playerRegion varchar(10),
	championID varchar(30),
	Cost INTEGER,
	purchasedWith varchar(2),
	PRIMARY KEY(playerID, playerRegion, championID),
	FOREIGN KEY (playerID, playerRegion) REFERENCES Player(Username, Region),
	FOREIGN KEY (championID) REFERENCES Champion(Name);

grant select on Player_Purchase_Champion to public;


CREATE TABLE Item(
	Name varchar(30),
	Cost INTEGER,
	upgradePoints INTEGER,
	activeAbility varchar(50),
	Type varchar(15),
	PRIMARY KEY(Name));

grant select on Item to public;

CREATE TABLE Purchase_And_Upgrade(
	playerID varchar(15),
	playerRegion varchar(10),
	itemID varchar(30),
	Cost INTEGER,
	upgradeConversion INTEGER,
	purchasedWith varchar(2),
	PRIMARY KEY(playerID, playerRegion, itemID),
	FOREIGN KEY (playerID, playerRegion) REFERENCES Player(Username, Region),
	FOREIGN KEY (itemID) REFERENCES Item(Name));

grant select on Purchase_And_Upgrade to public;

CREATE TABLE Item_upgradeInto_Item(
	itemID1 varchar(30),
	itemID2 varchar(30),
	upgradePointsRequired INTEGER,
	PRIMARY KEY(itemID1, itemID2),
	FOREIGN KEY (itemID1) REFERENCES Item,
	FOREIGN KEY (itemID2) REFERENCES Item);

grant select on Item_upgradeInto_Item to public;

CREATE TABLE Champion_Wield_Item(
	championID varchar(15),
	itemID varchar(30),
	PRIMARY KEY(championID, itemID),
	FOREIGN KEY (championID) REFERENCES Champion(Name),
	FOREIGN KEY (itemID) REFERENCES Item(Name))
	ON DELETE CASCADE;

grant select on Champion_Wield_Item to public;

CREATE TABLE Champion_Skills1(
	championID varchar(30),
	Type varchar(15),
	Description varchar(200),
	skillLevel INTEGER,
	Effect varchar(200),
	PRIMARY KEY(championID, Type),
	FOREIGN KEY (championID) REFERENCES Champion(Name));

grant select on Champion_Skills1 to public;

CREATE TABLE Champion_Skills2(
	championID varchar(30),
	skillLevel INTEGER,
	Damage INTEGER,
	Duration INTEGER,
	Cooldown INTEGER,
	PRIMARY KEY(championID, skillLevel),
	FOREIGN KEY(championID) REFERENCES Champion(Name));

grant select on Champion_Skills2 to public;

CREATE TABLE Champion_Stats1(
	championID varchar(30),
	Type varchar(15),
	baseValue INTEGER,
	championLevel INTEGER,
	growthPerLevel INTEGER,
	PRIMARY KEY(championID, Type),
	FOREIGN KEY (championID) REFERENCES Champion(Name));

grant select on Champion_Stats1 to public;

CREATE TABLE Champion_Stats2(
	championID varchar(30),
	champLevel INTEGER,
	growthPerLevel INTEGER,
	currentValue INTEGER,
	PRIMARY KEY(championID, champLevel, growthPerLevel),
	FOREIGN KEY (championID) REFERENCES Champion(Name));

grant select on Champion_Stats2 to public;	

CREATE TABLE Report_A_Player(
	reportID varchar(20),
	reporteeID varchar(15) not null,
	reporteeRegion varchar(10) not null,
	reportedID varchar(15) not null,
	reportedRegion varchar(10) not null,
	PRIMARY KEY(reportID),
	FOREIGN KEY (reporteeID, reporteeRegion) REFERENCES Player(Username, Region),
	FOREIGN KEY (reportedID, reportedRegion) REFERENCES Player(Username, Region));

grant select on Report_A_Player to public;	

insert into Player
values('LemonNation', 'NA', '123',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Hai', 'NA', '234',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Balls', 'NA', '345',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('SneakyGASM', 'NA', '456',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Meateos', 'NA', '567',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('mid fekar', 'NA', '321',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Hide on Bush', 'KR', '321',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('DoubleLift', 'NA', '678',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Bjergsen', 'NA', '789',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Aphromoo', 'NA', '890',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('BunnyFuFuu', 'NA', '098',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Froggen', 'NA', '987',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Hauntzer', 'NA', '876',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Huni', 'NA', '765',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Impact', 'NA', '654',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Jensen', 'NA', '543',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Rush', 'KR', '432',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Bang', 'KR', '321',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('PraY', 'KR', '320',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Smeb', 'KR', '420',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Crown', 'KR', '103',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Ssumday', 'KR', '842',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Champion
values('Annie', '1', '450', 'Mage', 'Pyromania', 'The Grey Order', '1');

insert into Champion
values('Garen', '1', '450', 'Fighter', 'Perseverance', 'Demacia', '1');

insert into Champion
values('Ryze', '1', '450', 'Mage', 'Arcane Mastery', 'Independent', '1');

insert into Champion
values('Poppy', '1', '450', 'Tank', 'Iron Ambassador', 'Demacia', '1');

insert into Champion
values('Ashe', '1', '450', 'Marksman', 'Frost Shot', 'Freljord', '1');

insert into Champion
values('Kayle', '1', '450', 'Fighter', 'Holy Fervor', 'Demacia', '1');

insert into Champion
values('Nunu', '1', '450', 'Controller', 'Visionary', 'Freljord', '1');

insert into Champion
values('Master Yi', '1', '450', 'Slayer', 'Double Strike', 'Ionia', '1');

insert into Champion
values('Soraka', '1', '450', 'Controller', 'Salvation', 'Independent', '1');

insert into Champion
values('Teemo', '1', '1350', 'Marksman', 'Camouflage', 'Bandle City', '1');

insert into Champion
values('Ahri', '1', '4800', 'Mage', 'Essence Theft', 'Independent', '1');

insert into Champion
values('Blitzcrank', '1', '3150', 'Tank', 'Mana Barrier', 'Zaun', '1');

insert into Champion
values('Ezreal', '1', '4800', 'Marksman', 'Rising Spell Force', 'Piltover', '1');

insert into Champion
values('Cassiopeia', '1', '4800', 'Mage', 'Serpentine Grace', 'Noxus', '1');

insert into Champion
values('Bard', '1', '6300', 'Controller', 'Travelers Call', 'Independent', '1');

insert into Champion
values('Hecarim', '1', '4800', 'Fighter', 'Warpath', 'Shadow Isles', '1');

insert into Champion
values('Lucian', '1', '6300', 'Marksman', 'Lightslinger', 'Demacia', '1');

insert into Champion
values('Riven', '1', '4800', 'Fighter', 'Runic Blade', 'Independent', '1');

insert into Champion
values('Thresh', '1', '6300', 'Controller', 'Damnation', 'Shadow Isles', '1');

insert into Champion
values('LeBlanc', '1', '3150', 'Slayer', 'Mirror Image', 'The Black Rose', '1');

insert into Champion
values('Jhin', '1', '6300', 'Marksman', 'Whisper', 'Ionia', '1');

insert into Champion
values('Jinx', '1', '6300', 'Marksman', 'Get Excited!', 'Zaun', '1');

insert into Champion
values('Renekton', '1', '4800', 'Fighter', 'Reign of Anger', 'Independent', '1');

insert into Champion
values('Rengar', '1', '6300', 'Slayer', 'Unseen Predator', 'Independent', '1');

insert into Champion
values('Trundle', '1', '4800', 'Fighter', 'Kings Tribute', 'Freljord', '1');

insert into Champion
values('Viktor', '1', '4800', 'Mage', 'Glorious Evolution', 'Zaun', '1');

insert into Champion
values('Alistar', '1', '1350', 'Tank', 'Trample', 'Independent', '1');

insert into Player_Purchase_Champion
values('Sneaky', 'NA', 'Jhin', '6300');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Cassiopeia', '4800');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Alistar', '1350');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Thresh', '6300');

insert into Item
values('Zeal', '1300', '600', 'null', 'Advanced');

insert into Item
values('Dagger', '300', 'null', 'null', 'Basic');

insert into Item
values('Kircheis Shard', '750', '450', 'null', 'Advanced');

insert into Item
values('Phantom Dancer', '2550', '650', 'null', 'Legendary');

insert into Item
values('Hextech Gunblade', '3400', '850', 'Lightning Bolt', 'Mythical');

insert into Item
values('Hextech Protobelt-01', '2500', '650', 'Fire Bolt', 'Legendary');

insert into Item
values('Banner of Command', '2900', '500', 'Promote', 'Mythical');

insert into Item
values('ZzRot Portal', '2700', '780', 'Void Gate', 'Mythical');

insert into Item
values('Long Sword', '350', 'null', 'null', 'Basic');

insert into Item
values('Tiamat', '1200', '350', 'Crescent', 'Advanced');

insert into Item
values('Corrupting Potion', '500', '350', 'Consume', 'Consumable');

insert into Item
values('Refillable Potion', '150', 'null', 'Consume', 'Consumable');

insert into Item
values('Hunters Potion', '400', '250', 'Consume', 'Consumable');

insert into Item
values('Health Potion', '50', 'null', 'Consume', 'Consumable');

insert into Item
values('Vision Ward', '75', 'null', 'Ward', 'Consumable');

insert into Item
values('Ruby Crystal', '400', 'null', 'null', 'Basic');

insert into Item
values('Sightstone', '800', '400', 'Warding', 'Advanced');

insert into Item
values('Ruby Sightstone', '1600', '400', 'Warding', 'Legendary');

insert into Item
values('Eye of the Equinox', '2200', '550', 'Warding', 'Legendary');

insert into Item
values('Talisman of Ascension', '2500', '450', 'Movement Speed', 'Mythical');

insert into Item
values('Randuins Omen', '2900', '900', 'Slow', 'Legendary');

insert into Item
values('Elixir of Iron', '500', 'null', 'Consume', 'Consumable');

insert into Item
values('Elixir of Sorcery', '500', 'null', 'Consume', 'Consumable');

insert into Purchase_And_Upgrade
values('SneakyGASM', 'NA', 'Sightstone', '800', '400');

insert into Purchase_And_Upgrade
values('DoubleLift', 'NA', 'Phantom Dancer', '2550', '650');

insert into Purchase_And_Upgrade
values('Bjergsen', 'NA', 'Elixir of Sorcery', '500', 'null');

insert into Purchase_And_Upgrade
values('mid fekar', 'NA', 'Randuins Omen', '2900', '900');

insert into Purchase_And_Upgrade
values('BunnyFuFuu', 'NA', 'Talisman of Ascension', '2500', '450');

insert into Item_upgradeInto_Item
values('Ruby Crystal', 'Sightstone', '400');

insert into Item_upgradeInto_Item
values('Refillable Potion', 'Corrupting Potion', '350');

insert into Item_upgradeInto_Item
values('Randuins Omen', 'Ruby Crystal', '2500');

insert into Item_upgradeInto_Item
values('Sightstone', 'Ruby Sightstone', '800');

insert into Item_upgradeInto_Item
values('Sightstone', 'Eye of the Equinox', '1400');

insert into Champion_Wield_Item
values('Jhin', 'Sightstone');

insert into Champion_Wield_Item
values('Alistar', 'Talisman of Ascension');

insert into Champion_Wield_Item
values('Thresh', 'Randuins Omen');

insert into Champion_Wield_Item
values('Annie', 'Hextech Protobelt-01');

insert into Champion_Wield_Item
values('Riven', 'Tiamat');

insert into Champion_Skills1
values('Jhin', 'Active', 
'Launches a canister at the target enemy, dealing physical damage. Dancing Grenade bounces to up to three additional enemies beyond the first, with each kill it performs increasing its total damage by 35%.', 
'1', 'MIN. PHYSICAL DAMAGE: 50 / 75 / 100 / 125 / 150 (+ 30 / 35 / 40 / 45 / 50% AD) (+ 60% AP)');

insert into Champion_Skills1
values('Alistar', 'Passive', 
'Alistar removes all hostile crowd control effects from himself. Additionally, he gains bonus attack damage and takes reduced damage for 7 seconds.', 
'1', 'BONUS ATTACK DAMAGE: 60 / 75 / 90 AD. DAMAGE REDUCTION: 50 / 60 / 70%');

insert into Champion_Skills1
values('Alistar', 'Active', 
'Alistar dashes to the target enemy, dealing magic damage, stunning them for 1 second and knocking them back.', 
'3', 'MAGIC DAMAGE: 55 / 110 / 165 / 220 / 275 (+ 70% AP)');

insert into Champion_Skills1
values('Ahri', 'Active', 'Ahri blows a kiss in a line, dealing magic damage to the first enemy hit and charming them.', 
'5', 'MAGIC DAMAGE: 60 / 95 / 130 / 165 / 200 (+ 50% AP). CHARM DURATION: 1 / 1.25 / 1.5 / 1.75 / 2');

insert into Champion_Skills1
values('Kayle', 'Active', 'Kayle bathes the target allied champion or herself in holy light, rendering them immune to all damage for a few seconds.', 
'3', 'DURATION: 2 / 2.5 / 3');

insert into Champion_Skills2
values('1', '50', 'null', '7');

insert into Champion_Skills2
values('1', '60', '7', '120');

insert into Champion_Skills2
values('3', '165', '1', '12');

insert into Champion_Skills2
values('5', '200', '2', '12');

insert into Champion_Skills2
values('3', 'null', '3', '80');

insert into Champion_Stats1
values('Jhin', 'Attack Damage', '53', '1', '4');

insert into Champion_Stats1
values('Jhin', 'Health', '540', '1', '85');

insert into Champion_Stats1
values('Jhin', 'Mana', '300', '1', '50');

insert into Champion_Stats1
values('Jhin', 'Magic Resist', '30', '1', '0');

insert into Champion_Stats1
values('Jhin', 'Move Speed', '330', '1', '0');

insert into Champion_Stats2
values('1', '4', '53');

insert into Champion_Stats2
values('2', '85', '625');

insert into Champion_Stats2
values('3', '50', '450');

insert into Champion_Stats2
values('4', '0', '30');

insert into Champion_Stats2
values('5', '0', '330');

insert into Report_A_Player
values('001', 'Hide on Bush', 'KR', 'Meateos', 'NA');

insert into Report_A_Player
values('002', 'mid fekar', 'NA', 'SneakyGASM', 'NA');

insert into Report_A_Player
values('003', 'Aphromoo', 'NA', 'DoubleLift', 'NA');

insert into Report_A_Player
values('004', 'Huni', 'KR', 'Rush', 'KR');

insert into Report_A_Player
values('005', 'Jensen', 'NA', 'Impact', 'NA');