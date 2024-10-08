extends Node2D

var position_index = 0  # Indexul curent pe tablă
var path_nodes = []  # Array pentru a stoca nodurile NinePatchRect

@onready var start_patch = get_parent().get_node("Path/StartingPoint")  # Referință la NinePatchRect-ul de start

func _ready():
	# Obține toate nodurile NinePatchRect de pe tablă
	path_nodes = get_parent().get_node("Path").get_children()  # Acces direct la nodul Path

	# Plasează veverita pe NinePatchRect-ul de start
	position = start_patch.position

# Funcția care mută veverita
func move_veverita(steps: int):
	# Calculează noua poziție pe baza indexului curent
	position_index += steps

	# Asigură-te că nu depășești dimensiunile tablei
	position_index = clamp(position_index, 0, path_nodes.size() - 1)

	# Mută veverita la noua poziție
	position = path_nodes[position_index].position  # Mută veverita la poziția nodului
