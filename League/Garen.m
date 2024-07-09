clear; clc; close all;

buyingBoots=false;
numberOfItems=6;%Excluding boots if bought
%Level = 1:18;Galeforce, The Collector, Statik Shiv, Stormrazor, Mortal Reminder, 
Level = 18;
BaseAD = 69+4.5*(Level-1);
        %AD,AS,Crit Chance,Crit Damage,Lethality,Armor Pen%,AH,MS,Gold ItemCode
ItemList=[80,0.00,0.25,0.50,00,0.00,00,0 ,0000,3400,9 ;%Infinity Edge 1
          00,0.40,0.25,0.00,00,0.00,0 ,7 ,0000,2600,5 ;%Navori 2
          45,0.33,0.0 ,0.00,00,0.00,20,0 , 300,3333,4 ;%Trinity Force 3 
          45,0.00,0.0 ,0.00,15,0.00,15,0 ,0000,3200,11 ;%Serylda's Grudge 4
          95,0.00,0.0 ,0.00,18,0.00,15,0 ,0000,3000,24 ;%10 stack Hubris 5
          55,0.00,0.0 ,0.00,18,0.00,00,5 ,0000,2700,68 ;%Opportunity 6
          60,0.00,0.0 ,0.00,18,0.00,00,0 ,0000,2700,72 ;%Youmuu's Ghostblade 7 
          65,0.00,0.0 ,0.00,00,0.00,00,5 , 350,3000,35 ;%Hullbreaker 8
          40,0.00,0.0 ,0.00,00,0.00,00,0 ,0000,3300,36 ;%Mercurial Scimitar 9
          50,0.30,0.0 ,0.00,00,0.00,00,0 , 450,3300,17;%Stridebreaker 10
          70,0.00,0.25,0.00,00,0.00,25,0 ,0000,3200,33 ;%Essence Reaver 11 
          60,0.00,0.25,0.00,15,0.00,00,0 ,0000,3200,26 ;%The Collector 12
          50,0.40,0.00,0.00,00,0.00,00,7 ,0000,3100,28 ;%Kraken Slayer 13
          50,0.40,0.00,0.00,00,0.00,00,0 ,0000,2900,41 ;%Statik Shiv 14
          65,0.00,0.25,0.00,00,0.00,00,0 ,0000,3200,22 ;%Yun Tal Wildarrows 15
          00,0.35,0.25,0.00,00,0.00,00,7 ,0000,2600,40;%Rapic Fire Cannon 16
          55,0.00,0.0 ,0.00,18,0.00,15,0 ,0000,2900,49;%Voltaic Cyclosword 17
          70,0.00,0.0 ,0.00,00,0.00,15,0 ,0000,2800,56;%Eclipse 18
          55,0.00,0.25,0.00,00,0.00,00,0 ,0000,3000,27;%Shieldbow 19
          40,0.00,0.25,0.00,00,0.35,00,0 ,0000,3000,47;%Mortal Reminder 20
          80,0.00,0.00,0.00,00,0.00,00,0 ,0000,3400,3;%Bloodthirster
          70,0.00,0.0 ,0.00,00,0.00,20,0 ,0000,3300,8;%Ravenous Hydra 22
          00,0.35,0.0 ,0.00,00,0.00,00,0 ,0000,1100,99;%Boots 23
          00,0.60,0.25,0.00,00,0.00,00,12,0000,2600,66;%Phantom Dancer 24
          00,0.00,0.0 ,0.00,00,0.00,00,0 , 400,3000,45;%Steraks Gage 25
          55,0.00,0.0 ,0.00,00,0.00,20,0 , 400,3000,44;%Black Cleaver 26
          60,0.00,0.0 ,0.00,18,0.00,20,0 ,0000,3300,2;%Profane Hydra 27
          00,0.45,0.0 ,0.00,00,0.00,00,0 ,0000,3100,61;%Zephyr 28
          40,0.00,0.0 ,0.00,00,0.00,00,0 , 500,3100,61;%Overlord's Bloodmail 29
          55,0.00,0.0 ,0.00,00,0.00,20,0 , 300,3100,19;%Spear of Shojin 30
         ];

