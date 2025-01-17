function [DMGvsADC,DMGvsTank,DMGvsPseudoTank,Lethality,PercentArmorPen] = calculateDamage(Items,Level,numberOfItems,hasBoots,Champ,Runes)
    switch(Champ)
        case "Jhin"
            BonusASScaling=0;
            BaseAD=59;
            ADScaling=4.7;
            CritModifier=0.86;
            isRanged = true;
        case "Garen"
            BonusASScaling=0.0365;
            BaseAD=69;
            ADScaling=4.5;
            CritModifier=1;
            BaseHealth=690;
            HealthScaling=98;
            isRanged = false;
        case "Smolder"
            BaseAD=60;
            BonusASScaling=0.015;
            ADScaling=2.3;
            CritModifier=1;
            BaseHealth=605;
            HealthScaling=100;
            isRanged = true;
    end
    RuneAD=0.6*Runes(:,1);
    RuneAP=0*Runes(:,1);%I dont feel like coding adaptive force
    RuneAS=Runes(:,2);

    ADColumn=1;
    APColumn=2;%%%%%%%
    AttackSpeedColumn=3;
    CritChanceColumn=4;
    CritDamageColumn=5;
    LethalityColumn=6;
    PercentArmorPenColumn=7;
    AbilityHasteColumn=8;
    MovementSpeedColumn=9;
    HealthColumn=10;
    GoldColumn=11;
    MagicPenColumn=12;%%%%%%%%%%%%%
    PercentMagicPenColumn=13;%%%%%%%%%%%%%%
    ItemIDColumn=14;
    %LifeStealColumn=4;
    %HealthRegenColumn=6;
    %ManaColumn=7;
    %ManaRegenColumn=8;
    %ArmorColumn=9;
    %MagicResistColumn=12;
    %HealAndShieldPowerColumn=19;
    
    
    
    %Calculates DMG for given Level, Items, and Runes
    %Attack Speed
    if(hasBoots)
        BonusAS = (sum(Items(:,AttackSpeedColumn))+0.35)+BonusASScaling*(Level-1)+sum(RuneAS);
    else
        BonusAS = sum(Items(:,AttackSpeedColumn))+BonusASScaling*(Level-1)+sum(RuneAS);
    end
    
    %Health
    BaseHealth = round(BaseHealth+HealthScaling*(Level-1));
    BonusHealth = sum(Items(:,HealthColumn));

    %AD
    BaseAD = round(BaseAD+ADScaling*(Level-1));
    BonusAD = sum(Items(:,ADColumn))+sum(RuneAD);

    %AP
    AP = sum(Items(:,APColumn))+sum(RuneAP);
    
    %Crit
    CritChance= min(sum(Items(:,CritChanceColumn)),1);
    CritDamage= sum(Items(:,CritDamageColumn));
    
    
    %Armor Pen
    Lethality = sum(Items(:,LethalityColumn));
    PercentArmorPen = sum(Items(:,PercentArmorPenColumn));
    PercentArmorReduction = 1;

    MagicPen = sum(Items(:,MagicPenColumn));
    PercentMagicPen = sum(Items(:,PercentMagicPenColumn));
    PercentMagicResistReduction = 1;
    

    hasBlackCleaver=false;
    hasSryld=false;
    hasLDR=false;
    hasMortal=false;

    hasProfHy=false;
    hasTitHydra=false;
    hasRavHydra=false;
    hasStride=false;

    hasShojin=false;
    hasOverlord=false;
    hasRabadon=false;
    hasLiandry=false;
    hasRift=false;
    for i=1:size(Items,1)
        switch(Items(i,end))
            case 1
                hasRabadon = true;
            case 30
                hasLiandry = true;
            case 31
                hasRift = true;
            case 44
                hasBlackCleaver=true;
            case 11
                hasSryld=true;
            case 46
                hasLDR=true;
            case 47
                hasMortal=true;
            case 2
                hasProfHy=true;
            case 6
                hasTitHydra=true;
            case 8
                hasRavHydra=true;
            case 79
                hasOverlord=true;
            case 19
                hasShojin=true;
            case 17
                hasStride=true;
            case 68
                if isRanged
                    Lethality=Lethality+5+0.5*max(Level-7,0);
                else
                    Lethality=Lethality+3+0.3*max(Level-7,0);
                end
        end
    end
    if(hasBlackCleaver+hasSryld+hasLDR+hasMortal>1 ...
            || hasProfHy+hasTitHydra+hasRavHydra+hasStride>1 )
        DMGvsADC=0;
        DMGvsTank=0;
        DMGvsPseudoTank=0;
        AD=0;
        return
    end
    
    %Apply Shojin/Liandry/Sus
    BonusAbilityDamage = 0;
    if hasShojin
        BonusAbilityDamage = 0.12;
    end
    if hasLiandry
        BonusAbilityDamage = 0.06;
    end
    if hasRift
        BonusAbilityDamage = 0.1;
        AP=AP + 0.02*BonusHealth;
    end

    %Apply Rab
    if hasRabadon
        AP=AP*1.35;
    end

    if(hasOverlord)
        BonusAD=BonusAD + 0.02*BonusHealth;
    end

    if(hasSryld)
        PercentArmorPen = PercentArmorPen + 0.25 + 0.0011*Lethality;
    end
    AD = BaseAD + BonusAD;
    CritHit = CritModifier*(1.75+CritDamage);
    
    %disp(PerHitDamage);
    
    %Calculate Damage
    ADCArmor              = 26  +  4.7*(Level-1);
    ADCMagicResist        = 30  +  1.3*(Level-1);
    ADCHP                 = 605 +  100*(Level-1);
    PseudoTankArmor       = 35  +  5.2*(Level-1) +  25*(numberOfItems>=1) + 40*(numberOfItems>=3);
    PseudoTankMagicResist = 28  + 2.05*(Level-1) +  60*(numberOfItems>=3);
    PseudoTankHP          = 660 +  111*(Level-1) + 400*(numberOfItems>=2) + 400*(numberOfItems>=3) + 300*(numberOfItems>=4) + 450*(numberOfItems>=5);
    TankArmor             = 33  +  5.2*(Level-1) + (75*(numberOfItems>=1) +  70*(numberOfItems>=2) + 50*(numberOfItems>=3) + 65*(numberOfItems>=5))*(1.1+0.04*min(Level-13,4));
    TankMagicResist       = 32  + 2.05*(Level-1) + (80*(numberOfItems>=3) +  50*(numberOfItems>=4))*(1.1+0.04*min(Level-13,4))*(1+0.3*(numberOfItems>=3));
    TankHP                = 660 +  109*(Level-1) + (350*(numberOfItems>=1) + 350*(numberOfItems>=2) + 300*(numberOfItems>=3) + 400*(numberOfItems>=4))*(1.1+0.04*min(Level-13,4));
    damageModifierAD=@(Armor,PercentArmorReduction) 100/(100+max((Armor*PercentArmorReduction*(1-PercentArmorPen)-Lethality),0));
    damageModifierAP=@(MagicResist,PercentMagicResistReduction) 100/(100+max((MagicResist*PercentMagicResistReduction*(1-PercentMagicPen)-MagicPen),0));
    
    %Item Procs
    function itemDMG = itemDamage(itemList)
        itemDMG = [0,0,0];
        for itemNumber=1:size(itemList,2)
            [ADItemDamage, APItemDamage,TrueItemDamage] = calculateItemProcs(Items(itemNumber,ItemIDColumn),Level,BaseAD,BonusAD,BaseHealth,BonusHealth,Attacks);
            itemDMG = itemDMG + [ADItemDamage, APItemDamage,TrueItemDamage];
        end
    end

    %Account for Black Cleaver
    CleaverStacks = 0;
    function blackCleaver()
        if(hasBlackCleaver && CleaverStacks<5)
            PercentArmorReduction= PercentArmorReduction-0.06;
            CleaverStacks = CleaverStacks + 1;
        end
    end

    %Apply Damage
    ADDamage=0;
    APDamage=0;
    TrueDamage=0;
    DMGvsADC=0;
    DMGvsPseudoTank=0;
    DMGvsTank=0;
    function applyDamage()
        DMGvsADC       =DMGvsADC       + ( ADDamage + ScalingDamage(ADCHP,ADMaxHPRatio)       ) * damageModifierAD(ADCArmor,PercentArmorReduction       ) + ( APDamage+ScalingDamage(ADCHP,APMaxHPRatio)       ) * damageModifierAP(ADCMagicResist,PercentMagicResistReduction        ) + ( TrueDamage + ScalingDamage(ADCHP,TrueMaxHPRatio)       );
        DMGvsTank      =DMGvsTank      + ( ADDamage + ScalingDamage(PseudoTankHP,ADMaxHPRatio)) * damageModifierAD(TankArmor,PercentArmorReduction      ) + ( APDamage+ScalingDamage(PseudoTankHP,APMaxHPRatio)) * damageModifierAP(PseudoTankMagicResist,PercentMagicResistReduction ) + ( TrueDamage + ScalingDamage(PseudoTankHP,TrueMaxHPRatio));
        DMGvsPseudoTank=DMGvsPseudoTank+ ( ADDamage + ScalingDamage(TankHP,ADMaxHPRatio)      ) * damageModifierAD(PseudoTankArmor,PercentArmorReduction) + ( APDamage+ScalingDamage(TankHP,APMaxHPRatio)      ) * damageModifierAP(TankMagicResist,PercentMagicResistReduction       ) + ( TrueDamage + ScalingDamage(TankHP,TrueMaxHPRatio)      );
        blackCleaver();
    end
    ScalingDamage=@(HP,Ratio) Ratio*HP/100;
    
    
    if(Champ=="Garen")
        Attacks = 1;%Start with Q
        Hits = 7 + floor(BonusAS/0.25);
        PerHitDamage = 20+round(0.2*(max((Level)-9,0)),2)+round(0.8*(min((Level),9)-1),2) + 0.4*AD;
        QDamage = 30*(min(max(Level,7)-7,1)+min(max(Level,9)-9,1)+min(max(Level,11)-11,1)+min(max(Level,12)-12,1)+1) + 1.5*AD;
        itemDamage();

        for i=1:Hits
            if(i==1)
                if(hasProfHy || hasRavHydra)%A Hydra item
                    %Item Proc Damage
                    ADDamage = calculateItemProcs(Items(i,ItemIDColumn),Level,BaseAD,BonusAD,BaseHealth,BonusHealth,CritChance);
                    applyDamage();
    
                    %Q Damage
                    ADDamage = itemDMG - ADDamage + round((QDamage + round((0.75+CritDamage).*CritChance.*AD))*(1+BonusAbilityDamage));
                    applyDamage();
                else
                    %Q Damage
                    ADDamage = itemDMG + round((QDamage + round((0.75+CritDamage).*CritChance.*AD))*(1+BonusAbilityDamage));
                    applyDamage();
                end
            elseif(i==7)
                PercentArmorReduction = 0.75*PercentArmorReduction;
            end
            ADDamage=ceil(((PerHitDamage + (0.75+CritDamage).*CritChance.*PerHitDamage)*(1+BonusAbilityDamage))*1.25);
            applyDamage();
        end
    elseif(Champ == "Jhin")
        Attacks=4;

        %Item Procs
        bonusDMG=0;
        hasBlackCleaver=false;
        for i=1:numberOfItems
            bonusDMG = bonusDMG + calculateItemProcs(Items(i,ItemIDColumn),Level,BaseAD,BonusAD,BaseHealth,BonusHealth,Attacks);
            if(Items(i,ItemIDColumn)==20)
                hasBlackCleaver=true;
            end
        end

        for i=1:Attacks
            if(i<=3)
                TempAD=(1+0.44+CritChance*0.03+0.0025*(BonusAS+1.1))*AD;
            else
                TempAD=(1+0.44+CritChance*0.03+0.0025*BonusAS)*AD;
            end
            if(i==4)
                CritChance=1;
            end
            ADDamage = TempAD*(1+(CritHit-1)*CritChance);
            DMGvsADC=DMGvsADC+ADDamage* 100/(100+max((ADCArmor*PercentArmorReduction*(1-PercentArmorPen)-Lethality),0) );
            DMGvsTank=DMGvsTank+ADDamage* 100/(100+max((TankArmor*PercentArmorReduction*(1-PercentArmorPen)-Lethality),0) );
            DMGvsPseudoTank=DMGvsPseudoTank+ADDamage* 100/(100+max((PseudoTankArmor*PercentArmorReduction*(1-PercentArmorPen)-Lethality),0) );
            if(hasBlackCleaver&&CleaverStacks<6)
                PercentArmorReduction= PercentArmorReduction-0.05;
                CleaverStacks = CleaverStacks + 1;
            end
        end
    elseif(Champ=="Smolder")
        Stacks= 300;
        Attacks=0;
        Damage = (55+AD+0.15*AP)*(1+0.75*CritChance); %Q
        %Damage = 255+0.5*AD+AP; %W
        %Damage = 600+1.65*AD+1.5*AP; %R
        if hasLiandry
            APDamage = APDamage + 50 + 0.06*AP;
            APMaxHPRatio=0.04;
        else
            APMaxHPRatio=0;
        end
        ADMaxHPRatio=0;
        
        %TrueMaxHPRatio=0;
        TrueMaxHPRatio=(0.02*BonusAD+0.01*AP+0.008*Stacks)*(1+BonusAbilityDamage);  %Q
        ItemDamage = itemDamage(1:numberOfItems);%Item Damage
        ADItemDamage=ItemDamage(1);
        APItemDamage=ItemDamage(2);
        TrueItemDamage=ItemDamage(3);
        ADDamage = ADItemDamage + (Damage)*(1+BonusAbilityDamage); %Q
        %ADDamage = round((Damage)*(1+BonusAbilityDamage));%W & R
        %APDamage = Stacks*(0.4+0.3*CritChance)*(1+0.75*CritChance);      %Q
        APDamage =APItemDamage + Stacks*(0.4+0.3*CritChance);      %Q

        %APDamage = Stacks*(0.55);%W
        
        applyDamage();
    end
end