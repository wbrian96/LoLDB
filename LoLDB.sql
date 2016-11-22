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
	PRIMARY KEY(playerID, playerRegion, championID),
	FOREIGN KEY (playerID, playerRegion) REFERENCES Player(Username, Region),
	FOREIGN KEY (championID) REFERENCES Champion(Name));

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
	FOREIGN KEY (itemID) REFERENCES Item(Name)
	ON DELETE CASCADE);

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
	reporterID varchar(15) not null,
	reporterRegion varchar(10) not null,
	reportedTimeDayMonthYear INTEGER not null,
	offendingAction varchar(50) not null,
	PRIMARY KEY(reportID),
	FOREIGN KEY (reporteeID, reporteeRegion) REFERENCES Player(Username, Region),
	FOREIGN KEY (reporterID, reporterRegion) REFERENCES Player(Username, Region));

grant select on Report_A_Player to public;

/* Insert new player to prove div query works 

insert into Player
values('haHAA', 'NA', '420',
'30', '0', '900', '100000', 'Challenger', 'OK');

*/	

delete from Player
	where Username = 'haHAA';

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
values('SneakyGASM', 'NA', 'pinsandneedles',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Meateos', 'NA', 'cam shot in 5',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('mid fekar', 'NA', '321',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Hide on Bush', 'KR', '321',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('DoubleLift', 'NA', 'yourealltrash',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Bjergsen', 'NA', '789',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Aphromoo', 'NA', 'supportsoeasy',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('BunnyFuFuu', 'NA', 'hooksfordays',
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
values('Impact', 'NA', 'topdie',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Jensen', 'NA', 'bodythosefools',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Rush', 'KR', 'nocounterplay',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Bang', 'KR', 'sneakydaddy',
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

insert into Player
values('G2 ZV3N', 'EU', '482',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('FNC Rekkles', 'EU', '123456',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('FNC Febiven', 'EU', 'notgrossgore',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Kikis', 'EU', '239058203',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('EDG DEFT', 'KR', 'guunenda',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('clg imaqtpie69', 'NA', 'boosted animals',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Player
values('Nightblue3', 'NA', 'cy@ get out of my jungle',
'30', '0', '900', '100000', 'Challenger', 'OK');

insert into Champion
values('Brand', '1', '4800', 'Mage', 'Blaze', 'Independent', '1');

insert into Champion
values('Braum', '1', '6300', 'Tank', 'Concussive Blows', 'Freljord, Avarosan', '1');

insert into Champion
values('Fiddlesticks', '1', '1350', 'Mage, Controller', 'Dread', 'Independent', '1');

insert into Champion
values('Fiora', '1', '4800', 'Fighter', 'Duelists Dance', 'Demacia, House Laurent', '1');

insert into Champion
values('Kindred', '1', '6300', 'Marksman', 'Mark of the Kindred', 'Independent', '1');

insert into Champion
values('Lee Sin', '1', '4800', 'Fighter', 'Flurry', 'Ionia', '1');

insert into Champion
values('Lulu', '1', '4800', 'Mage', 'Pix, Faerie Companion', 'Independent', '1');

insert into Champion
values('Lux', '1', '3150', 'Mage', 'Illumination', 'Demacia', '1');

insert into Champion
values('Malphite', '1', '1350', 'Fighter', 'Granite Shield', 'Independent', '1');

insert into Champion
values('Maokai', '1', '4800', 'Tank', 'Sap Magic', 'Independent', '1');

insert into Champion
values('Nocturne', '1', '4800', 'Fighter', 'Umbra Blades', 'Independent', '1');

insert into Champion
values('Olaf', '1', '3150', 'Tank', 'Berserker Rage', 'Freljord, Winters Claw', '1');

insert into Champion
values('Orianna', '1', '4800', 'Mage', 'Clockwork Windup', 'Piltover', '1');

insert into Champion
values('Pantheon', '1', '3150', 'Fighter', 'Aegis Protection', 'Mount Targon', '1');

insert into Champion
values('Quinn', '1', '6300', 'Marksman', 'Harrier', 'Demacia', '1');

insert into Champion
values('Yasuo', '1', '6300', 'Fighter', 'Way of the Wanderer', 'Independent', '1');

insert into Champion
values('Zac', '1', '6300', 'Tank', 'Cell Division', 'Zaun', '1');

insert into Champion
values('Zed', '1', '6300', 'Slayer', 'Contempt for the Weak', 'Ionia, The Order of the Shadow', '1');

insert into Champion
values('Ziggs', '1', '4800', 'Mage', 'Short Fuse', 'Bandle City, Piltover', '1');

insert into Champion
values('Zilean', '1', '1350', 'Controller', 'Time in a Bottle', 'Piltover', '1');

insert into Champion
values('Zyra', '1', '4800', 'Mage', 'Garden of Thorns', 'Independent', '1');

insert into Champion
values('Rammus', '1', '1350', 'Tank', 'Spiked Shell', 'Independent', '1');

insert into Champion
values('RekSai', '1', '6300', 'Fighter', 'Fury of the XerSai', 'Independent', '1');

insert into Champion
values('Sejuani', '1', '4800', 'Tank', 'Frost Armor', 'Freljord, Winters Claw', '1');

insert into Champion
values('Shen', '1', '3150', 'Tank', 'Ki Barrier', 'Ionia, Kinkou Order', '1');

insert into Champion
values('Shyvana', '1', '3150', 'Fighter', 'Dragonborn', 'Demacia', '1');

insert into Champion
values('Sion', '1', '1350', 'Tank', 'Glory in Death', 'Noxus', '1');

insert into Champion
values('Sona', '1', '3150', 'Controller, Mage', 'Power Chord', 'Demacia, Ionia', '1');

insert into Champion
values('Swain', '1', '4800', 'Mage, Fighter', 'Carrion Renewal', 'Noxus, The Block Rose', '1');

insert into Champion
values('Syndra', '1', '6300', 'Mage, Controller', 'Transcendent', 'Independent', '1');

insert into Champion
values('Tahm Kench', '1', '6300', 'Controller, Tank', 'An Acquired Taste', 'Independent', '1');

insert into Champion
values('Taliyah', '1', '6300', 'Mage, Controller', 'Rock Surfing', 'Shurima', '1');

insert into Champion
values('Talon', '1', '4800', 'Slayer, Fighter', 'Mercy', 'Noxus', '1');

insert into Champion
values('Taric', '1', '1350', 'Controller, Fighter', 'Bravado', 'Mount Targon, Demacia', '1');

insert into Champion
values('Tryndamere', '1', '1350', 'Fighter, Slayer', 'Battle Fury', 'Freljord, Avarosan, Northern Barbarians', '1');

insert into Champion
values('Twisted Fate', '1', '1350', 'Mage', 'Loaded Dice', 'Independent', '1');

insert into Champion
values('Twitch', '1', '3150', 'Marksman, Slayer', 'Deadly Venom', 'Zaun', '1');

insert into Champion
values('Varus', '1', '6300', 'Marksman, Mage', 'Living Vengeance', 'Independent', '1');

insert into Champion
values('Vayne', '1', '4800', 'Marksman, Slayer', 'Night Hunter', 'Demacia', '1');

insert into Champion
values('Veigar', '1', '1350', 'Mage', 'Phenomenal Evil Power', 'Independent', '1');

insert into Champion
values('VelKoz', '1', '6300', 'Mage', 'Organic Deconstruction', 'The Void', '1');

insert into Champion
values('Vladimir', '1', '4800', 'Mage, Tank', 'Crimson Pact', 'Noxus, The Black Rose', '1');

insert into Champion
values('Warwick', '1', '450', 'Fighter, Tank', 'Eternal Thirst', 'Zaun', '1');

insert into Champion
values('Wukong', '1', '4800', 'Fighter, Tank', 'Stone Skin', 'Ionia', '1');

insert into Champion
values('Xerath', '1', '4800', 'Mage, Slayer', 'Mana Surge', 'Independent', '1');

insert into Champion
values('Xin Zhao', '1', '1350', 'Fighter, Slayer', 'Challenge', 'Demacia', '1');

insert into Champion
values('Nidalee', '1', '3150', 'Slayer, Fighter', 'Prowl', 'Independent', '1');

insert into Champion
values('Nautilus', '1', '4800', 'Tank, Fighter', 'Staggering Blow', 'Independent', '1');

insert into Champion
values('Nasus', '1', '1350', 'Fighter, Tank', 'Soul Eater', 'Shurima', '1');

insert into Champion
values('Nami', '1', '6300', 'Controller, Mage', 'Surging Tides', 'Guardians Sea, The Marai', '1');

insert into Champion
values('Morgana', '1', '1350', 'Mage, Controller', 'Soul Siphon', 'Noxus', '1');

insert into Champion
values('Miss Fortune', '1', '3150', 'Marksman', 'Love Tap', 'Bilgewater', '1');

insert into Champion
values('Leona', '1', '4800', 'Tank, Controller', 'Sunlight', 'Mount Targon, The Solari', '1');

insert into Champion
values('KhaZix', '1', '6300', 'Slayer, Fighter', 'Unseen Threat', 'The Void', '1');

insert into Champion
values('Kassadin', '1', '3150', 'Slayer, Mage', 'Void Stone', 'The Preservers of Valoran', '1');

insert into Champion
values('Kalista', '1', '6300', 'Marksman', 'Martial Poise', 'Shadow Isles', '1');

insert into Champion
values('Jarvan IV', '1', '4800', 'Tank, Fighter', 'Martial Cadence', 'Demacia', '1');

insert into Champion
values('Ivern', '1', '6300', 'Controller, Mage', 'Friend of the Forest', 'Independent', '1');

insert into Champion
values('Illaoi', '1', '6300', 'Fighter, Tank', 'Prophet of an Elder God', 'Bilgewater, Nagakabouros', '1');

insert into Champion
values('Heimerdinger', '1', '3150', 'Mage, Controller', 'Techmaturgical Repair Bots', 'Bandle City, Piltover', '1');

insert into Champion
values('Gragas', '1', '3150', 'Fighter, Mage', 'Happy Hour', 'Avarosan', '1');

insert into Champion
values('Gangplank', '1', '3150', 'Fighter', 'Trial by Fire', 'Bilgewater', '1');

insert into Champion
values('Fizz', '1', '4800', 'Slayer, Fighter', 'Nimble Fighter', 'Bilgewater', '1');

insert into Champion
values('Evelynn', '1', '1350', 'Slayer, Mage', 'Shadow Walk', 'Unknown', '1');

insert into Champion
values('Ekko', '1', '6300', 'Slayer, Fighter', 'Z-Drive Resonance', 'Zaun', '1');

insert into Champion
values('Darius', '1', '4800', 'Fighter, Tank', 'Hemorrhage', 'Noxus', '1');

insert into Champion
values('Draven', '1', '4800', 'Marksman', 'League of Draven', 'Noxus', '1');

insert into Champion
values('Corki', '1', '3150', 'Marksman', 'Hextech Munitions', 'Bandle City, Piltover', '1');

insert into Champion
values('Caitlyn', '1', '4800', 'Marksman', 'Headshot', 'Piltover', '1');

insert into Champion
values('Azir', '1', '6300', 'Mage, Marksman', 'Shurimas Legacy', 'Shurima', '1');

insert into Champion
values('Aurelion Sol', '1', '6300', 'Mage, Fighter', 'Center of the Universe', 'Mount Targon', '1');

insert into Champion
values('Anivia', '1', '3150', 'Mage, Controller', 'Rebirth', 'Freljord, Avarosan', '1');

insert into Champion
values('Aatrox', '1', '6300', 'Fighter, Tank', 'Blood Well', 'Independent', '1');

insert into Champion
values('Akali', '1', '3150', 'Slayer', 'Twin Disciplines', 'Ionia, Kinkou Order', '1');

insert into Champion
values('Annie', '1', '450', 'Mage', 'Pyromania', 'The Grey Order', '1');

insert into Champion
values('Amumu', '1', '450', 'Tank, Mage', 'Cursed Touch', 'Independent', '1');

insert into Champion
values('Garen', '1', '450', 'Fighter, Tank', 'Perseverance', 'Demacia', '1');

insert into Champion
values('Ryze', '1', '450', 'Mage, Fighter', 'Arcane Mastery', 'Independent', '1');

insert into Champion
values('Poppy', '1', '450', 'Tank, Fighter', 'Iron Ambassador', 'Bandle City, Demacia', '1');

insert into Champion
values('Ashe', '1', '450', 'Marksman, Controller', 'Frost Shot', 'Freljord, Avarosan', '1');

insert into Champion
values('Kayle', '1', '450', 'Fighter, Controller', 'Holy Fervor', 'Demacia', '1');

insert into Champion
values('Nunu', '1', '450', 'Controller, Fighter', 'Visionary', 'Freljord, Avarosan', '1');

insert into Champion
values('Master Yi', '1', '450', 'Slayer, Fighter', 'Double Strike', 'Ionia', '1');

insert into Champion
values('Soraka', '1', '450', 'Controller, Mage', 'Salvation', 'Independent', '1');

insert into Champion
values('Teemo', '1', '1350', 'Marksman, Slayer', 'Camouflage', 'Bandle City', '1');

insert into Champion
values('Ahri', '1', '4800', 'Mage, Slayer', 'Essence Theft', 'Independent', '1');

insert into Champion
values('Blitzcrank', '1', '3150', 'Tank, Fighter', 'Mana Barrier', 'Zaun', '1');

insert into Champion
values('Ezreal', '1', '4800', 'Marksman', 'Rising Spell Force', 'Piltover', '1');

insert into Champion
values('Cassiopeia', '1', '4800', 'Mage', 'Serpentine Grace', 'Noxus', '1');

insert into Champion
values('Bard', '1', '6300', 'Controller, Mage', 'Travelers Call', 'Independent', '1');

insert into Champion
values('Hecarim', '1', '4800', 'Fighter, Tank', 'Warpath', 'Shadow Isles', '1');

insert into Champion
values('Lucian', '1', '6300', 'Marksman', 'Lightslinger', 'Demacia', '1');

insert into Champion
values('Riven', '1', '4800', 'Fighter, Slayer', 'Runic Blade', 'Independent', '1');

insert into Champion
values('Thresh', '1', '6300', 'Controller, Fighter', 'Damnation', 'Shadow Isles', '1');

insert into Champion
values('LeBlanc', '1', '3150', 'Slayer, Mage', 'Mirror Image', 'Noxus, The Black Rose', '1');

insert into Champion
values('Jhin', '1', '6300', 'Marksman', 'Whisper', 'Ionia', '1');

insert into Champion
values('Jinx', '1', '6300', 'Marksman', 'Get Excited!', 'Zaun', '1');

insert into Champion
values('Renekton', '1', '4800', 'Fighter, Tank', 'Reign of Anger', 'Independent', '1');

insert into Champion
values('Rengar', '1', '6300', 'Assassin', 'Unseen Predator', 'Independent', '1');

insert into Champion
values('Trundle', '1', '4800', 'Fighter, Tank', 'Kings Tribute', 'Freljord, Frostguard, The Frost Trolls', '1');

insert into Champion
values('Viktor', '1', '4800', 'Mage', 'Glorious Evolution', 'Zaun', '1');

insert into Champion
values('Alistar', '1', '1350', 'Tank', 'Trample', 'Independent', '1');

insert into Champion
values('ChoGath', '1', '1350', 'Tank, Mage', 'Carnivore', 'The Void', '1');

insert into Champion
values('Diana', '1', '6300', 'Fighter, Mage', 'Crescent Strike', 'Mount Targon, Lunari', '1');

insert into Champion
values('Dr. Mundo', '1', '1350', 'Fighter, Tank', 'Adrenaline Rush', 'Zaun, Noxus', '1');

insert into Champion
values('Elise', '1', '6300', 'Mage, Fighter', 'Spider Queen', 'The Black Rose', '1');

insert into Champion
values('Galio', '1', '4800', 'Tank, Mage', 'Runic Skin', 'Demacia', '1');

insert into Champion
values('Gnar', '1', '6300', 'Fighter, Tank', 'Rage Gene', 'Independent', '1');

insert into Champion
values('Graves', '1', '4800', 'Marksman', 'New Destiny', 'Independent', '1');

insert into Champion
values('Irelia', '1', '4800', 'Fighter, Slayer', 'Ionian Fervor', 'Ionia', '1');

insert into Champion
values('Janna', '1', '1350', 'Controller, Mage', 'Tailwind', 'Independent', '1');

insert into Champion
values('Jax', '1', '1350', 'Fighter, Slayer', 'Relentless Assult', 'Independent', '1');

insert into Champion
values('Jayce', '1', '4800', 'Fighter, Marksman', 'Hextech Capacitor', 'Piltover', '1');

insert into Champion
values('Karma', '1', '3150', 'Mage, Controller', 'Gathering Fire', 'Ionia', '1');

insert into Champion
values('Karthus', '1', '3150', 'Mage', 'Death Defied', 'Shadow Isles', '1');

insert into Champion
values('Katarina', '1', '3150', 'Slayer, Mage', 'Voracity', 'Noxus', '1');

insert into Champion
values('Kennen', '1', '4800', 'Mage, Marksman', 'Mark of the Storm', 'Ionia, Bandle City, Kinkou Order', '1');

insert into Champion
values('Kled', '1', '6300', 'Fighter, Tank', 'Skaarl the Cowardly Lizard', 'Noxus', '1');

insert into Champion
values('KogMaw', '1', '4800', 'Marksman', 'Icathian Surprise', 'The Void', '1');

insert into Champion
values('Lissandra', '1', '6300', 'Mage', 'Iceborn', 'Freljord, Frostguard', '1');

insert into Champion
values('Malzahar', '1', '4800', 'Mage, Slayer', 'Void Shift', 'The Void', '1');

insert into Champion
values('Mordekaiser', '1', '3150', 'Fighter', 'Iron Man', 'Shadow Isles', '1');

insert into Champion
values('Rumble', '1', '4800', 'Fighter, Mage', 'Junkyard Titan', 'Bandle City', '1');

insert into Champion
values('Shaco', '1', '3150', 'Slayer', 'Backstab', 'Independent', '1');

insert into Champion
values('Singed', '1', '450', 'Tank, Fighter', 'Empowered Bulwark', 'Zaun', '1');

insert into Champion
values('Sivir', '1', '450', 'Marksman', 'Fleet of Foot', 'Shurima', '1');

insert into Champion
values('Skarner', '1', '4800', 'Fighter, Tank', 'Crystal Spires', 'The Brackern, Shurima', '1');

insert into Champion
values('Sona', '1', '3150', 'Controller, Mage', 'Power Chord', 'Demacia, Ionia', '1');

insert into Champion
values('Tristana', '1', '1350', 'Marksman, Slayer', 'Draw a Bead', 'Bandle City', '1');

insert into Champion
values('Udyr', '1', '1350', 'Fighter, Tank', 'Monkeys Agility', 'Freljord, Winters Claw, Ionia', '1');

insert into Champion
values('Urgot', '1', '3150', 'Marksman, Fighter', 'Zaun-Touched Bolt Augmenter', 'Noxus, Zaun', '1');

insert into Champion
values('Vi', '1', '6300', 'Fighter, Slayer', 'Blast Shield', 'Piltover', '1');

insert into Champion
values('Volibear', '1', '4800', 'Fighter, Tank', 'Chosen of the Storm', 'Freljord, Winters Claw, The Ursine', '1');

insert into Champion
values('Yorick', '1', '4800', 'Fighter, Tank', 'Shepherd of Souls', 'Shadow Isles', '1');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Jhin', '6300');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Jinx', '6300');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Teemo', '1350');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Varus', '4800');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Miss Fortune', '3150');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Sivir', '450');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Corki', '3150');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Ashe', '450');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Caitlyn', '4800');

insert into Player_Purchase_Champion
values('Bang', 'KR', 'Twitch', '3150');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Jhin', '6300');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Alistar', '1350');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Jinx', '6300');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Teemo', '1350');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Tristana', '1350');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Miss Fortune', '3150');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Sivir', '450');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Corki', '3150');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Ashe', '450');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Caitlyn', '4800');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Twitch', '3150');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Jhin', '6300');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Jinx', '6300');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Tristana', '1350');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Varus', '4800');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Miss Fortune', '3150');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Sivir', '450');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Corki', '3150');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Draven', '4800');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Ashe', '450');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Caitlyn', '4800');

