extends Control

func get_ficha(ind: int, padre: Node, duplicada := false) -> Node:
	for h in padre.get_children():
		if h.get_node("Cnt/Img").frame == ind:
			if duplicada:
				return h.duplicate(true)
			return h
	return null

func get_rol(ind: int, duplicada := false) -> Node:
	return get_ficha(ind, $HabRol, duplicada)

func get_clase(ind: int, duplicada := false) -> Node:
	return get_ficha(ind, $HabClase, duplicada)

func get_elemento(ind: int, duplicada := false) -> Node:
	return get_ficha(ind, $HabElemento, duplicada)

func get_extra(ind: int, duplicada := false) -> Node:
	# ver Master.HAB_EXTRA para ind
	return get_ficha(ind, $HabExtra, duplicada)

func get_rols() -> Array:
	return $HabRol.get_children()

func get_clases() -> Array:
	return $HabClase.get_children()

func get_elementos() -> Array:
	return $HabElemento.get_children()

func get_extras() -> Array:
	return $HabExtra.get_children()

func new_separador() -> Node:
	return $Spr.duplicate()
