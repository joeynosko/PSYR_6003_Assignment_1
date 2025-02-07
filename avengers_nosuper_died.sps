SET DECIMAL=DOT.

DATA LIST FILE= "avengers_nosuper_died.sav"  free (",")
ENCODING="UTF8"
/ iq agility speed strength damage.resistance * superpower (A8) 
 flexibility willpower ptsd * north_south (A8) died (A8) kills 
 injuries minutes.fighting shots.taken CombatEffectiveness 
  .

VARIABLE LABELS
iq "iq" 
 agility "agility" 
 speed "speed" 
 strength "strength" 
 damage.resistance "damage.resistance" 
 superpower "superpower" 
 flexibility "flexibility" 
 willpower "willpower" 
 ptsd "ptsd" 
 north_south "north_south" 
 died "died" 
 kills "kills" 
 injuries "injuries" 
 minutes.fighting "minutes.fighting" 
 shots.taken "shots.taken" 
 CombatEffectiveness "CombatEffectiveness" 
 .
VARIABLE LEVEL iq, agility, speed, strength, damage.resistance, flexibility, 
 willpower, ptsd, kills, injuries, minutes.fighting, shots.taken, 
 CombatEffectiveness 
 (scale).

EXECUTE.
