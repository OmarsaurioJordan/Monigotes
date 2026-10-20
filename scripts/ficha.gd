extends Panel

const ELECTION := preload("res://scenes/elect.tscn")
const NOMENCLA := preload("res://scenes/nomencla.tscn")
const BTN_OK := preload("res://scenes/btn_ok.tscn")
const PIEPAG := preload("res://scenes/piepag.tscn")
const HEADER := preload("res://scenes/header.tscn")
const HABILIS := preload("res://scenes/habilidades.tscn")

func get_monigote() -> Node:
	return $Fondo/Monigote

func init_ficha(ind: int) -> void:
	$BtnAzar.visible = false
	if not $Fondo/Monigote.abrir(ind):
		queue_free()
	# cargar datos del monigote
	var header := HEADER.instantiate()
	$Scroll/Cont.add_child(header)
	header.set_data($Fondo/Monigote)
	# colocar habilidades
	var items = $Fondo/Monigote.get_items()
	var habilis := HABILIS.instantiate()
	add_child(habilis)
	var nodo: Node = habilis.get_elemento(items["elemento"])
	$Scroll/Cont.add_child(habilis.new_separador())
	$Scroll/Cont.add_child(nodo)
	nodo = habilis.get_clase(items["clase"])
	$Scroll/Cont.add_child(habilis.new_separador())
	$Scroll/Cont.add_child(nodo)
	nodo = habilis.get_rol(items["rol"])
	$Scroll/Cont.add_child(habilis.new_separador())
	$Scroll/Cont.add_child(nodo)
	habilis.queue_free()
	# poner pie de pagina
	var piepag := PIEPAG.instantiate()
	$Scroll/Cont.add_child(piepag)
	piepag.set_codigo($Fondo/Monigote.exportar())

func init_editor() -> void:
	$BtnAzar.visible = true
	$Scroll/Cont.add_child(NOMENCLA.instantiate())
	for item in $Fondo/Monigote.get_item_keys():
		var election := ELECTION.instantiate()
		$Scroll/Cont.add_child(election)
		election.init(item, $Fondo/Monigote)
	var btnOk := BTN_OK.instantiate()
	$Scroll/Cont.add_child(btnOk)
	btnOk.get_boton().pressed.connect(crear_monigote)

func crear_monigote() -> void:
	var nomencla: Node = $Scroll/Cont.get_children()[0]
	var nombre: String = $Fondo/Monigote.nombre_ok(nomencla.get_nombre())
	if nombre == "":
		$Scroll.scroll_vertical = 0
	else:
		$Fondo/Monigote.set_nombre(nombre)
		$Fondo/Monigote.crear_nuevo()
		for admin in get_tree().get_nodes_in_group("admin"):
			admin.carga_todo()
		queue_free()

func _on_btn_salir_pressed() -> void:
	queue_free()

func _on_btn_azar_pressed() -> void:
	for elect in get_tree().get_nodes_in_group("election"):
		elect.azar()
