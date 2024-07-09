clear; clc; close all;


% rarities = [70 50 50 50];
% tiers = [4 2 2 2];
% AttackPower = [10 0 0];

%Azure Electrum && Enderium ATM9 
rarities = [40 0];%Based solely on Main
tiers = [2 2];
AttackPower = [2 0];
numUniqueItems = 2;

synnergy = calcSynnergy(numUniqueItems,rarities,tiers);
alloyAttackPower = alloyify(AttackPower)*synnergy;

% %Refined Obsidian Ingot && Enderium ATM9
% modifier = [4 2];
% mainModifier=modifier(1);
% numModifiers = 2;
% minWeight = 2;
% maxWeight = 40;
% coeffWeight = 2;
% for i=1:numModifiers
%     baseWeight = minWeight + coeffWeight*(modifier(i)-mainModifier)/mainModifier;
%     clampedWeight = min(max(baseWeight,minWeight),maxWeight);
%     trueWeight(i) = clampedWeight.^(-(0.5+0.5*i));
% end
% weightedModifier = sum(modifier.*trueWeight)/sum(trueWeight);
% synnergisticModifier = weightedModifier*synnergy;
% %Goal ~1.26, currently gives 1.23, 1.4 if synnergy applies(likely doesnt)

%Works for stuff besides AttackPower, not sure which it fails for
function unweightedAttackPower = alloyify(AttackPower)
    basisAttackPower = AttackPower(1);
    modifiers = 1 + AttackPower / (1 + basisAttackPower);
    unweightedAttackPower = sum(modifiers .* AttackPower) / sum(modifiers);
end

function synnergy = calcSynnergy(numUniqueItems,rarities,tiers)
    synnergyMulti = 1.1;
    rarityLossWeight = 0.005;
    tierLossWeight = 0.08;
    baseSynnergy = synnergyMulti * (numUniqueItems / (numUniqueItems + synnergyMulti)) + (1 / (1 + synnergyMulti));
    rarityLoss = rarityLossWeight * sum(abs( rarities(1) - rarities(1:numUniqueItems) ));
    tierLoss = tierLossWeight * sum(abs( tiers(1)-tiers(1:numUniqueItems) ));
    synnergy = baseSynnergy - (rarityLoss + tierLoss);
end

