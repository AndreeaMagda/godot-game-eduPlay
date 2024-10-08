extends Node

# Array cu calea imaginilor pentru fiecare față a zărului
var dice_faces = [
	"res://assets/imag/dice1.png",
	"res://assets/imag/dice2.png",
	"res://assets/imag/dice3.png",
	"res://assets/imag/dice4.png",
	"res://assets/imag/dice5.png",
	"res://assets/imag/dice6.png"
]

# Referință la Sprite-ul din scenă
@onready var dice = $DiceFace  # Folosește @onready în Godot 4
@onready var pawn = get_parent().get_node("veverita")

func _ready():
	# Detectează când se dă click pe zăr
	$Button.pressed.connect(_on_dice_clicked)  # Schimbă semnătura conectării

# Funcție apelată când se dă click pe zăr
func _on_dice_clicked():
	# Generează un număr aleator între 1 și 6
	var random_value = randi() % 6 + 1
	
	# Schimbă textura sprite-ului în funcție de numărul generat
	dice.texture = load(dice_faces[random_value - 1])
	
	# Afișează numărul generat în consolă (opțional)
	print("Numărul generat este: ", random_value)
	
	# Mută veverita în funcție de numărul generat
	pawn.move_veverita(random_value)  # Apel la funcția move_veverita
