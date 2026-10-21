extends Node2D

const SPEED_ANIMA: float = 0.5
const AMPLI_ANIMA: float = 3.0

var id: int = 0
var nombre: String = ""
var items: Dictionary = {
	"genero": Master.GENERO.MUJER,
	"orientacion": Master.ORIENTACION.HETEROSEX,
	"elemento": Master.ELEMENTO.NINGUNO,
	"piel": Master.PIEL.MESTIZA,
	"pelo": Master.PELO_F.MEDIANO,
	"color_pelo": Master.COLOR.NEGRO,
	"emocion": Master.EMOCION.NORMAL,
	"traje": Master.TRAJE.CONJUNTO,
	"torso": Master.TORSO_F.CAMISA,
	"color_torso": Master.COLOR.BLANCO,
	"bajo": Master.BAJO_F.CALZON,
	"color_bajo": Master.COLOR.BLANCO,
	"grupo": Master.GRUPO.GRUPO_A,
	"uniforme": Master.UNIFORME_A.FEMENINO,
	"clase": Master.CLASE.NADA,
	"rol": Master.ROL.NINGUNA,
	"color_fondo": Master.COLOR.BLANCO
}

var speed: Array = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
var anima: Array = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

func _ready() -> void:
	for s in range(speed.size()):
		speed[s] = SPEED_ANIMA + randf_range(-0.1, 0.1)
		anima[s] = randf()
	actualizar()

func _process(delta: float) -> void:
	# mover la marca temporal de animacion
	for s in range(speed.size()):
		anima[s] += speed[s] * delta
		while anima[s] > 1:
			anima[s] -= 1.0
	# colocar la animacion en el monigote
	$Visual/Cabeza.position.y = AMPLI_ANIMA * sin(2.0 * PI * anima[0])
	$Visual/Clase.position.x = AMPLI_ANIMA * sin(2.0 * PI * anima[1])
	$Visual/Clase.position.y = AMPLI_ANIMA * sin(2.0 * PI * anima[2])
	$Visual/Rol.position.x = AMPLI_ANIMA * sin(2.0 * PI * anima[3])
	$Visual/Rol.position.y = AMPLI_ANIMA * sin(2.0 * PI * anima[4])
	$Visual.scale = Vector2(
		1.0 + 0.015 * sin(2.0 * PI * anima[5]),
		1.0 + 0.015 * cos(2.0 * PI * anima[5])
	)

# set y get functions

func get_items() -> Dictionary:
	return items.duplicate(true)

func get_estadisticas() -> Dictionary:
	return {
		"vida": 1,
		"defensa": 1,
		"inteligencia": 1,
		"movimiento": 1,
		"ataque": 1,
		"distancia": 1
	}

func get_actualiza() -> Dictionary:
	var ccc = [
		Color.WHITE,
		Color(0.724, 0.714, 0.321, 1.0),
		Color(0.231, 0.384, 0.801, 1.0),
		Color(0.247, 0.523, 0.259, 1.0),
		Color(0.609, 0.255, 0.202, 1.0)
	]
	return {
		"cabeza_texture": $Visual/Cabeza.texture,
		"cabeza_frame": $Visual/Cabeza.frame,
		"emocion_frame": $Visual/Cabeza/Emocion.frame,
		"pelofem_frame": $Visual/Cabeza/PeloFem.frame,
		"pelofem_color": $Visual/Cabeza/PeloFem.self_modulate,
		"pelofem_visible": $Visual/Cabeza/PeloFem.visible,
		"pelomas_frame": $Visual/Cabeza/PeloMas.frame,
		"pelomas_color": $Visual/Cabeza/PeloMas.self_modulate,
		"pelomas_visible": $Visual/Cabeza/PeloMas.visible,
		"clase_frame": $Visual/Clase.frame,
		"rol_frame": $Visual/Rol.frame,
		"fondo_color": Color.WHITE.lerp(ccc[items["elemento"]], 0.25)
	}

func get_header() -> Dictionary:
	var grupo: String = "Sin Uniforme"
	if not is_conjunto():
		if is_grupo_a():
			grupo = "A, " + Master.NAME_UNIFORME_A[items["uniforme"]]
		else:
			grupo = "B, " + Master.NAME_UNIFORME_B[items["uniforme"]]
	return {
		"genero": Master.NAME_GENERO[items["genero"]],
		"orientacion": Master.NAME_ORIENTACION[items["orientacion"]],
		"clase": Master.NAME_CLASE[items["clase"]],
		"elemento": Master.NAME_ELEMENTO[items["elemento"]],
		"emocion": Master.NAME_EMOCION[items["emocion"]],
		"grupo": grupo
	}

func get_id() -> int:
	return id

func get_nombre() -> String:
	return nombre

func set_nombre(el_nombre: String) -> void:
	nombre = nombre_ok(el_nombre)

func get_item_keys() -> Array:
	return items.keys()

func get_item_data(item: String) -> int:
	return items.get(item, 0)

func set_item_data(item: String, data: int) -> void:
	if items.has(item):
		items.set(item, data)
		actualizar()

func is_fem() -> bool:
	return items["genero"] == Master.GENERO.MUJER

func is_grupo_a() -> bool:
	return items["grupo"] == Master.GRUPO.GRUPO_A

func is_conjunto() -> bool:
	return items["traje"] == Master.TRAJE.CONJUNTO

# funciones principales

