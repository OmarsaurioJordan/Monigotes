extends Control

func get_ficha(ind: int, padre: Node) -> Node:
	for h in padre.get_children():
		if h.get_node("Cnt/Img").frame == ind:
			return h
	return null

func get_rol(ind: int) -> Node:
	return get_ficha(ind, $HabRol).duplicate(true)

func get_clase(ind: int) -> Node:
	return get_ficha(ind, $HabClase).duplicate(true)

func get_elemento(ind: int) -> Node:
	return get_ficha(ind, $HabElemento).duplicate(true)

func get_rols() -> Array:
	return $HabRol.get_children()

func get_clases() -> Array:
	return $HabClase.get_children()

func get_elementos() -> Array:
	return $HabElemento.get_children()

func new_separador() -> Node:
	return $Spr.duplicate()
