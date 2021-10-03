extends Enemy

var ass = preload("res://assets/sprites/tanque_ass.png")
var side = preload("res://assets/sprites/tanque.png")
var cnt = 0

func _ready():
	get_node("../Rotate").connect("rotate", self, "change_sprite")

#func _fixed_process(delta):
#	if cnt == 5:
#		print("Pathfollow =" + (rotation_degrees as String))
#		print("Body =" + ($Body.rotation_degrees as String))
#	cnt = (cnt + 1) % 6

func change_sprite():
	$Body/Sprite.texture = ass
	$Body/Sprite.rotation_degrees = 90
