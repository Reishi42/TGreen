/mob/living/carbon/brain/emote(var/act,var/m_type=1,var/message = null)
	if(!(container && istype(container, /obj/item/device/mmi)))//No MMI, no emotes
		return

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	if(src.stat == DEAD)
		return
	switch(act)
		if ("alarm")
			message = "<B>[src]</B> ����� ������."
			m_type = 2

		if ("alert")
			message = "<B>[src]</B> ����� ��������� ����."
			m_type = 2

		if ("beep")
			message = "<B>[src]</B> ��������."
			m_type = 2

		if ("blink")
			message = "<B>[src]</B> �������." //goddamn it mmi pls no
			m_type = 1

		if ("boop")
			message = "<B>[src]</B> ��������."
			m_type = 2

		if ("flash")
			message = "���������� �� <B>[src]</B> ������."
			m_type = 1

		if ("notice")
			message = "<B>[src]</B> ����� ������� ������."
			m_type = 2

		if ("whistle")
			message = "<B>[src]</B> �����."
			m_type = 2

		if ("help")
			src << "������ ������ ��&#255; ���. �� ������ ������������ ��, ������ \"*emote\" � \"say\":\nalarm, alert, beep, blink, boop, flash, notice, whistle"

		else
			src << "<span class='notice'>�������������&#255; �����&#255; '[act]'. �������� \"*help\" � \"say\" ��&#255; ������� ������.</span>"

	if (message)
		log_emote("[ckey]/[name] : [message]")

		for(var/mob/M in dead_mob_list)
			if (!M.client || istype(M, /mob/new_player))
				continue //skip monkeys, leavers, and new_players
			if(M.stat == DEAD && (M.client && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT)) && !(M in viewers(src,null)))
				M.show_message(message)

		if (m_type & 1)
			visible_message(message)
		else if (m_type & 2)
			audible_message(message)
