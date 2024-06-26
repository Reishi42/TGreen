/datum/admins/proc/create_object(var/mob/user)
	/var/static/create_object_html = null
	if (!create_object_html)
		var/objectjs = null
		objectjs = list2text(typesof(/obj), ";")
		create_object_html = file2text('html/create_object.html')
		create_object_html = replacetext_char(create_object_html, "null /* object types */", "\"[objectjs]\"")

	user << browse(replacetext_char(create_object_html, "/* ref src */", "\ref[src]"), "window=create_object;size=425x475")

/datum/admins/proc/quick_create_object(mob/user)
	var/static/list/create_object_forms = list(
	/obj,/obj/structure,/obj/effect,/obj/item,/obj/item/clothing,
	/obj/item/weapon/reagent_containers/food,/obj/item/weapon,
	/obj/item/weapon/gun,/obj/machinery,/obj/item/stack,/obj/mecha)

	var/path = input("Select the path of the object you wish to create.", "Path", /obj) in create_object_forms
	var/html_form = create_object_forms[path]

	if (!html_form)
		var/objectjs = list2text(typesof(path), ";")
		html_form = file2text('html/create_object.html')
		html_form = replacetext_char(html_form, "Create Object", "Create [path]")
		html_form = replacetext_char(html_form, "null /* object types */", "\"[objectjs]\"")
		create_object_forms[path] = html_form

	user << browse(replacetext_char(html_form, "/* ref src */", "\ref[src]"), "window=qco[path];size=425x475")
