#########################################################
# David
# Zone:  Rathe Mountains
# Quest:  Bracers of Ro
# Author: Unknown
# Updated:  Andrew80k
#########################################################
sub EVENT_SAY { 
  if ($text=~/hail/i) {
    quest::say("I, the keeper of the [Bracers of Ro],  welcome you.  Come and rest within our camp.  You have nothing to fear while such righteous might is gathered.");
  }
  if ($text=~/bracers of ro/i){
    if ($faction <= 4) {
      quest::say("When you can swim the waters of Rathe and return two goblin nets from the elusive goblin net masters. then you will be rewarded the bracer mold.");
    }
    else {
      quest::say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can."); 
    }
  }
}

sub EVENT_ITEM { 
   if (plugin::check_handin(\%itemcount,12311 => 2) && $faction <= 4) {
     quest::say("You have done well. Take the mold for the bracer.  Go forth to speak with Thomas of [Lord Searfire].  Then all components shall be known.");
     quest::summonitem(12301); # Item: Mold of Ro Bracer
     quest::faction(695,1); # Faction: Clockwork Gnome (Race)
     quest::faction(242,1); # Faction: Deepwater Knights
     quest::faction(265,-1); # Faction: Heretics 
   }
   elsif (plugin::check_handin(\%itemcount, 12311 => 1) && $faction <= 4) {
     quest::say("Two Deepwater goblin nets are required.");
     quest::summonitem(12311); # Item: Deepwater Goblin Net
   }
   else {
     quest::say("I have no use for this.");
   }
   plugin::return_items(\%itemcount);
}
#END of FILE Zone:rathemtn  ID:50108 -- David
