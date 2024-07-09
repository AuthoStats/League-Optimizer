function [ItemName] = convertItemNumberToName(Item)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    ItemName = strings([size(Item),1]);
    for i=1:size(Item)
        switch Item(i)
            case 1
                ItemName(i) = 'Rabadon''s Deathcap';

            case 2
                ItemName(i) = 'Profane Hydra';

            case 3
                ItemName(i) = 'Bloodthirster';

            case 4
                ItemName(i) = 'Trinity Force';

            case 5
                ItemName(i) = 'Navori Quickblades';

            case 6
                ItemName(i) ='Titanic Hydra';

            case 7
                ItemName(i) ='Hextech Gunblade';

            case 8
                ItemName(i) ='Ravenous Hydra';

            case 9
                ItemName(i) ='Infinity Edge';

            case 10
                ItemName(i) ='Zhonya''s Hourglass';

            case 11
                ItemName(i) ='Serylda''s Grudge';

            case 12
                ItemName(i) ='Jak''Sho The Protean';

            case 13
                ItemName(i) ='Death''s Dance';

            case 14
                ItemName(i) ='Shadowflame';

            case 15
                ItemName(i) ='Blade of The Ruined King';

            case 16
                ItemName(i) ='Guardian Angel';

            case 17
                ItemName(i) ='Stridebreaker';

            case 18
                ItemName(i) ='Sundered Sky';

            case 19
                ItemName(i) ='Spear of Shojin';

            case 20
                ItemName(i) ='Banshee''s Veil';

            case 21
                ItemName(i) ='Lichbane';

            case 22
                ItemName(i) ='Yun Tal Wildarrows';

            case 23
                ItemName(i) ='Warmog''s Armor';

            case 24
                ItemName(i) ='Hubris';

            case 25
                ItemName(i) ='Axiom Arc';

            case 26
                ItemName(i) ='The Collector';

            case 27
                ItemName(i) ='Immortal Shieldbow';

            case 28
                ItemName(i) ='Kraken Slayer';

            case 29
                ItemName(i) ='Luden''s Companion';

            case 30
                ItemName(i) ='Liandry''s Torment';

            case 31
                ItemName(i) ='Riftmaker';

            case 32
                ItemName(i) ='Cosmic Drive';

            case 33
                ItemName(i) ='Essence Reaver';

            case 34
                ItemName(i) ='Terminus';

            case 35
                ItemName(i) ='Hullbreaker';

            case 36
                ItemName(i) ='Mercurial Scimitar';

            case 37
                ItemName(i) ='Void Staff';

            case 38
                ItemName(i) ='Guinsoo''s Rageblade';

            case 39
                ItemName(i) ='Nashor''s Tooth';

            case 40
                ItemName(i) ='Rapid Firecannon';

            case 41
                ItemName(i) ='Statikk Shiv';

            case 42
                ItemName(i) ='Heartsteel';

            case 43
                ItemName(i) ='Experimental Hexplate';

            case 44
                ItemName(i) ='Black Cleaver';

            case 45
                ItemName(i) ='Sterak''s Gage';

            case 46
                ItemName(i) ='Lord Dominik''s Regards';

            case 47
                ItemName(i) ='Mortal Reminder';

            case 48
                ItemName(i) ='Archangel''s Staff';

            case 49
                ItemName(i) ='Volatic Cyclosword';

            case 50
                ItemName(i) ='Stormsurge';

            case 51
                ItemName(i) ='Dead Man''s Plate';

            case 52
                ItemName(i) ='Spirit Visage';

            case 53
                ItemName(i) ='Manamune';

            case 54
                ItemName(i) ='Kaenic Rookern';

            case 55
                ItemName(i) ='Crpytbloom';

            case 56
                ItemName(i) ='Eclipse';

            case 57
                ItemName(i) ='Hollow Radiance';

            case 58
                ItemName(i) ='Chempunk Chainsword';

            case 59
                ItemName(i) ='Force of Nature';

            case 60
                ItemName(i) ='Edge of Night';

            case 61
                ItemName(i) ='Zephyr';

            case 62
                ItemName(i) ='Maw of Malmortius';

            case 63
                ItemName(i) ='Malignance';

            case 64
                ItemName(i) ='Wit''s End';

            case 65
                ItemName(i) ='Runaan''s Hurricane';

            case 66
                ItemName(i) ='Phantom Dancer';

            case 67
                ItemName(i) ='Unending Despair';

            case 68
                ItemName(i) ='Opportunity';

            case 69
                ItemName(i) ='Dawncore';

            case 70
                ItemName(i) ='Horizon Focus';

            case 71
                ItemName(i) ='Randiun''s Omen';

            case 72
                ItemName(i) ='Youmuu''s Ghostblade';

            case 73
                ItemName(i) ='Thornmail';

            case 74
                ItemName(i) ='Sunfire Aegis';

            case 75
                ItemName(i) ='Iceborn Gauntlet';

            case 76
                ItemName(i) ='Rod of Ages';

            case 77
                ItemName(i) ='Umbral Glaive';

            case 78
                ItemName(i) ='Rylai''s Crystal Scepter';

            case 79
                ItemName(i) ='Ovverlord''s Bloodmail';

            case 80
                ItemName(i) ='Serpent''s Fang';

            case 81
                ItemName(i) ='Hextech Rocketbelt';

            case 82
                ItemName(i) ='Abyssal Mask';

            case 83
                ItemName(i) ='Winter''s Approach';

            case 84
                ItemName(i) ='Trailblazer';

            case 85
                ItemName(i) ='Staff of Flowing Water';

            case 86
                ItemName(i) ='Vigilant Wardstone';

            case 87
                ItemName(i) ='Imperial Mandate';

            case 88
                ItemName(i) ='Ardent Censer';

            case 89
                ItemName(i) ='Mikael''s Blessing';

            case 90
                ItemName(i) ='Frozen Heart';

            case 91
                ItemName(i) ='Redemption';

            case 92
                ItemName(i) ='Echoes of Helia';

            case 93
                ItemName(i) ='Moonstone Renewer';

            case 94
                ItemName(i) ='Locket of the Iron Solar';

            case 95
                ItemName(i) ='Morellonomicon';

            case 96
                ItemName(i) ='Knight''s Vow';

            case 97
                ItemName(i) ='Zeke''s Convergence';

            case 98
                ItemName(i) ='Shurelya''s Battlesong';

            case 99
                ItemName(i) ='Boots';
            otherwise
                ItemName(i) = 'Unknown';
        end
    end
end