insert into Player_Purchase_Champion
values('EDG DEFT', 'KR', 'Twitch', '3150');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Jinx', '6300');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Tristana', '1350');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Varus', '4800');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Sivir', '450');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Corki', '3150');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Ashe', '450');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Caitlyn', '4800');

insert into Player_Purchase_Champion
values('FNC Rekkles', 'EU', 'Twitch', '3150');

insert into Player_Purchase_Champion
values('G2 ZV3N', 'EU', 'Jhin', '6300');

insert into Player_Purchase_Champion
values('G2 ZV3N', 'EU', 'Sivir', '450');

insert into Player_Purchase_Champion
values('G2 ZV3N', 'EU', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('G2 ZV3N', 'EU', 'Corki', '3150');

insert into Player_Purchase_Champion
values('G2 ZV3N', 'EU', 'Draven', '4800');

insert into Player_Purchase_Champion
values('G2 ZV3N', 'EU', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('G2 ZV3N', 'EU', 'Ashe', '450');

insert into Player_Purchase_Champion
values('G2 ZV3N', 'EU', 'Caitlyn', '4800');

insert into Player_Purchase_Champion
values('G2 ZV3N', 'EU', 'Twitch', '3150');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Jhin', '6300');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Jinx', '6300');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Tristana', '1350');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Sivir', '450');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Corki', '3150');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Draven', '4800');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Ashe', '450');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Caitlyn', '4800');

