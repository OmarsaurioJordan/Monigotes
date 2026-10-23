extends VBoxContainer

var id: int = 0 # del monigote

func set_data(monigote: Node) -> void:
	id = monigote.get_id()
	$Fnd/Cnt/Nombre.text = monigote.get_nombre()
	var data: Dictionary = monigote.get_actualiza()
	$Fnd/Cnt/Fondo/Cabeza.texture = data["cabeza_texture"]
	$Fnd/Cnt/Fondo/Cabeza.frame = data["cabeza_frame"]
	$Fnd/Cnt/Fondo/Cabeza/Emocion.frame = data["emocion_frame"]
	$Fnd/Cnt/Fondo/Cabeza/PeloFem.frame = data["pelofem_frame"]
	$Fnd/Cnt/Fondo/Cabeza/PeloFem.self_modulate = data["pelofem_color"]
	$Fnd/Cnt/Fondo/Cabeza/PeloFem.visible = data["pelofem_visible"]
	$Fnd/Cnt/Fondo/Cabeza/PeloMas.frame = data["pelomas_frame"]
	$Fnd/Cnt/Fondo/Cabeza/PeloMas.self_modulate = data["pelomas_color"]
	$Fnd/Cnt/Fondo/Cabeza/PeloMas.visible = data["pelomas_visible"]
	$Fnd/Cnt/Fondo/Cabeza/Clase.frame = data["clase_frame"]
	$Fnd/Cnt/Fondo/Cabeza/Rol.frame = data["rol_frame"]
	$Fnd/Cnt/Fondo.self_modulate = data["fondo_color"]

func get_boton() -> Node:
	return $Fnd/Cnt/BtnVer

func get_id() -> int:
	return id
