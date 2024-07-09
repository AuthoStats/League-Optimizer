function [ADDMG,APDMG,TrueDMG] = calculateItemProcs(ItemID,Level,BaseAD,BonusAD,BaseHealth,BonusHealth,Attacks)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
ADDMG=0;
APDMG=0;
TrueDMG=0;
switch(ItemID)
    case 2%Profane Hydra
        ADDMG=1.3*(BaseAD+BonusAD);
        %bonusDMG=(BaseAD+BonusAD);
    case 4%Trinity Force
        ADDMG = 2*BaseAD;
    case 8%Ravenous Hydra
        ADDMG=BaseAD+BonusAD;
    case 17%Stride Breaker
        ADDMG=0.8*(BaseAD+BonusAD);
    case 28%Kraken Slayer
        ADDMG = (floor(Attacks/3)) ...
        *( 140+10*(Level>=8)+(160/9)*max((Level-9),0) );
    case 35%Hullbreaker
        ADDMG = floor(Attacks/5)*(BaseAD*0.7+0.035*(BaseHealth+BonusHealth));
    case 40%Rapid Firecannon
        APDMG = 60;
    case 41%Statikk Shiv
        APDMG = 120;
    case 49%Voltaic Cyclosword
        ADDMG = 100;
    %case 30%Liandry's Torment
        %bonusDMG = 0.06*2400;%ADC only
    otherwise
        ADDMG = 0;
end