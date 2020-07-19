--the place to tweak all kind of parameters
--ChipioIndustries
--last edited 7/19/2020

local CONFIG={
	CardSize=Vector2.new(100,140);
	CardPadding=8;
	Piles=7;
	HighestCardValue=13;
	Suits={
		["Hearts"]={
			IconID=0;
			Color="Red";
		};
		["Spades"]={
			IconID=0;
			Color="Black";
		};
		["Diamonds"]={
			IconID=0;
			Color="Red";
		};
		["Clubs"]={
			IconID=0;
			Color="Black";
		};
	};
	CardValueLUT={
		[1]={
			Character="A";
			VanityID=0;
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