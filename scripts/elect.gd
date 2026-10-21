extends VBoxContainer

var item: String = ""
var monigote: Node = null
var ind: int = 0
var limite: int = 0

func init(nombre_item: String, monigote_origen: Node) -> void:
	item = nombre_item
	monigote = monigote_origen
	match item:
		"genero":
			$Fnd/Cnt/Titulo.text = "Género de Nacimiento"
			limite = Master.GENERO.size()
		"piel":
			$Fnd/Cnt/Titulo.text = "Color de Piel"
			limite = Master.PIEL.size()
		"orientacion":
			$Fnd/Cnt/Titulo.text = "Orientación Sexual"
			limite = Master.ORIENTACION.size()
		"elemento":
			$Fnd/Cnt/Titulo.text = "Elemento de Afinidad"
			limite = Master.ELEMENTO.size()
		"traje":
			$Fnd/Cnt/Titulo.text = "Tipo de Vestimenta"
			limite = Master.TRAJE.size()
		"torso":
			$Fnd/Cnt/Titulo.text = "Ropaje Superior"
			limite = Master.TORSO_F.size()
		"color_torso":
			$Fnd/Cnt/Titulo.text = "Color Ropaje Superior"
			limite = Master.COLOR.size()
		"bajo":
			$Fnd/Cnt/Titulo.text = "Ropaje Inferior"
			limite = Master.BAJO_F.size()
		"color_bajo":
			$Fnd/Cnt/Titulo.text = "Color Ropaje Inferior"
			limite = Master.COLOR.size()
		"uniforme":
			$Fnd/Cnt/Titulo.text = "Nombre del Uniforme"
			limite = Master.UNIFORME_A.size()
		"grupo":
			$Fnd/Cnt/Titulo.text = "Grupo del Uniforme"
			limite = Master.GRUPO.size()
		"emocion":
			$Fnd/Cnt/Titulo.text = "Emoción Facial"
			limite = Master.EMOCION.size()
		"pelo":
			$Fnd/Cnt/Titulo.text = "Corte de Pelo"
			limite = Master.PELO_F.size()
		"color_pelo":
			$Fnd/Cnt/Titulo.text = "Color del Pelo"
			limite = Master.COLOR.size()
		"rol":
			$Fnd/Cnt/Titulo.text = "Herramienta"
			limite = Master.ROL.size()
		"clase":
			$Fnd/Cnt/Titulo.text = "Clase o Rol"
			limite = Master.CLASE.size()
		"color_fondo":
			$Fnd/Cnt/Titulo.text = "Color del Fondo"
			limite = Master.COLOR.size()
	ind = monigote.get_item_data(item)
	cambio()

func azar() -> void:
	if item in ["orientacion"] and randf() < 0.9:
		ind = 0
	elif item in ["traje"] and randf() < 0.75:
		ind = 0
	elif item in ["clase", "rol"] and randf() < 0.25:
		ind = 0
	else:
		ind = randi_range(0, limite - 1)
	cambio()

func cambio(suma := 0) -> void:
	ind += suma
	if ind >= limite:
		ind = 0
	elif ind < 0:
		ind = limite - 1
	monigote.set_item_data(item, ind)
	for elect in get_tree().get_nodes_in_group("election"):
		elect.put_data()

func put_data():
	match item:
		"genero":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_GENERO[ind]
		"piel":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_PIEL[ind]
		"orientacion":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_ORIENTACION[ind]
		"elemento":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_ELEMENTO[ind]
		"traje":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_TRAJE[ind]
		"torso":
			if monigote.is_fem():
				$Fnd/Cnt/Cnt/Data.text = Master.NAME_TORSO_F[ind]
			else:
				$Fnd/Cnt/Cnt/Data.text = Master.NAME_TORSO_M[ind]
		"color_torso", "color_bajo", "color_pelo", "color_fondo":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_COLOR[ind]
		"bajo":
			if monigote.is_fem():
				$Fnd/Cnt/Cnt/Data.text = Master.NAME_BAJO_F[ind]
			else:
				$Fnd/Cnt/Cnt/Data.text = Master.NAME_BAJO_M[ind]
		"uniforme":
			if monigote.is_grupo_a():
				$Fnd/Cnt/Cnt/Data.text = Master.NAME_UNIFORME_A[ind]
			else:
				$Fnd/Cnt/Cnt/Data.text = Master.NAME_UNIFORME_B[ind]
		"grupo":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_GRUPO[ind]
		"emocion":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_EMOCION[ind]
		"pelo":
			if monigote.is_fem():
				$Fnd/Cnt/Cnt/Data.text = Master.NAME_PELO_F[ind]
			else:
				$Fnd/Cnt/Cnt/Data.text = Master.NAME_PELO_M[ind]
		"rol":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_ROL[ind]
		"clase":
			$Fnd/Cnt/Cnt/Data.text = Master.NAME_CLASE[ind]
	# ocultar tipo de traje
	if item in ["torso", "color_torso", "bajo", "color_bajo"]:
		visible = monigote.is_conjunto()
	if item in ["uniforme", "grupo"]:
		visible = not monigote.is_conjunto()

func _on_btn_l_pressed() -> void:
	cambio(-1)

func _on_btn_r_pressed() -> void:
	cambio(1)
