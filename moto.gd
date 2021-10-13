extends Enemy

func _init():
	health = 50	
	damage = 10
	velocity = 150
	
	ass = load("res://assets/sprites/enemies/moto_ass.png")
	side = load("res://assets/sprites/enemies/moto.png")

func _ready():
	get_node("../RotationPoint").connect("rotate", self, "_change_sprite")
