extends Control

const ADMIN := preload("res://scenes/admin.tscn")
const MANUAL := preload("res://scenes/manual.tscn")

var id_master: int = 0

func _ready() -> void:
	randomize()
	abrir()

func guardar() -> void:
	var archivo := FileAccess.open("user://config.txt", FileAccess.WRITE)
	if archivo == null:
		return
	var data: Dictionary = {
		"id_master": id_master
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
