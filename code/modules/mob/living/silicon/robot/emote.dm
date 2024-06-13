/mob/living/silicon/emote(var/act,var/m_type=1,var/message = null)
	var/param = null
	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	switch(act)//01000001011011000111000001101000011000010110001001100101011101000110100101111010011001010110010000100001 (Seriously please keep it that way.)
		if ("aflap")
			if (!src.restrained())
				message = "<B>[src]</B> ����� ������ �����&#255;�� � ������!"
				m_type = 2
			m_type = 1

		if("beep")						//MOB NEEDED
			var/M = null
			if(param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if(!M)
				param = null

			if (param)
				message = "<B>[src]</B> �������� �� [param]."
			else
				message = "<B>[src]</B> ��������."
			playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 0)
			m_type = 2

		if ("bow")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(1, src))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null
				if (param)
					message = "<B>[src]</B> ����&#255;���&#255; [param]."
				else
					message = "<B>[src]</B> ����&#255;���&#255;."
			m_type = 1

		if ("buzz")
			var/M = null
			if(param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if(!M)
				param = null

			if (param)
				message = "<B>[src]</B> ������ �� [param]."
			else
				message = "<B>[src]</B> ������."
			playsound(src.loc, 'sound/machines/buzz-sigh.ogg', 50, 0)
			m_type = 2

		if ("buzz2")
			message = "<B>[src]</B> ������ ������."
			playsound(loc, 'sound/machines/buzz-two.ogg', 50, 0)
			m_type = 2

		if ("chime") //You have mail!
			message = "<B>[src]</B> ������."
			playsound(loc, 'sound/machines/chime.ogg', 50, 0)
			m_type = 2

		if ("clap")
			if (!src.restrained())
				message = "<B>[src]</B> ����������."
				m_type = 2

		if ("custom")
			var/input = copytext(sanitize(input("Choose an emote to display.") as text|null),1,MAX_MESSAGE_LEN)
			if (!input)
				return
			var/input2 = input("Is this a visible or hearable emote?") in list("Visible","Hearable")
			if (input2 == "Visible")
				m_type = 1
			else if (input2 == "Hearable")
				m_type = 2
			else
				alert("Unable to use this emote, must be either hearable or visible.")
				return
			message = "<B>[src]</B> [input]"

		if ("deathgasp")
			message = "<B>[src]</B> ����������� � ���������� ��������&#255;, ����� ���������� ��������..."
			m_type = 1

		if ("flap")
			if (!src.restrained())
				message = "<B>[src]</B> ����� �����&#255;��."
				m_type = 2

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> ������� �� [param]."
			else
				message = "<B>[src]</B> �������."

		if ("honk") //Honk!
			message = "<B>[src]</B> ��������!"
			playsound(loc, 'sound/items/bikehorn.ogg', 50, 1)
			m_type = 2

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> ������� �� [param]."
			else
				message = "<B>[src]</B> �������."

		if ("me")
			if (src.client)
				if(client.prefs.muted & MUTE_IC)
					src << "���-�� ������ ��� (muted)."
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			else
				message = "<B>[src]</B> [message]"

		if ("nod")
			message = "<B>[src]</B> ������ �������."
			m_type = 1

		if ("ping")					//MOB NEEDED
			var/M = null
			if(param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if(!M)
				param = null
			if (param)
				message = "<B>[src]</B> ����� �� [param]."
			else
				message = "<B>[src]</B> �����."
			playsound(src.loc, 'sound/machines/ping.ogg', 50, 0)
			m_type = 2

		if ("sad") //When words cannot express...
			message = "<B>[src]</B> ����������� �������� �������."
			playsound(loc, 'sound/misc/sadtrombone.ogg', 50, 0)
			m_type = 2

		if ("salute")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(1, src))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "<B>[src]</B> ������������ [param]."
				else
					message = "<B>[src]</b> ����� �����."

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> ������� �� [param]."
			else
				message = "<B>[src]</B> ������� �� ��������."
			m_type = 1

		if ("twitch")
			message = "<B>[src]</B> ��������� �������&#255;."
			m_type = 1

		if ("twitch_s")
			message = "<B>[src]</B> �������&#255;."
			m_type = 1

		if ("warn") //HUMAN HARM DETECTED. PLEASE DIE IN AN ORDERLY FASHION.
			message = "<B>[src]</B> ������ �������!"
			playsound(loc, 'sound/machines/warning-buzzer.ogg', 50, 0)
			m_type = 2

		if ("help")
			src << "������ ������ ��&#255; ��������. �� ������ ������������ ��, ������ \"*emote\" � \"say\":\n\naflap, beep-(none)/mob, bow-(none)/mob, buzz-(none)/mob, buzz2, chime, clap, custom, deathgasp, flap, glare-(none)/mob, honk, look-(none)/mob, me, nod, ping-(none)/mob, sad, \nsalute-(none)/mob, twitch, twitch_s, warn"
		else
			src << "<span class='notice'>�������������&#255; �����&#255; '[act]'. �������� \"*help\" � \"say\" ��&#255; ������� ������.</span>"

	if (message && src.stat == CONSCIOUS)
		log_emote("[ckey]/[name] : [message]")
		if (m_type & 1)
			visible_message(message)
		else
			audible_message(message)
	return
