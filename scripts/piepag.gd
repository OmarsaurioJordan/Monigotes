extends VBoxContainer

const LIMITE: float = 5.0

var reloj: float = 0.0
var pulsado: bool = false
var ficha: Node = null

func _ready() -> void:
	ficha = get_tree().get_nodes_in_group("ficha")[0]

func _process(delta: float) -> void:
	ficha.modulate = Color.WHITE.lerp(Color.BLACK, (reloj / LIMITE) * 0.5)
	if pulsado:
		reloj += delta
		if reloj >= LIMITE:
			ficha.get_monigote().eliminar()
			for admin in get_tree().get_nodes_in_group("admin"):
				admin.carga_todo()
			ficha._on_btn_salir_pressed()

func set_codigo(codigo: String) -> void:
	$Fnd/Cnt/Codigo.text = codigo

func _on_btn_delete_button_down() -> void:
	pulsado = true
	reloj = 0.0

func _on_btn_delete_button_up() -> void:
	pulsado = false
	reloj = 0.0