insert into Player_Purchase_Champion
values('clg imaqtpie69', 'NA', 'Twitch', '3150');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Jhin', '6300');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Jinx', '6300');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Tristana', '1350');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Varus', '4800');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Miss Fortune', '3150');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Sivir', '450');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Corki', '3150');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Ashe', '450');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Caitlyn', '4800');

insert into Player_Purchase_Champion
values('DoubleLift', 'NA', 'Twitch', '3150');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Jhin', '6300');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Alistar', '1350');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Jinx', '6300');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Teemo', '1350');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Tristana', '1350');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Varus', '4800');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Miss Fortune', '3150');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Sivir', '450');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Corki', '3150');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Draven', '4800');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Ashe', '450');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Caitlyn', '4800');

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Twitch', '3150');

/*

insert into Player_Purchase_Champion
values('SneakyGASM', 'NA', 'Zilean', '1350');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Ezreal', '4800');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Jinx', '6300');

insert into Player_Purchase_Champion
values('PraY', 'KR', 'Rengar', '6300');

*/


insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Cassiopeia', '4800');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Zac', '6300');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Zilean', '1350');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Karma', '3150');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Azir', '6300');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Aurelion Sol', '6300');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Ahri', '4800');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Anivia', '3150');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Ryze', '450');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Orianna', '4800');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Twisted Fate', '1350');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Syndra', '6300');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Viktor', '4800');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Xerath', '4800');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'LeBlanc', '3150');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Fizz', '4800');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Talon', '4800');

insert into Player_Purchase_Champion
values('mid fekar', 'NA', 'Zed', '6300');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Cassiopeia', '4800');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Zac', '6300');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Zilean', '1350');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Karma', '3150');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Viktor', '4800');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Xerath', '4800');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'LeBlanc', '3150');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Katarina', '3150');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Fizz', '4800');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Talon', '4800');

