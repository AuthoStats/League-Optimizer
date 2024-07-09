clear; clc; close all;

buyingBoots=true;
numberOfMythics=28;
numberOfItems=5;%Excluding boots if bought
%Level = 1:18;Galeforce, The Collector, Statik Shiv, Stormrazor, Mortal Reminder, 
Level = 18;
BaseAD = 59+4.7*(Level-1);

ADColumn=1;
APColumn=2;
AttackSpeedColumn=3;
LifeStealColumn=4;
HealthColumn=5;
HealthRegenColumn=6;
ManaColumn=7;
ManaRegenColumn=8;
ArmorColumn=9;
LethalityColumn=10;
PercentArmorPenColumn=11;
MagicResistColumn=12;
MagicPenColumn=13;
PercentMagicPenColumn=14;
AbilityHasteColumn=15;
MovementSpeedColumn=16;
CritChanceColumn=17;
CritDamageColumn=18;
HealAndShieldPowerColumn=19;
GoldColumn=20;
ItemIDColumn=21;
%AD,AP,AS,Lifesteal,Health,Health Regen,Mana,Mana Regen,Armor,Lethality, Armor Pen %,MR,Magic Pen, Magic Pen %,Ability Haste,Movement Speed,Crit Chance,Crit Damage, Gold, Item Code
        %AD,AS,Crit Chance,Crit Damage,Lethality,Armor Pen,% ItemCode
