/mob/living/carbon/alien/larva/attack_hand(mob/living/carbon/human/M)
	if(..())
		var/damage = rand(1, 9)
		if(prob(90))
			if(HULK in M.mutations)
				damage += 5
				spawn(0)
					Paralyse(1)
					step_away(src, M, 15)
					sleep(3)
					step_away(src, M, 15)
			playsound(loc, "punch", 25, 1, -1)
			add_logs(M, src, "attacked", admin=0)
			visible_message("<span class='danger'>[M] has kicked [src]!</span>", \
					"<span class='userdanger'>[M] has kicked [src]!</span>")
			if((stat != DEAD) && (damage > 4.9))
				Paralyse(rand(5,10))

			adjustBruteLoss(damage)
			updatehealth()
		else
			playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
			visible_message("<span class='danger'>[M] has attempted to kick [src]!</span>", \
					"<span class='userdanger'>[M] has attempted to kick [src]!</span>")
