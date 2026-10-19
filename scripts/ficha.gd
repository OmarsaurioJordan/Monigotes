extends Panel

const ELECTION := preload("res://scenes/elect.tscn")
const NOMENCLA := preload("res://scenes/nomencla.tscn")
const BTN_OK := preload("res://scenes/btn_ok.tscn")

func _ready() -> void:
	$BtnAzar.visible = false
	init_editor()

func init_editor() -> void:
	$BtnAzar.visible = true
	$Scroll/Cont.add_child(NOMENCLA.instantiate())
	for item in $Fondo/Monigote.get_item_keys():
		var election := ELECTION.instantiate()
		$Scroll/Cont.add_child(election)
		election.init(item, $Fondo/Monigote)
	$Scroll/Cont.add_child(BTN_OK.instantiate())

func _on_btn_salir_pressed() -> void:
	queue_free()

func _on_btn_azar_pressed() -> void:
	for elect in get_tree().get_nodes_in_group("election"):
		elect.azar()