ItemList=[65,0,0,0,0,0,0,0,0,0,0,0,0,0,15,0,0.2,0,0,3400,1;%Navori Quickblades
          50,0,0.15,0,0,0,0,0,0,0,0,0,0,0,0,0.07,0.2,0,0,3400,2;%Galeforce
          70,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.2,0.35,0,3400,3;%Infinity Edge
          40,0,0.35,0,300,0,0,0,0,0,0,0,0,0,20,0,0,0,0,3333,4;%Trinity Force
          40,0,0,0,300,0,0,0,0,0,0,0,0,0,20,0,0,0,0,3300,5;%Divine Sunderer
          60,0,0.2,0,300,0,0,0,0,0,0,0,0,0,20,0,0,0,0,3300,6;%Stridebreaker
          0,0,0,0,400,0,0,0,30,0,0,30,0,0,20,0,0,0,0,3200,7;%Jak'Sho, The Protean
          0,80,0,0,0,0,600,0,0,0,0,0,6,0,20,0,0,0,0,3200,8;%Luden's Tempest
          0,80,0,0,0,0,600,0,0,0,0,0,0,0,20,0,0,0,0,3200,9;%Liandry's Anguish
          55,0,0,8,300,0,0,0,0,0,0,0,0,0,20,0,0,0,0,3200,10;%Goredrinker
          0,90,0,0,300,0,0,0,0,0,0,0,0,0,25,0,0,0,0,3200,11;%Night Harvester
          0,70,0,7,300,0,0,0,0,0,0,0,0,0,15,0,0,0,0,3200,12;%Riftmaker
          0,90,0,0,250,0,0,0,0,0,0,0,6,0,15,0,0,0,0,3200,13;%Hextech Rocketbelt
          30,30,0.25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3200,14;%Guinsoo's Rageblade
          0,0,0,0,800,2,0,0,0,0,0,0,0,0,20,0,0,0,0,3200,15;%Heartsteel
          60,0,0,0,0,0,0,0,0,12,0,0,0,0,15,0,0,0,0,3100,16;%Eclipse
          60,0,0,0,0,0,0,0,0,18,0,0,0,0,20,0,0,0,0,3100,17;%Duskblade of Draktharr
          60,0,0,0,0,0,0,0,0,18,0,0,0,0,15,0,0,0,0,3100,18;%Youmuu's Ghostblade
          0,0,0,0,400,0,0,0,50,0,0,0,0,0,20,0,0,0,0,3000,19;%Iceborn Gauntlet
          0,100,0,0,600,0,600,0,0,0,0,0,0,0,0,0,0,0,0,2800,20;%Rod of Ages
          0,70,0,0,250,0,600,0,0,0,0,0,0,0,20,0,0,0,0,2800,21;%Everfrost
          0,70,0,0,250,0,600,0,0,0,0,0,0,0,20,0,0,0,0,2800,22;%Crown of the Shattered Queen
          0,0,0,0,350,0,0,0,30,0,0,30,0,0,10,0,0,0,0,2700,23;%Radiant Virtue
          0,30,0,0,200,0,0,1.25,0,0,0,0,0,0,15,0,0,0,0,2300,24;%Echoes of Helia
          0,35,0,0,200,0,0,1,0,0,0,0,0,0,20,0,0,0,0,2300,25;%Moonstone Renewer
          0,0,0,0,200,0,0,0,30,0,0,30,0,0,20,0,0,0,0,2300,26;%Locket of the Iron Solari
          0,0,0,0,200,0,0,0,30,0,0,30,0,0,20,0,0,0,0,2300,27;%Evenshroud
          0,35,0,0,200,0,0,1,0,0,0,0,0,0,20,0,0,0,0,2300,28;%Shurelya's Battlesong
          0,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3600,29;%Rabadon's Deathcap
          65,0,0,0,300,0,0,0,0,0,0,0,0,0,20,0,0,0,0,3400,30;%Spear Of Shojin
          85,0,0,10,0,0,0,0,0,0,0,0,0,0,25,0,0,0,0,3400,31;%Ravenous Hydra
          95,0,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0.2,0,0,3400,32;%Bloodthirster
          55,0,0,0,0,0,0,0,45,0,0,0,0,0,15,0,0,0,0,3300,33;%Death's Dance
          30,0,0,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3300,34;%Titanic Hydra
          40,0,0.25,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3300,35;%Blade of The Ruined King
          45,0,0,0,0,0,0,0,0,0,0.3,0,0,0,20,0,0,0,0,3200,36;%Serylda's Grudge
          0,0,0,0,0,0,0,0,60,0,0,60,0,0,15,0,0,0,0,3200,37;%Gargoyle Stoneplate
          0,100,0.5,0,0,0,0,0,0,0,0,0,0,0,15,0,0,0,0,3200,38;%Nashor's Tooth
          40,0,0.4,0,0,0,0,0,0,0,0,40,0,0,0,0,0,0,0,3200,39;%Wit's End
          50,0,0,0,400,0,0,0,0,0,0,0,0,0,30,0,0,0,0,3100,40;%Black Cleaver
          0,0,0,0,400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3100,41;%Sterak's Gage
          55,0,0,0,0,0,0,0,0,18,0,0,0,0,25,0,0,0,0,3000,42;%Axiom Arc
          55,0,0,0,0,0,0,0,0,15,0,0,0,0,15,0,0,0,0,3000,43;%Prowler's Claw
          55,0,0,0,0,0,0,0,0,18,0,0,0,0,0,0,0.2,0,0,3000,44;%The Collector
          50,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0.2,0,0,3000,45;%Immortal Shieldbow
          40,0,0.3,0,0,0,0,0,0,0,0,0,0,0,0,0,0.2,0,0,3000,46;%Kraken Slayer
          40,0,0,0,300,0,0,0,0,0,0,40,0,0,0,0,0,0,0,3000,47;%Silvermere Dawn
          0,100,0,0,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,48;%Shadowflame
          0,75,0,0,350,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,49;%Demonic Embrace
          0,100,0,0,0,0,0,0,0,0,0,0,0,0,30,5,0,0,0,3000,50;%Cosmic Drive
          60,0,0,0,400,1.5,0,0,0,0,0,0,0,0,0,5,0,0,0,3000,51;%Hullbreaker
          0,90,0,0,200,0,0,0,0,0,0,0,10,0,0,0,0,0,0,3000,52;%Morellonomicon
          0,80,0,0,0,0,0,0,45,0,0,0,0,0,15,0,0,0,0,3000,53;%Zhonya's Hourglass
          0,0,0,0,400,0,0,0,60,0,0,0,0,0,0,0,0,0,0,3000,54;%Randuin's Omen
          40,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0.2,0,0,3000,55;%Mercurial Scimitar
          0,85,0,0,0,0,0,0,0,0,0,0,0,0,15,8,0,0,0,3000,56;%Lich Bane
          50,0,0.15,0,0,0,0,0,0,0,0,0,0,0,0,0,0.2,0,0,3000,57;%Stormrazor
          30,0,0.15,0,0,0,0,0,0,0,0,0,0,0,0,7,0.2,0,0,3000,58;%Rapid Firecannon
          45,0,0.25,0,0,0,0,0,0,0,0,0,0,0,0,0,0.2,0,0,3000,59;%Statikk Shiv
          0,0,0,0,800,2,0,0,0,0,0,0,0,0,10,0,0,0,0,3000,60;%Warmog's Armor
          35,0,0,0,0,0,0,0,0,0,0.3,0,0,0,0,0,0.2,0,0,3000,61;%Lord Dominik's Regards
          40,0,0,0,0,0,0,0,0,0,0.3,0,0,0,0,0,0.2,0,0,3000,62;%Mortal Reminder
          45,0,0,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,3000,63;%Guardian Angel
          0,70,0,0,200,0,860,0,0,0,0,0,0,0,10,0,0,0,0,3000,64;%Seraph's Embrace
          50,0,0,0,325,0,0,0,0,10,0,0,0,0,0,0,0,0,0,2900,65;%Edge of Night
          0,0,0,0,300,0,0,0,45,0,0,0,0,0,0,5,0,0,0,2900,66;%Dead Man's Plate
          55,0,0,0,0,0,0,0,0,0,0,0,0,0,20,0,0.2,0,0,2900,67;%Essence Reaver
          0,0,0,0,450,1,0,0,0,0,0,50,0,0,10,0,0,0,0,2900,68;%Spirit Visage
          35,0,0,0,0,0,860,0,0,0,0,0,0,0,15,0,0,0,0,2900,69;%Muramana
          0,0,0,0,500,0,0,0,0,0,0,50,0,0,10,0,0,0,0,2800,70;%Turbo Chemtank
          55,0,0,0,250,0,0,0,0,0,0,0,0,0,25,0,0,0,0,2800,71;%Chempunk Chainsword
          0,0,0,0,400,0,0,0,0,0,0,60,0,0,0,5,0,0,0,2800,72;%Force of Nature
          65,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,2800,73;%Maw of Malmortius
          0,65,0,0,0,0,0,0,0,0,0,0,0,0.4,0,0,0,0,0,2800,74;%Void Staff
          0,0,0.4,0,0,0,0,0,0,0,0,0,0,0,0,7,0.2,0,0,2800,75;%Runaan's Hurricane
          20,0,0.35,0,0,0,0,0,0,0,0,0,0,0,0,7,0.2,0,0,2800,76;%Phantom Dancer
          0,0,0,0,0,0,400,0,90,0,0,0,0,0,20,0,0,0,0,2700,77;%Frozen Heart
          0,0,0,0,350,0,0,0,70,0,0,0,0,0,0,0,0,0,0,2700,78;%Thornmail
          0,0,0,0,500,0,0,0,50,0,0,0,0,0,0,0,0,0,0,2700,79;%Sunfire Aegis
          55,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,2600,80;%Serpent's Fang
          0,0,0,0,400,0,860,0,0,0,0,0,0,0,15,0,0,0,0,2600,81;%Fimbulwinter
          0,75,0,0,400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2600,82;%Rylai's Crystal Scepter
          0,80,0,0,0,0,0,0,0,0,0,45,0,0,10,0,0,0,0,2600,83;%Banshee's Veil
          0,0,0,0,650,0,0,0,0,0,0,0,0,0,20,0,0,0,0,2500,84;%Anathema's Chains
          0,0,0,0,300,0,0,0,0,0,0,60,0,0,10,0,0,0,0,2400,85;%Abyssal Mask
          0,0,0,0,250,0,0,0.5,0,0,0,0,0,0,10,0,0,0,0,2300,86;%Vigilant Wardstone
          0,55,0,0,0,0,0,1,0,0,0,0,0,0,20,0,0,0,0,2300,87;%Imperial Mandate
          0,0,0,0,250,0,0,1,0,0,0,0,0,0,0,0,0,0,15,2300,88;%Mikael's Blessing
          50,0,0,0,0,0,0,0,0,10,0,0,0,0,15,0,0,0,0,2300,89;%Umbral Glaive
          0,0,0,0,250,0,0,1,0,0,0,0,0,0,0,0,0,0,15,2300,90;%Redemption
          0,0,0,0,350,1.25,0,0,25,0,0,0,0,0,15,0,0,0,0,2200,91;%Knight's Vow
          0,0,0,0,200,0,250,0,45,0,0,0,0,0,15,0,0,0,0,2200,92;%Zeke's Convergence
          0,35,0,0,0,0,0,0.75,0,0,0,0,0,0,0,5,0,0,8,2100,93;%Staff of Flowing Water
          0,35,0,0,0,0,0,0.75,0,0,0,0,0,0,0,5,0,0,8,2100,94;%Ardent Censer
          0,35,0,0,0,0,0,0.75,0,0,0,0,0,0,15,0,0,0,10,2100,95;%Chemtech Putrifier
          0,145,0,0,100,0,0,0,0,0,0,0,0,0,0,10,0,0,0,1600,96;%Mejai's Soulstealer
          0,0,0.35,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1100,97;%Berserker's Greaves
          0,0,0,0,0,0,0,0,0,0,0,0,18,0,0,0,0,0,0,1100,98;%Sorcerer's Shoes
         ];

