extends Node2D

func _ready() -> void:
	randomize()
	show_tiro()

func _on_btn_tiro_pressed() -> void:
	if $TimFin.is_stopped():
		var f: float = randf_range(1.9, 2.1)
		$TimFin.start(f + 1.0)
		$TimDado.start(f)
		$TimNum.start(0.01)

func _on_tim_num_timeout() -> void:
	if not $TimDado.is_stopped():
		$TimNum.start(randf_range(0.05, 0.15))
		show_tiro()

func show_tiro() -> void:
		var chs: Array = $Fondo.get_children()
		for ch in chs:
			ch.visible = false
		chs.shuffle()
		chs[0].visible = true
