

/mob/living/simple_animal/hostile/retaliate/rogue/blood
	name = "FLESH HOMUNCULUS"
	desc = null
	hud_type = /datum/hud/human
	icon = 'icons/mob/mob.dmi'
	icon_state = "FLESH"
	icon_living = "FLESH"
	health = 600
	maxHealth = 600
	melee_damage_lower = 40
	melee_damage_upper = 60
	vision_range = 6
	aggro_vision_range = 6
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	base_intents = list(/datum/intent/simple/stab, /datum/intent/unarmed/claw)
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_HEAVY
	pooptype = null
	STACON = 15
	STASTR = 16
	STASPD = 2
	STAEND = 16
	deaggroprob = 0
	defprob = 20
	defdrain = 15
	del_on_deaggro = 99 SECONDS
	retreat_health = 0
	food_max = 250
	food = 0
	attack_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')
	dodgetime = 20
	aggressive = 1
//	stat_attack = UNCONSCIOUS
	remains_type = /obj/effect/decal/remains/xeno/troll // Placeholder until Troll remains are sprited.
	body_eater = TRUE
	var/critvuln = TRUE
	mob_biotypes = MOB_EPIC
	critvuln = FALSE
	STACON = 10
	STASTR = 19
	STASPD = 1
	STAEND = 11

/mob/living/simple_animal/hostile/retaliate/rogue/blood/ascended
	name = "???"
	desc = null
	hud_type = /datum/hud/human
	icon_state = "ascend"
	icon_living = "ascend"
	icon = 'icons/mob/32x64.dmi'
	move_to_delay = 0
	base_intents = list(/datum/intent/simple/stab, /datum/intent/unarmed/ascendedclaw)
	melee_damage_lower = 250
	melee_damage_upper = 550
	health = 666666
	maxHealth = 666666
	critvuln = FALSE
	STACON = 66
	STASTR = 66
	STASPD = 66
	STAEND = 66

/mob/living/simple_animal/hostile/retaliate/rogue/blood/ascended/examine(mob/user)
	. = ..()
	. += "<span class='narsiesmall'>It is impossible to comprehend such a thing.</span>"

/mob/living/simple_animal/hostile/retaliate/rogue/blood/ascended/Initialize()
	. = ..()
	set_light(5,5, LIGHT_COLOR_RED)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/blood/ascended/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("pain")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("death")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("idle")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("cidle")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/blood/death(gibbed)
	. = ..()
	gib()
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/rogue/blood/death(gibbed)
	..()
	update_icon()

/mob/living/simple_animal/hostile/retaliate/rogue/blood/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/troll/aggro1.ogg','sound/vo/mobs/troll/aggro2.ogg')
		if("pain")
			return pick('sound/vo/mobs/troll/pain1.ogg','sound/vo/mobs/troll/pain2.ogg')
		if("death")
			return pick('sound/vo/mobs/troll/death.ogg')
		if("idle")
			return pick('sound/vo/mobs/troll/idle1.ogg','sound/vo/mobs/troll/idle2.ogg')
		if("cidle")
			return pick('sound/vo/mobs/troll/cidle1.ogg','sound/vo/mobs/troll/aggro2.ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/blood/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/blood/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/blood/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()