extends VBoxContainer

func set_data(monigote: Node) -> void:
	# nombre
	$Fnd1/Cnt/Nombre.text = monigote.get_nombre()
	# datos basicos
	var header: Dictionary = monigote.get_header()
	$Fnd1/Cnt/Cnt/A/Genero.text = "Gen: " + header["genero"]
	$Fnd1/Cnt/Cnt/A/Orient.text = "Ori: " + header["orientacion"]
	$Fnd1/Cnt/Cnt/A/Clase.text = "Cls: " + header["clase"]
	$Fnd1/Cnt/Cnt/B/Element.text = "Ele: " + header["elemento"]
	$Fnd1/Cnt/Cnt/B/Emocion.text = "Emo: " + header["emocion"]
	$Fnd1/Cnt/Cnt/B/Grupo.text = header["grupo"]
	# estadisticas
	var estadisticas: Dictionary = monigote.get_estadisticas()
	$Fnd2/Cnt/Cnt/A/Vida.text = "vida: " + str(estadisticas["vida"])
	$Fnd2/Cnt/Cnt/A/Defensa.text = "Defe: " + str(estadisticas["defensa"])
	$Fnd2/Cnt/Cnt/A/Intelige.text = "Inte: " + str(estadisticas["inteligencia"])
	$Fnd2/Cnt/Cnt/B/Movim.text = "Movi: " + str(estadisticas["movimiento"])
	$Fnd2/Cnt/Cnt/B/Ataque.text = "Ataq: " + str(estadisticas["ataque"])
	$Fnd2/Cnt/Cnt/B/Distancia.text = "Dist: " + str(estadisticas["distancia"])
