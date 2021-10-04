extends Enemy

var ass = preload("res://assets/sprites/tanque_ass.png")
var side = preload("res://assets/sprites/tanque.png")
var cnt = 0
var damage

func _ready():
	get_node("../RotationPoint").connect("rotate", self, "_change_sprite")
	damage = 10

#func _fixed_process(delta):
#	if cnt == 5:
#		print("Pathfollow =" + (rotation_degrees as String))
#		print("Body =" + ($Body.rotation_degrees as String))
#	cnt = (cnt + 1) % 6

func _change_sprite(body):
		body.get_child(1).texture = ass
		body.get_child(1).rotation_degrees = 90
