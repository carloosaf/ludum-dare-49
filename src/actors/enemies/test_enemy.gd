extends Enemy


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var type = load("res://src/actors/enemies/test_enemy.gd")
	var instance = type.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
