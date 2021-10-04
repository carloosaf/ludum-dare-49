extends Enemy

var ass = preload("res://assets/sprites/enemies/tanque_ass.png")
var side = preload("res://assets/sprites/enemies/tanque.png")
var damage = 20

func _ready():
	velocity = 50
	get_node("../RotationPoint").connect("rotate", self, "_change_sprite")

func change_sprite():
	if $Body/Sprite.texture == side:
		$Body/Sprite.texture = ass
		$Body/Sprite.rotation_degrees = 90
	else: 
		$Body/Sprite.texture = side
		$Body/Sprite.rotation_degrees = 180