extends Control

const ADMIN := preload("res://scenes/admin.tscn")
const MANUAL := preload("res://scenes/manual.tscn")
const REGLAS := preload("res://scenes/reglas.tscn")

var id_master: int = 0
var orden: Array = [] # { "id": int, "dt": int }

func _ready() -> void:
	randomize()
	abrir()

func guardar() -> void:
	var archivo := FileAccess.open("user://config.txt", FileAccess.WRITE)
	if archivo == null:
		return
	var data: Dictionary = {
		"id_master": id_master,
		"orden": orden
	}
	archivo.store_string(JSON.stringify(data, "\t"))
	archivo.close()

func abrir() -> void:
	if not FileAccess.file_exists("user://config.txt"):
		return
	var archivo := FileAccess.open("user://config.txt", FileAccess.READ)
	var data: Dictionary = JSON.parse_string(archivo.get_as_text())
	archivo.close()
	id_master = int(data.get("id_master", id_master))
	orden = data.get("orden", [])

func get_new_id() -> int:
	id_master += 1
	guardar()
	return id_master

func _on_btn_admin_pressed() -> void:
	var admin := ADMIN.instantiate()
	add_child(admin)

func _on_btn_habili_pressed() -> void:
	var manual := MANUAL.instantiate()
	add_child(manual)

func _on_btn_reglas_pressed() -> void:
	var reglas := REGLAS.instantiate()
	add_child(reglas)

# ordenamiento de monigotes en Admin

func set_orden(ind: int) -> void:
	for item in orden:
		if item["id"] == ind:
			item["dt"] = int(Time.get_unix_time_from_system())
			return
	orden.append({ "id": ind, "dt": int(Time.get_unix_time_from_system()) })

func get_orden() -> Array:
	orden.sort_custom(func(a, b): return a["dt"] > b["dt"])
	var inds: Array = []
	for item in orden:
		inds.append(item["id"])
	return inds

func remove_orden(inds: Array) -> void:
	# inds contiene los ind que deben permanecer
	var new_orden: Array = []
	for item in orden:
		if item["id"] in inds:
			new_orden.append(item)
	orden = new_orden
	guardar()
