extends Panel

const FICHA := preload("res://scenes/ficha.tscn")
const FICHIN := preload("res://scenes/fichin.tscn")

func _ready() -> void:
	carga_todo()

func carga_todo() -> void:
	# primero limpia
	for fich in $Scroll/Cont.get_children():
		fich.queue_free()
	# luego busca la lista de indices validos
	var dir := DirAccess.open("user://")
	var indices := []
	if dir == null:
		return
	dir.list_dir_begin()
	var archivo := dir.get_next()
	while archivo != "":
		if not dir.current_is_dir():
			if archivo.begins_with("p_") and archivo.ends_with(".txt"):
				if archivo.replace("p_", "").replace(".txt", "").is_valid_int():
					indices.append(archivo.replace("p_", "").replace(".txt", "").to_int())
		archivo = dir.get_next()
	dir.list_dir_end()
	# despues comienza a leer uno por uno
	for ind in indices:
		if $Monigote.abrir(ind):
			var fichin := FICHIN.instantiate()
			$Scroll/Cont.add_child(fichin)
			fichin.set_data($Monigote)
			fichin.get_boton().pressed.connect(ver_ficha.bind(ind))
	ordenamiento()

func ordenamiento() -> void:
	var ctrl: Node = get_tree().get_nodes_in_group("control")[0]
	var orden: Array = ctrl.get_orden()
	var inds: Array = []
	for i in range(orden.size()):
		for fch in $Scroll/Cont.get_children():
			if fch.get_id() == orden[i]:
				$Scroll/Cont.remove_child(fch)
				orden[i] = fch
				inds.append(fch.get_id())
				break
	var huerfanos: Array = []
	for fch in $Scroll/Cont.get_children():
		$Scroll/Cont.remove_child(fch)
		huerfanos.append(fch)
	for ordn in orden:
		if ordn is Node:
			$Scroll/Cont.add_child(ordn)
	for hue in huerfanos:
		$Scroll/Cont.add_child(hue)
	ctrl.remove_orden(inds)

func ver_ficha(ind: int) -> void:
	var ficha := FICHA.instantiate()
	get_parent().add_child(ficha)
	ficha.init_ficha(ind)
	var ctrl: Node = get_tree().get_nodes_in_group("control")[0]
	ctrl.set_orden(ind)
	ordenamiento()

func _on_btn_salir_pressed() -> void:
	queue_free()

func _on_btn_nuevo_pressed() -> void:
	var ficha := FICHA.instantiate()
	get_parent().add_child(ficha)
	ficha.init_editor()

func _on_btn_import_pressed() -> void:
	get_viewport().gui_release_focus()
	if $Monigote.importar($Import/Cnt/Data.text):
		$Monigote.crear_nuevo()
		var ctrl: Node = get_tree().get_nodes_in_group("control")[0]
		ctrl.set_orden($Monigote.get_id())
		carga_todo()
		ver_ficha($Monigote.get_id())
	$Import/Cnt/Data.text = ""