func actualizar() -> void:
	# varias cosas
	$Visual/Cuerpo/TorsoFem.frame = items["torso"]
	$Visual/Cuerpo/TorsoMas.frame = items["torso"]
	$Visual/Cuerpo/BajoFem.frame = items["bajo"]
	$Visual/Cuerpo/BajoMas.frame = items["bajo"]
	$Visual/Cuerpo/VestUno.frame = items["uniforme"]
	$Visual/Cuerpo/VestDos.frame = items["uniforme"]
	$Visual/Cabeza/PeloFem.frame = items["pelo"]
	$Visual/Cabeza/PeloMas.frame = items["pelo"]
	$Visual/Cabeza/Emocion.frame = items["emocion"]
	$Visual/Rol.frame = items["rol"]
	$Visual/Clase.frame = items["clase"]
	# segun genero y tipo de vestimenta
	$Visual/Cuerpo.frame = 1 if is_fem() else 7
	$Visual/Cabeza.frame = 0 if is_fem() else 6
	$Visual/Cabeza/PeloFem.visible = is_fem()
	$Visual/Cuerpo/BajoFem.visible = is_fem() and is_conjunto()
	$Visual/Cuerpo/TorsoFem.visible = is_fem() and is_conjunto()
	$Visual/Cabeza/PeloMas.visible = not is_fem()
	$Visual/Cuerpo/BajoMas.visible = not is_fem() and is_conjunto()
	$Visual/Cuerpo/TorsoMas.visible = not is_fem() and is_conjunto()
	$Visual/Cuerpo/VestUno.visible = not is_conjunto() and is_grupo_a()
	$Visual/Cuerpo/VestDos.visible = not is_conjunto() and not is_grupo_a()
	$Visual/Cuerpo/VestUno.frame = items["uniforme"] * 2 + (0 if is_fem() else 1)
	$Visual/Cuerpo/VestDos.frame = items["uniforme"] * 2 + (0 if is_fem() else 1)
	# color de piel
	var la_piel := load("res://sprites/moni" + str(items["piel"] + 1) + ".png")
	$Visual/Cuerpo.texture = la_piel
	$Visual/Cabeza.texture = la_piel
	$Visual/Cuerpo/Genital.texture = la_piel
	# colores en RGB
	var ccc: Color = Color.WHITE.lerp(Master.COLOR_RGB[items["color_torso"]], 0.85)
	$Visual/Cuerpo/TorsoFem.self_modulate = ccc
	$Visual/Cuerpo/TorsoMas.self_modulate = ccc
	ccc = Color.WHITE.lerp(Master.COLOR_RGB[items["color_bajo"]], 0.85)
	$Visual/Cuerpo/BajoFem.self_modulate = ccc
	$Visual/Cuerpo/BajoMas.self_modulate = ccc
	ccc = Color.WHITE.lerp(Master.COLOR_RGB[items["color_pelo"]], 0.85)
	$Visual/Cabeza/PeloFem.self_modulate = ccc
	$Visual/Cabeza/PeloMas.self_modulate = ccc
	for fondo in get_tree().get_nodes_in_group("fondo"):
		ccc = Color.WHITE.lerp(Master.COLOR_RGB[items["color_fondo"]], 0.5)
		fondo.self_modulate = ccc
		fondo.get_node("Suelo").self_modulate = ccc
		fondo.get_node("PartTierra").visible =\
			items["elemento"] == Master.ELEMENTO.TIERRA
		fondo.get_node("PartAgua").visible =\
			items["elemento"] == Master.ELEMENTO.AGUA
		fondo.get_node("PartAire").visible =\
			items["elemento"] == Master.ELEMENTO.AIRE
		fondo.get_node("PartFuego").visible =\
			items["elemento"] == Master.ELEMENTO.FUEGO
	#presencia de genital
	$Visual/Cuerpo/Genital.visible = not is_fem() and (
		($Visual/Cuerpo/BajoMas.visible and $Visual/Cuerpo/BajoMas.frame == 0) or
		($Visual/Cuerpo/VestDos.visible and $Visual/Cuerpo/VestDos.frame == 11)
	)

func crear_nuevo() -> void:
	var ctrl: Node = get_tree().get_nodes_in_group("control")[0]
	id = ctrl.get_new_id()
	guardar()

func guardar() -> bool:
	var archivo := FileAccess.open("user://p_" + str(id) + ".txt", FileAccess.WRITE)
	if archivo == null:
		return false
	var data: String = exportar()
	archivo.store_string(data)
	archivo.close()
	return true

func abrir(el_id: int) -> bool:
	id = el_id
	if not FileAccess.file_exists("user://p_" + str(id) + ".txt"):
		return false
	var archivo := FileAccess.open("user://p_" + str(id) + ".txt", FileAccess.READ)
	var data: String = archivo.get_as_text().replace("\n", "")
	archivo.close()
	importar(data)
	return true

func exportar() -> String:
	var codigo: String = "?"
	if nombre.replace(" ", "_") != "":
		codigo = nombre.replace(" ", "_")
	for item in items:
		codigo += "," + str(items[item])
	return codigo

func importar(codigo: String) -> bool:
	var data: Array = codigo.split(",")
	if data.size() == 1 + items.size():
		var i := 1
		for item in items:
			if data[i].is_valid_int():
				items[item] = data[i].to_int()
			else:
				return false
			i += 1
		nombre = nombre_ok(data[0])
		actualizar()
		return true
	return false

func eliminar() -> bool:
	if not FileAccess.file_exists("user://p_" + str(id) + ".txt"):
		return false
	var error := DirAccess.remove_absolute(
		ProjectSettings.globalize_path("user://p_" + str(id) + ".txt")
	)
	return error == OK

# herramientas

func nombre_ok(el_nombre: String) -> String:
	var msk := "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789áéíóúÁÉÍÓÚ _"
	var txt: String = ""
	for chr in el_nombre:
		if msk.contains(chr):
			txt += chr
	txt = txt.strip_edges().replace("_", " ")
	if txt.length() > Master.NAME_LIMIT:
		txt = txt.substr(0, Master.NAME_LIMIT)
	return txt