insert into Player_Purchase_Champion
values('Hai', 'NA', 'Zed', '6300');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Cassiopeia', '4800');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Zac', '6300');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Zilean', '1350');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Karma', '3150');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Azir', '6300');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Aurelion Sol', '6300');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Ahri', '4800');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Anivia', '3150');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Orianna', '4800');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Twisted Fate', '1350');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Taliyah', '6300');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Syndra', '6300');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Viktor', '4800');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Xerath', '4800');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'LeBlanc', '3150');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Katarina', '3150');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Fizz', '4800');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Talon', '4800');

insert into Player_Purchase_Champion
values('Hide on Bush', 'KR', 'Zed', '6300');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Cassiopeia', '4800');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Zac', '6300');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Zilean', '1350');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Karma', '3150');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Anivia', '3150');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Orianna', '4800');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Twisted Fate', '1350');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Taliyah', '6300');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Syndra', '6300');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Viktor', '4800');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Xerath', '4800');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'LeBlanc', '3150');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Katarina', '3150');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Fizz', '4800');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Talon', '4800');

insert into Player_Purchase_Champion
values('Jensen', 'NA', 'Zed', '6300');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Cassiopeia', '4800');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Zac', '6300');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Zilean', '1350');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Ahri', '4800');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Anivia', '3150');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Orianna', '4800');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Syndra', '6300');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Viktor', '4800');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'Xerath', '4800');

insert into Player_Purchase_Champion
values('Crown', 'KR', 'LeBlanc', '3150');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Cassiopeia', '4800');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Zac', '6300');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Zilean', '1350');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Karma', '3150');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Azir', '6300');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Aurelion Sol', '6300');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Ahri', '4800');

insert into Player_Purchase_Champion
values('FNC Febiven', 'EU', 'Zed', '6300');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Cassiopeia', '4800');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Zac', '6300');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Zilean', '1350');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Aurelion Sol', '6300');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Ahri', '4800');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Anivia', '3150');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Orianna', '4800');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Twisted Fate', '1350');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Taliyah', '6300');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Syndra', '6300');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Viktor', '4800');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Xerath', '4800');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'LeBlanc', '3150');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Katarina', '3150');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Fizz', '4800');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Talon', '4800');

insert into Player_Purchase_Champion
values('Froggen', 'NA', 'Zed', '6300');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Cassiopeia', '4800');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Zac', '6300');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Zilean', '1350');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Karma', '3150');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Azir', '6300');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Aurelion Sol', '6300');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Ahri', '4800');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Anivia', '3150');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Orianna', '4800');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Twisted Fate', '1350');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Taliyah', '6300');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Syndra', '6300');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Viktor', '4800');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Xerath', '4800');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'LeBlanc', '3150');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Katarina', '3150');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Fizz', '4800');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Talon', '4800');

insert into Player_Purchase_Champion
values('Bjergsen', 'NA', 'Zed', '6300');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Leona', '4800');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Blitzcrank', '3150');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Thresh', '6300');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Morgana', '1350');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Karma', '3150');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Taric', '1350');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Tahm Kench', '6300');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Soraka', '450');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Sona', '3150');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Nami', '6300');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Lulu', '4800');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Janna', '1350');

insert into Player_Purchase_Champion
values('LemonNation', 'NA', 'Braum', '6300');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Alistar', '1350');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Leona', '4800');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Blitzcrank', '3150');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Thresh', '6300');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Zyra', '4800');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Morgana', '1350');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Karma', '3150');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Taric', '1350');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Tahm Kench', '6300');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Soraka', '450');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Sona', '3150');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Nami', '6300');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Lulu', '4800');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Janna', '1350');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Ivern', '6300');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Braum', '6300');

insert into Player_Purchase_Champion
values('Aphromoo', 'NA', 'Bard', '6300');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Alistar', '1350');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Zac', '6300');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Leona', '4800');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Blitzcrank', '3150');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Thresh', '6300');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Zyra', '4800');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Morgana', '1350');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Karma', '3150');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Taric', '1350');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Tahm Kench', '6300');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Soraka', '450');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Sona', '3150');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Nami', '6300');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Lulu', '4800');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Janna', '1350');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Ivern', '6300');

insert into Player_Purchase_Champion
values('BunnyFuFuu', 'NA', 'Braum', '6300');

insert into Player_Purchase_Champion
values('BunnyFuFuu' 'NA', 'Bard', '6300');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Zac', '6300');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Gragas', '3150');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Hecarim', '4800');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Lee Sin', '4800');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'RekSai', '6300');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Olaf', '3150');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Vi', '6300');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Elise', '6300');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Kindred', '6300');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Graves', '4800');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'KhaZix', '6300');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Shaco', '3150');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Nidalee', '3150');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Nocturne', '4800');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Jarvan IV', '4800');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Sejuani', '4800');

insert into Player_Purchase_Champion
values('Rush', 'KR', 'Nunu', '450');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Zac', '6300');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Ivern', '6300');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Gragas', '3150');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Hecarim', '4800');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Lee Sin', '4800');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Dr. Mundo', '1350');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'RekSai', '6300');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Skarner', '4800');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Pantheon', '3150');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Olaf', '3150');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Udyr', '1350');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Volibear', '4800');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Warwick', '450');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Vi', '6300');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Xin Zhao', '1350');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Elise', '6300');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Kindred', '6300');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Graves', '4800');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'KhaZix', '6300');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Shaco', '3150');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Nidalee', '3150');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Nocturne', '4800');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Jarvan IV', '4800');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Sejuani', '4800');

insert into Player_Purchase_Champion
values('Meateos', 'NA', 'Nunu', '450');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Zac', '6300');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Ivern', '6300');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Gragas', '3150');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Hecarim', '4800');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Lee Sin', '4800');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Dr. Mundo', '1350');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'RekSai', '6300');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'KogMaw', '4800');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Pantheon', '3150');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Olaf', '3150');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Udyr', '1350');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Volibear', '4800');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Master Yi', '450');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Vi', '6300');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Evelynn', '1350');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Elise', '6300');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Kindred', '6300');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Graves', '4800');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'KhaZix', '6300');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Shaco', '3150');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Nidalee', '3150');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Nocturne', '4800');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Fizz', '4800');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Sejuani', '4800');

insert into Player_Purchase_Champion
values('Nightblue3', 'NA', 'Amumu', '450');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Tahm Kench', '6300');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Gragas', '3150');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Irelia', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Illaoi', '6300');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Jax', '1350');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Aatrox', '6300');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Darius', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Gnar', '6300');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Garen', '450');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Gangplank', '3150');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Fiora', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Dr. Mundo', '1350');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Renekton', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Nasus', '1350');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Pantheon', '3150');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Tryndamere', '1350');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Trundle', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Yorick', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Xin Zhao', '1350');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Heimerdinger', '3150');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Swain', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Vladimir', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Teemo', '1350');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Kassadin', '3150');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Ekko', '6300');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Malphite', '1350');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Jarvan IV', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Shen', '3150');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Singed', '450');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Rammus', '1350');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Nautilus', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Maokai', '4800');

insert into Player_Purchase_Champion
values('Kikis', 'EU', 'Poppy', '450');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Tahm Kench', '6300');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Gragas', '3150');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Jayce', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Kled', '6300');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Aatrox', '6300');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Darius', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Gnar', '6300');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Garen', '450');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Gangplank', '3150');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Fiora', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Dr. Mundo', '1350');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Riven', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Rumble', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Renekton', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Nasus', '1350');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Pantheon', '3150');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Tryndamere', '1350');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Trundle', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Kennen', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Heimerdinger', '3150');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Swain', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Vladimir', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Graves', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Teemo', '1350');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Kassadin', '3150');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Ekko', '6300');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Singed', '450');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Rammus', '1350');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Nautilus', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Maokai', '4800');