ItemIndexes =nchoosek(1:size(ItemList,1),numberOfItems);
ItemSets = reshape((ItemIndexes)',1,numberOfItems,size(ItemIndexes,1));
%TestItemList=reshape(ItemList(AllItemSets(:,1:end,1:size(AllItems,1)),:),[],size(ItemList,2),size(AllItems,1));
Results=cell(size(ItemIndexes,1),7);
bestADCDamage = 0*Level;
bestTankDamage = 0*Level;
bestPseudoTankDamage = 0*Level;
for j=1:size(ItemIndexes,1)
    Items = ItemList(ItemIndexes(j,1:end),:);
    [DMGvsADC,DMGvsTank,DMGvsPseudoTank,Lethality,PercentArmorPen]=calculateDamage(Items,Level,numberOfItems,buyingBoots,"Garen",[9,0;9,0]);
    Results(j,:)=[{DMGvsADC},{DMGvsTank},{DMGvsPseudoTank},{convertItemNumberToName(Items(:,size(ItemList,2)))},{Lethality},{PercentArmorPen},{j}];
end

topXBuilds = 10;

sortedDMGvsADC = sortrows(Results,1,'descend');
topXDMGvsADC = cell2mat(sortedDMGvsADC(1:min(topXBuilds,size(Results,1)),1));
topXDMGvsADCLethality = cell2mat(sortedDMGvsADC(1:min(topXBuilds,size(Results,1)),5));
topXDMGvsADCPercentPen = cell2mat(sortedDMGvsADC(1:min(topXBuilds,size(Results,1)),6));
topXDMGvsADCBuilds = strings(numberOfItems,min(topXBuilds,size(Results,1)));
for i=1:min(topXBuilds,size(Results,1))
    topXDMGvsADCBuilds(:,i) = sortedDMGvsADC{i,4};
end
fprintf('The Top %i Highest DPS builds v.s. ADC''s are:\n',topXBuilds);
for i=1:min(topXBuilds,size(Results,1))
    fprintf('%i Damage with ',topXDMGvsADC(i));
    for j=1:numberOfItems
        fprintf('%s, ',topXDMGvsADCBuilds(j,i));
    end
    fprintf(' totaling %i Lethality and %.2f%% Armor Pen.',topXDMGvsADCLethality(i),topXDMGvsADCPercentPen(i));
    fprintf('\n');
end
fprintf('\n');

sortedDMGvsPseudoTank = sortrows(Results,3,'descend');
topXDMGvsPseudoTank = cell2mat(sortedDMGvsPseudoTank(1:min(topXBuilds,size(Results,1)),3));
topXDMGvsPseudoTankLethality = cell2mat(sortedDMGvsPseudoTank(1:min(topXBuilds,size(Results,1)),5));
topXDMGvsPseudoTankPercentPen = cell2mat(sortedDMGvsPseudoTank(1:min(topXBuilds,size(Results,1)),6));
topXDMGvsPseudoTankBuilds = strings(numberOfItems,min(topXBuilds,size(Results,1)));
for i=1:min(topXBuilds,size(Results,1))
    topXDMGvsPseudoTankBuilds(:,i) = sortedDMGvsPseudoTank{i,4};
end
fprintf('The Top %i Highest DPS builds v.s. PseudoTank''s are:\n',topXBuilds);
for i=1:min(topXBuilds,size(Results,1))
    fprintf('%i Damage with ',topXDMGvsPseudoTank(i));
    for j=1:numberOfItems
        fprintf('%s, ',topXDMGvsPseudoTankBuilds(j,i));
    end
    fprintf(' totaling %i Lethality and %.2f%% Armor Pen.',topXDMGvsPseudoTankLethality(i),topXDMGvsPseudoTankPercentPen(i));
    fprintf('\n');
end
fprintf('\n');

sortedDMGvsTank = sortrows(Results,2,'descend');
topXDMGvsTank = cell2mat(sortedDMGvsTank(1:(min(topXBuilds,size(Results,1))),2));
topXDMGvsTankLethality = cell2mat(sortedDMGvsTank(1:min(topXBuilds,size(Results,1)),5));
topXDMGvsTankPercentPen = cell2mat(sortedDMGvsTank(1:min(topXBuilds,size(Results,1)),6));
topXDMGvsTankBuilds = strings(numberOfItems,min(topXBuilds,size(Results,1)));
for i=1:min(topXBuilds,size(Results,1))
    topXDMGvsTankBuilds(:,i) = sortedDMGvsTank{i,4};
end
fprintf('The Top %i Highest DPS builds v.s. Tank''s are:\n',topXBuilds);
for i=1:min(topXBuilds,size(Results,1))
    fprintf('%i Damage with ',topXDMGvsTank(i));
    for j=1:numberOfItems
        fprintf('%s, ',topXDMGvsTankBuilds(j,i));
    end
    fprintf(' totaling %i Lethality and %.2f%% Armor Pen.',topXDMGvsTankLethality(i),topXDMGvsTankPercentPen(i));
    fprintf('\n');
end
fprintf('\n');
