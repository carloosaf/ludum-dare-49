extends Enemy

func _init():
	health = 250
	damage = 40
	velocity = 30
	
	ass = load("res://assets/sprites/enemies/tanque_ass.png")
	side = load("res://assets/sprites/enemies/tanque.png")

func _ready():
	get_node("../RotationPoint").connect("rotate", self, "_change_sprite")