insert into Player_Purchase_Champion
values('Ssumday', 'KR', 'Poppy', '450');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Tahm Kench', '6300');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Irelia', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Illaoi', '6300');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Jax', '1350');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Jayce', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Darius', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Gnar', '6300');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Gangplank', '3150');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Fiora', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Riven', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Rumble', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Pantheon', '3150');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Tryndamere', '1350');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Trundle', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Kennen', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Swain', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Vladimir', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Ekko', '6300');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Malphite', '1350');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Jarvan IV', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Shen', '3150');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Rammus', '1350');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Nautilus', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Maokai', '4800');

insert into Player_Purchase_Champion
values('Smeb', 'KR', 'Poppy', '450');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Gragas', '3150');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Irelia', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Jayce', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Kled', '6300');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Aatrox', '6300');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Gnar', '6300');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Garen', '450');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Gangplank', '3150');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Fiora', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Dr. Mundo', '1350');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Riven', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Rumble', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Renekton', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Nasus', '1350');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Pantheon', '3150');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Trundle', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Yorick', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Xin Zhao', '1350');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Kennen', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Heimerdinger', '3150');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Swain', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Vladimir', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Graves', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Teemo', '1350');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Kassadin', '3150');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Ekko', '6300');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Malphite', '1350');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Jarvan IV', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'ChoGath', '1350');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Sion', '1350');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Shen', '3150');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Singed', '450');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Rammus', '1350');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Maokai', '4800');

insert into Player_Purchase_Champion
values('Huni', 'NA', 'Poppy', '450');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Tahm Kench', '6300');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Irelia', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Illaoi', '6300');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Jax', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Jayce', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Kled', '6300');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Darius', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Gnar', '6300');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Gangplank', '3150');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Fiora', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Dr. Mundo', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Riven', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Rumble', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Nasus', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Pantheon', '3150');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Tryndamere', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Trundle', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Yorick', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Xin Zhao', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Kennen', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Heimerdinger', '3150');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Swain', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Teemo', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Ekko', '6300');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Malphite', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Jarvan IV', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'ChoGath', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Sion', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Shen', '3150');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Singed', '450');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Rammus', '1350');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Nautilus', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Maokai', '4800');

insert into Player_Purchase_Champion
values('Hauntzer', 'NA', 'Poppy', '450');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Graves', '4800');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Vayne', '4800');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Teemo', '1350');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Kassadin', '3150');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Ekko', '6300');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Malphite', '1350');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Jarvan IV', '4800');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'ChoGath', '1350');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Sion', '1350');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Shen', '3150');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Singed', '450');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Rammus', '1350');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Maokai', '4800');

insert into Player_Purchase_Champion
values('Balls', 'NA', 'Poppy', '450');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Gragas', '3150');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Irelia', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Illaoi', '6300');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Jax', '1350');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Jayce', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Aatrox', '6300');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Darius', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Gnar', '6300');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Garen', '450');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Gangplank', '3150');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Fiora', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Riven', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Rumble', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Renekton', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Pantheon', '3150');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Tryndamere', '1350');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Trundle', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Yasuo', '6300');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Yorick', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Xin Zhao', '1350');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Lissandra', '6300');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Kennen', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Ryze', '450');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Swain', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Vladimir', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Lucian', '6300');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Quinn', '6300');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Urgot', '3150');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Kassadin', '3150');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Ekko', '6300');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Rengar', '6300');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Malphite', '1350');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Jarvan IV', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Sion', '1350');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Shen', '3150');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Nautilus', '4800');

insert into Player_Purchase_Champion
values('Impact', 'NA', 'Poppy', '450');

insert into Item
values('Dagger', '300', 'null', 'null', 'Basic');

insert into Item
values('Amplifying Tome', '435', 'null', 'null', 'Basic');

insert into Item
values('B.F.Sword', '1300', 'null', 'null', 'Basic');

insert into Item
values('Blasting Wand', '850', 'null', 'null', 'Basic');

insert into Item
values('Boots of Speed', '300', 'null', 'null', 'Basic');

insert into Item
values('Brawlers Gloves', '400', 'null', 'null', 'Basic');

insert into Item
values('Cloak of Agility', '800', 'null', 'null', 'Basic');

insert into Item
values('Cloth Armor', '300', 'null', 'null', 'Basic');

insert into Item
values('Faerie Charm', '125', 'null', 'null', 'Basic');

insert into Item
values('Needlessly Large Rod', '1250', 'null', 'null', 'Basic');

insert into Item
values('Null-Magic Mantle', '450', 'null', 'null', 'Basic');

insert into Item
values('Pickaxe', '875', 'null', 'null', 'Basic');

insert into Item
values('Prototype Hex Core', '0', 'null', 'null', 'Basic');

insert into Item
values('Rejuvenation Bead', '150', 'null', 'null', 'Basic');

insert into Item
values('Sapphire Crystal', '350', 'null', 'null', 'Basic');

insert into Item
values('The Dark Seal', '350', 'null', 'null', 'Basic');

insert into Item
values('Ancient Coin', '350', 'null', 'null', 'Basic');

insert into Item
values('Relic Shield', '350', 'null', 'null', 'Basic');

insert into Item
values('Spellthiefs Edge', '350', 'null', 'null', 'Basic');

insert into Item
values('Hunters Machete', '350', 'null', 'null', 'Basic');

insert into Item
values('Hunters Talisman', '350', 'null', 'null', 'Basic');

insert into Item
values('Cull', '450', 'null', 'null', 'Basic');

insert into Item
values('Dorans Blade', '450', 'null', 'null', 'Basic');

insert into Item
values('Dorans Ring', '400', 'null', 'null', 'Basic');

insert into Item
values('Dorans Shield', '450', 'null', 'null', 'Basic');

insert into Item
values('The Black Spear', '0', 'null', 'null', 'Basic');

insert into Item
values('Aether Wisp', '850', '415', 'null', 'Advanced');

insert into Item
values('Bamis Cinder', '1100', '700', 'null', 'Advanced');

insert into Item
values('Catalyst of Aeons', '1100', '350', 'null', 'Advanced');

insert into Item
values('Caulfields Warhammer', '1100', '400', 'null', 'Advanced');

insert into Item
values('Chain Vest', '800', '500', 'null', 'Advanced');

insert into Item
values('Chalice of Harmony', '900', '200', 'null', 'Advanced');

insert into Item
values('Crystalline Bracer', '650', '100', 'null', 'Advanced');

insert into Item
values('Executioners Calling', '800', '450', 'null', 'Advanced');

insert into Item
values('Fiendish Codex', '900', '465', 'null', 'Advanced');

insert into Item
values('Forbidden Idol', '550', '300', 'null', 'Advanced');

insert into Item
values('Giant Slayer', '1000', '650', 'null', 'Advanced');

insert into Item
values('Giants Belt', '1000', '600', 'null', 'Advanced');

insert into Item
values('Glacial Shroud', '1000', '350', 'null', 'Advanced');

insert into Item
values('Haunting Guise', '1600', '765', 'null', 'Advanced');

insert into Item
values('Hexdrinker', '1300', '500', 'null', 'Advanced');

insert into Item
values('Hextech Revolver', '1200', '330', 'null', 'Advanced');

insert into Item
values('Jaurims Fist', '1200', '450', 'null', 'Advanced');

insert into Item
values('Kindlegem', '800', '400', 'null', 'Advanced');

insert into Item
values('Last Whisper', '1300', '425', 'null', 'Advanced');

insert into Item
values('Lost Chapter', '900', '115', 'null', 'Advanced');

insert into Item
values('Negatron Cloak', '720', '270', 'null', 'Advanced');

insert into Item
values('Phage', '1250', '500', 'null', 'Advanced');

insert into Item
values('Quicksilver Sash', '1300', '850', 'Quicksilver', 'Advanced');

insert into Item
values('Recurve Bow', '1000', '400', 'null', 'Advanced');

insert into Item
values('Seekers Armguard', '1200', '165', 'null', 'Advanced');

insert into Item
values('Serrated Dirk', '1100', '400', 'null', 'Advanced');

insert into Item
values('Sheen', '1050', '700', 'null', 'Advanced');

insert into Item
values('Spectres Cowl', '1200', '350', 'null', 'Advanced');

