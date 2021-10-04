extends Enemy

var ass = preload("res://assets/sprites/enemies/moto_ass.png")
var side = preload("res://assets/sprites/enemies/moto.png")
var damage = 10

func _ready():
	velocity = 150
	get_node("../RotationPoint").connect("rotate", self, "_change_sprite")

func change_sprite():
	if $Body/Sprite.texture == side:
		$Body/Sprite.texture = ass
		$Body/Sprite.rotation_degrees = 90
	else: 
		$Body/Sprite.texture = side
		$Body/Sprite.rotation_degrees = 180