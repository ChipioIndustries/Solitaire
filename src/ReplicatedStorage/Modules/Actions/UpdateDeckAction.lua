--update the rodux store to hold the latest deck contents
--ChipioIndustries
--last edit 7/19/2020

return function(deck)
	return {
		type="UpdateDeck";
		Deck=deck;
	}
end