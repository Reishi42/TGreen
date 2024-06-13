/mob/living/carbon/alien/larva/emote(var/act)

	var/param = null
	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))
	var/muzzled = is_muzzled()
	var/m_type = 1
	var/message

	switch(act) //Alphabetically sorted please.
		if ("burp")
			if (!muzzled)
				message = "<span class='name'>[src]</span> ����������."
				m_type = 2
		if ("choke")
			message = "<span class='name'>[src]</span> ���������&#255;."
			m_type = 2
		if ("collapse")
			Paralyse(2)
			message = "<span class='name'>[src]</span> �������� ������!"
			m_type = 2
		if ("dance")
			if (!src.restrained())
				message = "<span class='name'>[src]</span> �������� ��������������." //goddamnit, larva
				m_type = 1
		if ("drool")
			message = "<span class='name'>[src]</span> ������� �����."
			m_type = 1
		if ("gasp")
			message = "<span class='name'>[src]</span> ���������&#255;!"
			m_type = 2
		if ("gnarl")
			if (!muzzled)
				message = "<span class='name'>[src]</span> �������������&#255;, ������� ���� ����."
				m_type = 2
		if ("hisss")
			message = "<span class='name'>[src]</span> ���� �����."
			m_type = 1
		if ("jump")
			message = "<span class='name'>[src]</span> �������!"
			m_type = 1
		if ("moan")
			message = "<span class='name'>[src]</span> ������!"
			m_type = 2
		if ("nod")
			message = "<span class='name'>[src]</span> ������ �������."
			m_type = 1
//		if ("roar")
//			if (!muzzled)
//				message = "<span class='name'>[src]</span> roars." Commenting out since larva shouldn't roar /N
//				m_type = 2
		if ("roll")
			if (!src.restrained())
				message = "<span class='name'>[src]</span> ����������&#255;."
				m_type = 1
		if ("scratch")
			if (!src.restrained())
				message = "<span class='name'>[src]</span> ������&#255;." //i'm not really sure that larva should scratch itself
				m_type = 1
		if ("scretch")
			if (!muzzled)
				message = "<span class='name'>[src]</span> ���&#255;�������&#255;."
				m_type = 2
		if ("shake")
			message = "<span class='name'>[src]</span> ������������ ������ �������."
			m_type = 1
		if ("shiver")
			message = "<span class='name'>[src]</span> ������."
			m_type = 2
		if ("sign")
			if (!src.restrained())
				message = text("<span class='name'>[src]</span> signs[].", (text2num(param) ? text(" the number []", text2num(param)) : null))
				m_type = 1
		if ("snore")
			message = "<B>[src]</B> ������."
			m_type = 2
		if ("sulk")
			message = "<span class='name'>[src]</span> �������&#255;."
			m_type = 1
		if ("sway")
			message = "<span class='name'>[src]</span> �������&#255;."
			m_type = 1
		if ("tail")
			message = "<span class='name'>[src]</span> ����� �������."
			m_type = 1
		if ("twitch")
			message = "<span class='name'>[src]</span> ��������� �������&#255;."
			m_type = 1
		if ("whimper")
			if (!muzzled)
				message = "<span class='name'>[src]</span> ������."
				m_type = 2

		if ("help") //"The exception"
			src << "������ ������ ��&#255; �������;. �� ������ ������������ ��, ������ \"*emote\" � \"say\":\nburp, choke, collapse, dance, drool, gasp, gnarl, hiss, jump, moan, nod, roll, scratch,\nscretch, shake, shiver, sign-#, sulk, sway, tail, twitch, whimper"

		else
			src << "<span class='info'>�������������&#255; �����&#255; '[act]'. �������� \"*help\" � \"say\" ��&#255; ������� ������.</span>"

	if ((message && src.stat == 0))
		log_emote("[ckey]/[name] : [message]")
		if (m_type & 1)
			visible_message(message)
		else
			audible_message(message)
	return