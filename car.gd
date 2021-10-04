extends Enemy

var ass = preload("res://assets/sprites/enemies/coche_ass.png")
var side = preload("res://assets/sprites/enemies/coche.png")
var damage = 10

func _ready():
	velocity = 75
	get_node("../RotationPoint").connect("rotate", self, "_change_sprite")

func change_sprite():
	$Body/Sprite.texture = ass
	$Body/Sprite.rotation_degrees = 90