insert into Item
values('Stinger', '1100', '500', 'null', 'Advanced');

insert into Item
values('Tear of the Goddess', '750', '275', 'null', 'Advanced');

insert into Item
values('The Hex Core mk-1', '1000', '1000', 'null', 'Advanced');

insert into Item
values('Vampiric Scepter', '900', '550', 'null', 'Advanced');

insert into Item
values('Wardens Mail', '1000', '400', 'null', 'Advanced');

insert into Item
values('Frostfang', '850', '375', 'null', 'Advanced');

insert into Item
values('Nomads Medallion', '850', '225', 'null', 'Advanced');

insert into Item
values('Targons Brace', '850', '350', 'null', 'Advanced');

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
values('DoubleLift', 'NA', 'Recurve Bow', '1000', '2000');

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

insert into Champion_Wield_Item
values('Ahri', 'The Hex Core mk-1');

insert into Champion_Wield_Item
values('Akali', 'Sheen');

insert into Champion_Wield_Item
values('Alistar', 'Wardens Mail');

insert into Champion_Wield_Item
values('Amumu', 'Tear of the Goddess');

insert into Champion_Wield_Item
values('Anivia', 'Tear of the Goddess');

insert into Champion_Wield_Item
values('Ashe', 'Phantom Dancer');

insert into Champion_Wield_Item
values('Aurelion Sol', 'ZzRot Portal');

insert into Champion_Wield_Item
values('Azir', 'Dagger');

insert into Champion_Wield_Item
values('Bard', 'Frostfang');

insert into Champion_Wield_Item
values('Blitzcrank', 'Targons Bracer');

insert into Champion_Wield_Item
values('Brand', 'Haunting Guise');

insert into Champion_Wield_Item
values('Braum', 'Kindlegem');

insert into Champion_Wield_Item
values('Caitlyn', 'Recurve Bow');

insert into Champion_Wield_Item
values('Cassiopeia', 'Tear of the Goddess');

insert into Champion_Wield_Item
values('ChoGath', 'Phage');

insert into Champion_Wield_Item
values('Corki', 'Sheen');

insert into Champion_Wield_Item
values('Darius', 'Tiamat');

insert into Champion_Wield_Item
values('Diana', 'Hextech Revolver');

insert into Champion_Wield_Item
values('Draven', 'Phantom Dancer');

insert into Champion_Wield_Item
values('Ekko', 'Corrupting Potion');

insert into Champion_Wield_Item
values('Elise', 'Refillable Potion');

insert into Champion_Wield_Item
values('Evelynn', 'Hunters Potion');

insert into Champion_Wield_Item
values('Ezreal', 'Hextech Gunblade');

insert into Champion_Wield_Item
values('Fiddlesticks', 'Fiendish Codex');

insert into Champion_Wield_Item
values('Fiora', 'Tiamat');

insert into Champion_Wield_Item
values('Fizz', 'Dorans Ring');

insert into Champion_Wield_Item
values('Galio', 'Dorans Ring');

insert into Champion_Wield_Item
values('Gangplank', 'Dorans Shield');

insert into Champion_Wield_Item
values('Garen', 'Chain Vest');

insert into Champion_Wield_Item
values('Gnar', 'Dorans Blade');

insert into Champion_Wield_Item
values('Gragas', 'Giants Belt');

insert into Champion_Wield_Item
values('Graves', 'Caulfields Warhammer');

insert into Champion_Wield_Item
values('Hecarim', 'Phage');

insert into Champion_Wield_Item
values('Heimerdinger', 'Aether Wisp');

insert into Champion_Wield_Item
values('Illaoi', 'Dorans Blade');

insert into Champion_Wield_Item
values('Irelia', 'Caulfields Warhammer');

insert into Champion_Wield_Item
values('Ivern', 'Forbidden Idol');

insert into Champion_Wield_Item
values('Janna', 'Banner of Command');

insert into Champion_Wield_Item
values('Jax', 'Long Sword');

insert into Champion_Wield_Item
values('Jayce', 'Tear of the Goddess');

insert into Champion_Wield_Item
values('Jhin', 'Long Sword');

insert into Champion_Wield_Item
values('Jinx', 'Zeal');

insert into Champion_Wield_Item
values('Kalista', 'Quicksilver Sash');

insert into Champion_Wield_Item
values('Katarina', 'Negatron Cloak');

insert into Champion_Wield_Item
values('Kayle', 'Stinger');

insert into Champion_Wield_Item
values('Karma', 'Kindlegem');

insert into Champion_Wield_Item
values('Karthus', 'Chalice of Harmony');

insert into Champion_Wield_Item
values('Kassadin', 'Fiendish Codex');

insert into Champion_Wield_Item
values('Kennen', 'Dorans Blade');

insert into Champion_Wield_Item
values('KhaZix', 'Tiamat');

insert into Champion_Wield_Item
values('Kindred', 'Caulfields Warhammer');

insert into Champion_Wield_Item
values('Kled', 'Tiamat');

insert into Champion_Wield_Item
values('LeBlanc', 'Fiendish Codex');

insert into Champion_Wield_Item
values('Alistar', 'Bamis Cinder');

insert into Champion_Wield_Item
values('Ashe', 'Giant Slayer');

insert into Champion_Wield_Item
values('Renekton', 'Tiamat');

insert into Champion_Wield_Item
values('Annie', 'Tiamat');

insert into Champion_Wield_Item
values('Lux', 'Tiamat');

insert into Champion_Wield_Item
values('Quinn', 'Tiamat');

insert into Champion_Wield_Item
values('Lux', 'Tiamat');

insert into Champion_Wield_Item
values('Galio', 'Tiamat');

insert into Champion_Wield_Item
values('Garen', 'Tiamat');

insert into Champion_Wield_Item
values('Malphite', 'Tiamat');

insert into Champion_Wield_Item
values('Malphite', 'Tiamat');

insert into Champion_Wield_Item
values('Master Yi', 'Tiamat');

insert into Champion_Wield_Item
values('Renekton', 'Giants Belt');

insert into Champion_Wield_Item
values('Renekton', 'Chain Vest');

insert into Champion_Wield_Item
values('Lee Sin', 'Tiamat');

insert into Champion_Wield_Item
values('Karthus', 'Aether Wisp');

insert into Champion_Wield_Item
values('Kalista', 'Caulfields Warhammer');

insert into Champion_Wield_Item
values('Twitch', 'Catalyst of Aeons');

insert into Champion_Wield_Item
values('Ashe', 'Chain Vest');

insert into Champion_Wield_Item
values('Lissandra', 'Giant Slayer');

insert into Champion_Wield_Item
values('Maokai', 'Glacial Shroud');

insert into Champion_Wield_Item
values('Nidalee', 'Haunting Guise');

insert into Champion_Wield_Item
values('Nocturne', 'Last Whisper');

insert into Champion_Wield_Item
values('Nasus', 'Lost Chapter');

insert into Champion_Wield_Item
values('Nami', 'Negatron Cloak');

insert into Champion_Wield_Item
values('Sona', 'Hextech Revolver');

insert into Champion_Wield_Item
values('Soraka', 'Forbidden Idol');

insert into Champion_Wield_Item
values('Thresh', 'Quicksilver Sash');

insert into Champion_Wield_Item
values('Syndra', 'Kindlegem');

insert into Champion_Wield_Item
values('Swain', 'Jaurims Fist');

insert into Champion_Wield_Item
values('Sion', 'Jaurims Fist');

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
values('Fiora', '1', '50', '0', '7');

insert into Champion_Skills2
values('Sion', '60', '7', '3', '120');

insert into Champion_Skills2
values('Shyvana', '165', '1', '2', '12');

insert into Champion_Skills2
values('Alistar', '200', '2', '3', '12');

insert into Champion_Skills2
values('Rengar', '200', '50', '3', '12');

insert into Champion_Skills2
values('Sion', 'null', '3', '3', '80');

insert into Champion_Stats1
values('Jhin', 'Attack Damage', '53', '1', '4');

insert into Champion_Stats1
values('Jhin', 'Health', '540', '1', '85');

