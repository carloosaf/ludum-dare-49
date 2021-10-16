extends Enemy

func _init():
	health = 100
	damage = 50
	velocity = 40
	
	ass = load("res://assets/sprites/enemies/tanque_ass.png")
	side = load("res://assets/sprites/enemies/tanque.png")

func _ready():
	get_node("../RotationPoint").connect("rotate", self, "_change_sprite")
