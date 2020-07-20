---the place to tweak all kind of parameters
--ChipioIndustries
--last edited 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Enums=require("Enums")

local CONFIG={
	CardSize=Vector2.new(100,140);
	CardPadding=8; --spacing between each card pile
	Piles=7;
	HighestCardValue=13; --hmm, technically everything I've written so far would support higher-numbered cards... :thinking:
	Suits={
		[Enums.Suit.Hearts]={
			IconID=0;
			Color=Color3.new(1,0,0);
		};
		[Enums.Suit.Spades]={
			IconID=0;
			Color=Color3.new(0,0,0);
		};
		[Enums.Suit.Diamonds]={
			IconID=0;
			Color=Color3.new(1,0,0);
		};
		[Enums.Suit.Clubs]={
			IconID=0;
			Color=Color3.new(0,0,0);
		};
	};
	CardValueLUT={ --used to replace card numbers with other characters in the case of face cards.
		[1]={
			Character="A";
			VanityID=0; --VanityID is the ID of the image displayed on the face of the card in place of the equivalent number of icons
		};
		[11]={
			Character="J";
			VanityID=0;
		};
		[12]={
			Character="Q";
			VanityID=0;
		};
		[13]={
			Character="K";
			VanityID=0;
		};
	}
}

return CONFIG