insert into Champion_Stats1
values('Jhin', 'Mana', '300', '1', '50');

insert into Champion_Stats1
values('Jhin', 'Magic Resist', '30', '1', '0');

insert into Champion_Stats1
values('Annie', 'Move Speed', '423', '1', '346');

insert into Champion_Stats1
values('Ahri', 'Armor', '423', '1', '0');

insert into Champion_Stats1
values('Shaco', 'Move Speed', '54', '1', '65');

insert into Champion_Stats1
values('Kayle', 'Armor', '123', '1', '0');

insert into Champion_Stats1
values('Soraka', 'Health', '645', '1', '0');

insert into Champion_Stats1
values('Blitzcrank', 'Move Speed', '4574', '1', '0');

insert into Champion_Stats1
values('Karthus', 'Move Speed', '235', '1', '5');

insert into Champion_Stats1
values('Ashe', 'Health', '746', '1', '4');

insert into Champion_Stats1
values('Riven', 'Armor', '857', '1', '0');

insert into Champion_Stats1
values('Varus', 'Move Speed', '234', '1', '3');

insert into Champion_Stats1
values('Vayne', 'Health', '794', '1', '0');

insert into Champion_Stats1
values('Fizz', 'Move Speed', '847', '1', '0');

insert into Champion_Stats1
values('Fiora', 'Health', '746', '1', '2');

insert into Champion_Stats1
values('KogMaw', 'Move Speed', '746', '1', '1');

insert into Champion_Stats1
values('Lissandra', 'Health', '969', '1', '1');

insert into Champion_Stats1
values('Zac', 'Armor', '388', '1', '0');

insert into Champion_Stats1
values('Zed', 'Health', '8384', '1', '0');

insert into Champion_Stats1
values('Zilean', 'Armor', '275', '1', '6');

insert into Champion_Stats1
values('Corki', 'Health', '3685', '1', '0');

insert into Champion_Stats1
values('Jinx', 'Move Speed', '584', '1', '65');

insert into Champion_Stats1
values('Jayce', 'Move Speed', '123', '1', '0');

insert into Champion_Stats1
values('Jax', 'Health', '6246', '1', '56');

insert into Champion_Stats1
values('Kled', 'Move Speed', '654', '1', '46');

insert into Champion_Stats1
values('Kindred', 'Health', '724', '1', '9');

insert into Champion_Stats1
values('Lucian', 'Move Speed', '684', '1', '8');

insert into Champion_Stats1
values('Lulu', 'Move Speed', '395', '1', '0');

insert into Champion_Stats1
values('Lux', 'Move Speed', '2436', '1', '7');

insert into Champion_Stats1
values('Malphite', 'Health', '735', '1', '6');

insert into Champion_Stats1
values('Maokai', 'Armor', '7345', '1', '5');

insert into Champion_Stats1
values('Master Yi', 'Move Speed', '735', '1', '4');

insert into Champion_Stats1
values('Aurelion Sol', 'Move Speed', '735', '1', '3');

insert into Champion_Stats1
values('Leona', 'Health', '7365', '1', '0');

insert into Champion_Stats1
values('Rengar', 'Armor', '765', '1', '654');

insert into Champion_Stats1
values('Renekton', 'Health', '3343', '1', '32');

insert into Champion_Stats1
values('Ryze', 'Armor', '123', '1', '0');

insert into Champion_Stats1
values('Skarner', 'Health', '234', '1', '34');

insert into Champion_Stats1
values('Sivir', 'Health', '542', '1', '0');

insert into Champion_Stats1
values('Syndra', 'Move Speed', '134', '1', '0');

insert into Champion_Stats1
values('Swain', 'Move Speed', '525', '1', '5');

insert into Champion_Stats1
values('Tahm Kench', 'Health', '423', '1', '0');

insert into Champion_Stats1
values('Kennen', 'Armor', '524', '1', '0');

insert into Champion_Stats1
values('Taliyah', 'Health', '6346', '1', '0');

insert into Champion_Stats1
values('Twitch', 'Armor', '255', '1', '0');

insert into Champion_Stats1
values('Teemo', 'Health', '413', '1', '45');

insert into Champion_Stats1
values('Taric', 'Move Speed', '423', '1', '0');

insert into Champion_Stats1
values('Thresh', 'Health', '734', '1', '0');

insert into Champion_Stats1
values('Tristana', 'Armor', '43', '1', '65');

insert into Champion_Stats1
values('Trundle', 'Move Speed', '500', '1', '9');

insert into Champion_Stats1
values('Warwick', 'Health', '3000', '1', '5');

insert into Champion_Stats1
values('Urgot', 'Armor', '43', '1', '8');

insert into Champion_Stats1
values('Veigar', 'Health', '134', '1', '7');

insert into Champion_Stats1
values('Volibear', 'Move Speed', '645', '1', '5');

insert into Champion_Stats1
values('Xin Zhao', 'Health', '865', '1', '32');

insert into Champion_Stats1
values('Ziggs', 'Armor', '453', '1', '54');

insert into Champion_Stats1
values('Yorick', 'Move Speed', '134', '1', '43');

insert into Champion_Stats1
values('Twisted Fate', 'Health', '5433', '1', '0');

insert into Champion_Stats1
values('Udyr', 'Armor', '978', '1', '42');

insert into Champion_Stats1
values('Yasuo', 'Health', '987', '1', '0');

insert into Champion_Stats1
values('Zyra', 'Move Speed', '435', '1', '2');

insert into Champion_Stats2
values('Zyra', '12', '65', '345');

insert into Champion_Stats2
values('Yasuo', '13', '35', '450');

insert into Champion_Stats2
values('Udyr', '3', '50', '856');

insert into Champion_Stats2
values('Twisted', '4', '23', '856');

insert into Champion_Stats2
values('Yorick', '5', '22', '978');

insert into Champion_Stats2
values('Ziggs', '6', '67', '345');

insert into Champion_Stats2
values('Wukong', '7', '56', '213');

insert into Champion_Stats2
values('Volibear', '8', '45', '245');

insert into Champion_Stats2
values('Vi', '9', '65', '542');

insert into Champion_Stats2
values('Viktor', '10', '34', '452');

insert into Champion_Stats2
values('Vayne', '11', '24', '635');

insert into Champion_Stats2
values('Varus', '12', '31', '467');

insert into Champion_Stats2
values('Urgot', '13', '42', '857');

insert into Champion_Stats2
values('Alistar', '14', '53', '857');

insert into Champion_Stats2
values('Anivia', '15', '50', '356');

insert into Champion_Stats2
values('Amumu', '16', '53', '957');

insert into Champion_Stats2
values('Annie', '17', '64', '275');

insert into Champion_Stats2
values('Azir', '18', '75', '254');

insert into Champion_Stats2
values('Bard', '1', '86', '477');

insert into Champion_Stats2
values('Brand', '2', '69', '357');

insert into Champion_Stats2
values('Braum', '3', '58', '134');

insert into Champion_Stats2
values('Caitlyn', '4', '47', '674');

insert into Champion_Stats2
values('Cassiopeia', '5', '36', '985');

insert into Champion_Stats2
values('Diana', '6', '25', '154');

insert into Champion_Stats2
values('Darius', '7', '31', '365');

insert into Champion_Stats2
values('Draven', '8', '42', '874');

insert into Champion_Stats2
values('Ezreal', '9', '53', '245');

insert into Champion_Stats2
values('Evelynn', '10', '64', '376');

insert into Champion_Stats2
values('Fiora', '13', '76', '246');

insert into Champion_Stats2
values('Gangplank', '11', '69', '763');

insert into Champion_Stats2
values('Fiddlesticks', '12', '58', '246');

insert into Champion_Stats2
values('Gnar', '3', '47', '634');

insert into Champion_Stats2
values('Graves', '3', '36', '745');

insert into Champion_Stats2
values('Hecarim', '1', '25', '856');

insert into Champion_Stats2
values('Gragas', '2', '14', '245');

