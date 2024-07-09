clear; clc; close all;

buyingBoots=true;
buyingRFC=false;
numberOfItems=1;%Excluding boots if bought
%Level = 1:18;Galeforce, The Collector, Statik Shiv, Stormrazor, Mortal Reminder, 
Level = 9;%Level for 1,2,3,4,5 Items = 9,13,15,16,18
        % AD,AP, AS ,CChc,CDmg,Le,AD% ,AH,MS,HP  ,Gold,MP,AP% ,ItemCode
ItemList=[80,00,0.00,0.25,0.40,00,0.00,00,0 ,0000,3400,00,0.00,9 ;%Infinity Edge 1
          00,00,0.40,0.25,0.00,00,0.00,00,7 ,0000,2600,00,0.00,5 ;%Navori 2
          45,00,0.33,0.0 ,0.00,00,0.00,20,0 , 300,3333,00,0.00,4 ;%Trinity Force 3 
          45,00,0.00,0.0 ,0.00,15,0.00,15,0 ,0000,3200,00,0.00,11 ;%Serylda's Grudge 4
          95,00,0.00,0.0 ,0.00,18,0.00,15,0 ,0000,3000,00,0.00,24 ;%10 stack Hubris 5
          55,00,0.00,0.0 ,0.00,18,0.00,00,5 ,0000,2700,00,0.00,68 ;%Opportunity 6
          60,00,0.00,0.0 ,0.00,18,0.00,00,0 ,0000,2700,00,0.00,72 ;%Youmuu's Ghostblade 7 
          65,00,0.00,0.0 ,0.00,00,0.00,00,5 , 350,3000,00,0.00,35 ;%Hullbreaker 8
          40,00,0.00,0.0 ,0.00,00,0.00,00,0 ,0000,3300,00,0.00,36 ;%Mercurial Scimitar 9
          70,00,0.00,0.25,0.00,00,0.00,25,0 ,0000,3100,00,0.00,33 ;%Essence Reaver 10 
          60,00,0.00,0.25,0.00,12,0.00,00,0 ,0000,3200,00,0.00,26 ;%The Collector 11
          50,00,0.40,0.00,0.00,00,0.00,00,7 ,0000,3100,00,0.00,28 ;%Kraken Slayer 12
          55,00,0.45,0.00,0.00,00,0.00,00,7 ,0000,2800,00,0.00,41 ;%Statik Shiv 13
          55,00,0.00,0.0 ,0.00,18,0.00,15,0 ,0000,2900,00,0.00,49;%Voltaic Cyclosword 14
          70,00,0.00,0.0 ,0.00,00,0.00,15,0 ,0000,2800,00,0.00,56;%Eclipse 15
          55,00,0.00,0.25,0.00,00,0.00,00,0 ,0000,3000,00,0.00,27;%Shieldbow 16
          40,00,0.00,0.25,0.00,00,0.35,00,0 ,0000,3000,00,0.00,47;%Mortal Reminder 17
          80,00,0.00,0.00,0.00,00,0.00,00,0 ,0000,3400,00,0.00,3;%Bloodthirster 18
          00,00,0.35,0.0 ,0.00,00,0.00,00,0 ,0000,1100,00,0.00,99;%Boots 19
          00,00,0.60,0.25,0.00,00,0.00,00,12,0000,2600,00,0.00,66;%Phantom Dancer 20
          00,00,0.00,0.0 ,0.00,00,0.00,00,0 , 400,3000,00,0.00,45;%Steraks Gage 21
          55,00,0.00,0.0 ,0.00,00,0.00,20,0 , 400,3000,00,0.00,44;%Black Cleaver 22
          00,00,0.45,0.0 ,0.00,00,0.00,00,0 ,0000,3100,00,0.00,61;%Zephyr 23
          40,00,0.00,0.0 ,0.00,00,0.00,00,0 , 500,3300,00,0.00,61;%Overlord's Bloodmail 24
          55,00,0.00,0.0 ,0.00,00,0.00,20,0 , 300,3100,00,0.00,19;%Spear of Shojin 25
         00,140,0.00,0.0 ,0.00,00,0.00,00,00,0000,3600,00,0.00,1;%Rabadon's Death Cap 26
         00,120,0.00,0.0 ,0.00,00,0.00,00,00,0000,3250,00,0.00,10;%Zhonya's Hourglass 27
          00,80,0.00,0.0 ,0.00,00,0.00,15,0 , 350,3100,00,0.00,31;%Riftmaker 28
          00,90,0.00,0.0 ,0.00,00,0.00,00,0 , 300,3000,00,0.00,30;%Liandry's Torment 29
          45,00,0.00,0.25,0.00,00,0.40,00,0 ,0000,3000,00,0.00,46;%LDR 30
          % 55,00,0.00,0.0 ,0.00,00,0.00,20,0 , 300,3100,00,0.00,19;%Spear of Shojin 30
          % 55,00,0.00,0.0 ,0.00,00,0.00,20,0 , 300,3100,00,0.00,19;%Spear of Shojin 30
          % 55,00,0.00,0.0 ,0.00,00,0.00,20,0 , 300,3100,00,0.00,19;%Spear of Shojin 30
          00,00,0.35,0.25,0.00,00,0.00,00,7 ,0000,2600,00,0.00,40;%Rapic Fire Cannon 30

          
         ];
if(buyingRFC)
    ItemIndexes =nchoosek(1:(size(ItemList,1)-1),numberOfItems-1);
    ItemIndexes(:,end+1)=size(ItemList,1);% RHS is the index of RFC
else
    ItemIndexes =nchoosek(1:(size(ItemList,1)),numberOfItems);
end
ItemSets = reshape((ItemIndexes)',1,numberOfItems,size(ItemIndexes,1));

Results=cell(size(ItemIndexes,1),7);
bestADCDamage = 0*Level;
bestTankDamage = 0*Level;
bestPseudoTankDamage = 0*Level;
for j=1:size(ItemIndexes,1)
    Items = ItemList(ItemIndexes(j,1:end),:);
    [DMGvsADC,DMGvsTank,DMGvsPseudoTank,Lethality,PercentArmorPen]=calculateDamage(Items,Level,numberOfItems,buyingBoots,"Smolder",[9,0;9,0]);
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
