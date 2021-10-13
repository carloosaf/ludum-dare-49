extends Enemy

func _init():
	health = 100	
	damage = 15
	velocity = 75
	
	ass = load("res://assets/sprites/enemies/coche_ass.png")	
	side = preload("res://assets/sprites/enemies/coche.png")

func _ready():
	get_node("../RotationPoint").connect("rotate", self, "_change_sprite")	
