extends Panel

var habilis: Array = [
	"Herramientas", "Clases o Roles", "Elementos", "Otras Extra"
]
var ind: int = 0

func _ready() -> void:
	cambio()

func cambio(suma := 0) -> void:
	ind += suma
	if ind >= habilis.size():
		ind = 0
	elif ind < 0:
		ind = habilis.size() - 1
	$Selector/Cnt/Data.text = habilis[ind]
	for ficha in $Scroll/Cont.get_children():
		ficha.queue_free()
	var items: Array = []
	match ind:
		0:
			items = $Habilidades.get_rols()
		1:
			items = $Habilidades.get_clases()
		2:
			items = $Habilidades.get_elementos()
		3:
			items = $Habilidades.get_extras()
	for item in items:
		$Scroll/Cont.add_child(item.duplicate())

func _on_btn_l_pressed() -> void:
	cambio(-1)

func _on_btn_r_pressed() -> void:
	cambio(1)

func _on_btn_salir_pressed() -> void:
	queue_free()

func _on_btn_azar_pressed() -> void:
	var sel: int = randi_range(0, $Scroll/Cont.get_child_count() - 1)
	var i: int = 0
	for ficha in $Scroll/Cont.get_children():
		if i == sel:
			ficha.modulate = Color("ffff64")
		else:
			ficha.modulate = Color.WHITE
		i += 1