insert into Champion_Stats2
values('Galio', '3', '11', '352');

insert into Champion_Stats2
values('Ekko', '2', '22', '765');

insert into Champion_Stats2
values('Corki', '2', '33', '423');

insert into Champion_Stats2
values('ChoGath', '3', '44', '534');

insert into Champion_Stats2
values('Karthus', '5', '55', '756');

insert into Champion_Stats2
values('Illaoi', '5', '66', '867');

insert into Champion_Stats2
values('Heimerdinger', '3', '77', '524');

insert into Champion_Stats2
values('Jax', '7', '89', '245');

insert into Champion_Stats2
values('Jayce', '8', '78', '645');

insert into Champion_Stats2
values('Kalista', '6', '67', '846');

insert into Champion_Stats2
values('Kayle', '5', '56', '234');

insert into Champion_Stats2
values('Katarina', '3', '45', '450');

insert into Champion_Stats2
values('KhaZix', '3', '34', '423');

insert into Champion_Stats2
values('LeBlanc', '3', '23', '653');

insert into Champion_Stats2
values('Kindred', '4', '35', '547');

insert into Champion_Stats2
values('Kled', '5', '98', '444');

insert into Champion_Stats2
values('Ivern', '6', '87', '333');

insert into Champion_Stats2
values('Irelia', '7', '76', '222');

insert into Champion_Stats2
values('Janna', '8', '65', '111');

insert into Champion_Stats2
values('Lee Sin', '3', '24', '555');

insert into Champion_Stats2
values('Lissandra', '3', '54', '666');

insert into Champion_Stats2
values('Lucian', '8', '24', '777');

insert into Champion_Stats2
values('Lux', '9', '54', '888');

insert into Champion_Stats2
values('Malphite', '3', '34', '999');

insert into Champion_Stats2
values('Malzahar', '13', '32', '123');

insert into Champion_Stats2
values('Miss Fortune', '13', '23', '234');

insert into Champion_Stats2
values('Mordekaiser', '15', '54', '345');

insert into Champion_Stats2
values('Morgana', '16', '1', '456');

insert into Champion_Stats2
values('Nami', '17', '43', '567');

insert into Champion_Stats2
values('Nasus', '18', '50', '678');

insert into Champion_Stats2
values('Nautilus', '14', '32', '789');

insert into Champion_Stats2
values('Nidalee', '3', '50', '987');

insert into Champion_Stats2
values('Nocturne', '1', '4', '876');

insert into Champion_Stats2
values('Olaf', '2', '85', '625');

insert into Champion_Stats2
values('Nunu', '3', '50', '450');

insert into Champion_Stats2
values('Poppy', '4', '0', '30');

insert into Champion_Stats2
values('Rammus', '5', '0', '330');

insert into Report_A_Player
values('001', 'Hide on Bush', 'KR', 'Meateos', 'NA' '183707112016', 
'This guy definitely scripting');

insert into Report_A_Player
values('002', 'mid fekar', 'NA', 'SneakyGASM', 'NA' '234011032016', 
'Intentionally troll plays xinzhao mid');

insert into Report_A_Player
values('003', 'Aphromoo', 'NA', 'DoubleLift', 'NA', '000131102015', 
'He kicked me out of clg! Scrub teammate scrub clg');

insert into Report_A_Player
values('004', 'Froggen', 'NA', 'Bjergsen', 'NA', '041004112016', 
'boosted monkey man top laner, no counterplay');

insert into Report_A_Player
values('005', 'Jensen', 'NA', 'Impact', 'NA', '193015102016', 
'Top die but my team mid die');

insert into Report_A_Player
values('006', 'DoubleLift', 'NA', 'LemonNation', 'NA' '133026052016', 
'Flamed me for roaming');

insert into Report_A_Player
values('007', 'DoubleLift', 'NA', 'Hai', 'NA', '183026052016', 
'Took my blue buff');

insert into Report_A_Player
values('008', 'DoubleLift', 'NA', 'Balls', 'NA', '093026052016', 
'Said my rumble is trash..');

insert into Report_A_Player
values('009', 'DoubleLift', 'NA', 'SneakyGASM', 'NA', '093031052016', 
'Didnt meme enough in game');

insert into Report_A_Player
values('010', 'DoubleLift', 'NA', 'Meateos', 'NA', '093005052016', 
'Didnt reach quarterfinals at worlds');

insert into Report_A_Player
values('011', 'DoubleLift', 'NA', 'Kikis', 'EU', '094005052016', 
'Got a penta kill against me..');

insert into Report_A_Player
values('012', 'DoubleLift', 'NA', 'FNC Febiven', 'EU', '105005052016', 
'Told me to uninstall the game');

insert into Report_A_Player
values('013', 'DoubleLift', 'NA', 'FNC Rekkles', 'EU', '105105052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('014', 'DoubleLift', 'NA', 'G2 ZV3N', 'EU', '105205052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('015', 'DoubleLift', 'NA', 'Ssumday', 'KR', '105305052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('016', 'DoubleLift', 'NA', 'Crown', 'KR', '105405052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('017', 'DoubleLift', 'NA', 'Smeb', 'KR', '105505052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('018', 'DoubleLift', 'NA', 'PraY', 'KR', '105605052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('019', 'DoubleLift', 'NA', 'Bang', 'KR', '105705052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('020', 'DoubleLift', 'NA', 'Rush', 'KR', '105805052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('021', 'DoubleLift', 'NA', 'Jensen', 'NA', '105905052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('022', 'DoubleLift', 'NA', 'Impact', 'NA', '110005052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('023', 'DoubleLift', 'NA', 'Huni', 'NA', '110105052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('024', 'DoubleLift', 'NA', 'Hauntzer', 'NA', '110205052016', 
'Thought Gengar was better');

insert into Report_A_Player
values('025', 'DoubleLift', 'NA', 'Froggen', 'NA', '110305052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('026', 'DoubleLift', 'NA', 'BunnyFuFuu', 'NA', '110405052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('027', 'DoubleLift', 'NA', 'Aphromoo', 'NA', '110505052016', 
'Told Febiven to uninstall the game');

insert into Report_A_Player
values('028', 'DoubleLift', 'NA', 'mid fekar', 'NA', '093131052016', 
'Didnt meme enough in game');

insert into Report_A_Player
values('029', 'DoubleLift', 'NA', 'Hide on Bush', 'KR', '093231052016', 
'Didnt meme enough in game');

insert into Report_A_Player
values('030', 'DoubleLift', 'NA', 'Bjergsen', 'NA', '093331052016', 
'Didnt meme enough in game');

insert into Report_A_Player
values('031', 'DoubleLift', 'NA', 'LemonNation', 'NA', '093431052016', 
'Didnt meme enough in game');

insert into Report_A_Player
values('032', 'DoubleLift', 'NA', 'EDG DEFT', 'KR', '095005052016', 
'Took ADC from me and feeds..');

/*

// If a player purchases a champion with cost over 4800
// award the player 100 riotpoints

*/

CREATE OR REPLACE TRIGGER champion_spending_reward
AFTER INSERT ON Player_Purchase_Champion
FOR EACH ROW
BEGIN
	IF :New.Cost > 4800 THEN
	UPDATE Player SET riotPoints = riotPoints + 100
	WHERE Player.Username = :NEW.playerID;
	END IF;
END;
/


/*

// If a player makes an RP purchase of 3000 or above
// halve all the upgrade costs to his/her items and
// give the player the champion Lee Sin

*/

CREATE OR REPLACE TRIGGER rp_spending_reward
AFTER UPDATE ON PLAYER
FOR EACH ROW
BEGIN
	IF :NEW.riotPoints >= :OLD.riotPoints + 3000 THEN
	UPDATE Purchase_And_Upgrade SET upgradeConversion = upgradeConversion * 0.5
	WHERE Purchase_And_Upgrade.playerID = :NEW.Username;

	INSERT INTO Player_Purchase_Champion
	VALUES(:New.Username, :New.Region, 'Lee Sin', '4800');
	END IF;
END;
/


