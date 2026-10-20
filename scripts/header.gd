extends VBoxContainer

func set_data(monigote: Node) -> void:
	$Fnd1/Cnt/Nombre.text = monigote.get_nombre()