nonMythicItems =nchoosek((numberOfMythics+1):size(ItemList,1),numberOfItems-1);
MythicItems = reshape((repmat((1:numberOfMythics)',1,size(nonMythicItems,1)))',[],1);

AllItems = [MythicItems,repmat(nonMythicItems,numberOfMythics,1)];
Results=cell(size(2*AllItems,1),6);
bestADCDamage = 0*Level;
bestTankDamage = 0*Level;
bestPseudoTankDamage = 0*Level;
for j=1:size(AllItems,1)
    Items = ItemList(AllItems(j,1:end),:);
    [DMGvsADC,DMGvsTank,DMGvsPseudoTank,AD]=calculateDamage(Items,Level,numberOfItems,buyingBoots,"Jhin",[5,0;5,0]);
    Results(j,:)=[{DMGvsADC},{DMGvsTank},{DMGvsPseudoTank},{AD},{convertItemNumberToName(Items(:,size(ItemList,2)))},{j}];
    [DMGvsADC,DMGvsTank,DMGvsPseudoTank,AD]=calculateDamage(Items,Level,numberOfItems,buyingBoots,"Jhin",[0,0.1;5,0]);
    Results(size(AllItems,1)+j,:)=[{DMGvsADC},{DMGvsTank},{DMGvsPseudoTank},{AD},{convertItemNumberToName(Items(:,size(ItemList,2)))},{j}];
end

topXBuilds = 10;

sortedDMGvsADC = sortrows(Results,1,'descend');
top5DMGvsADC = cell2mat(sortedDMGvsADC(1:min(topXBuilds,size(Results,1)),1));
top5DMGvsADCBuilds = strings(numberOfItems,min(topXBuilds,size(Results,1)));
for i=1:min(topXBuilds,size(Results,1))
    top5DMGvsADCBuilds(:,i) = sortedDMGvsADC{i,5};
end
fprintf('The Top 5 Highest DPS builds v.s. ADC''s are:\n');
for i=1:min(topXBuilds,size(Results,1))
    fprintf('%i Damage with ',top5DMGvsADC(i));
    for j=1:numberOfItems
        fprintf('%s, ',top5DMGvsADCBuilds(j,i));
    end
    fprintf('\n');
end
fprintf('\n');

sortedDMGvsPseudoTank = sortrows(Results,3,'descend');
top5DMGvsPseudoTank = cell2mat(sortedDMGvsPseudoTank(1:min(topXBuilds,size(Results,1)),3));
top5DMGvsPseudoTankBuilds = strings(numberOfItems,min(topXBuilds,size(Results,1)));
for i=1:min(topXBuilds,size(Results,1))
    top5DMGvsPseudoTankBuilds(:,i) = sortedDMGvsPseudoTank{i,5};
end
fprintf('The Top 5 Highest DPS builds v.s. PseudoTank''s are:\n');
for i=1:min(topXBuilds,size(Results,1))
    fprintf('%i Damage with ',top5DMGvsPseudoTank(i));
    for j=1:numberOfItems
        fprintf('%s, ',top5DMGvsPseudoTankBuilds(j,i));
    end
    fprintf('\n');
end
fprintf('\n');

sortedDMGvsTank = sortrows(Results,2,'descend');
top5DMGvsTank = cell2mat(sortedDMGvsTank(1:(min(topXBuilds,size(Results,1))),2));
top5DMGvsTankBuilds = strings(numberOfItems,min(topXBuilds,size(Results,1)));
for i=1:min(topXBuilds,size(Results,1))
    top5DMGvsTankBuilds(:,i) = sortedDMGvsTank{i,5};
end
fprintf('The Top 5 Highest DPS builds v.s. Tank''s are:\n');
for i=1:min(topXBuilds,size(Results,1))
    fprintf('%i Damage with ',top5DMGvsTank(i));
    for j=1:numberOfItems
        fprintf('%s, ',top5DMGvsTankBuilds(j,i));
    end
    fprintf('\n');
end
fprintf('\n');
