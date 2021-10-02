extends Enemy

var ass = preload("res://assets/sprites/tanque_ass.png")
var tanque = preload("res://assets/sprites/tanque.png")
var cnt = 0

func _process(delta):
	_rotate_sprite()

	if cnt == 5:
		print("Pathfollow =" + (rotation_degrees as String))
		print("Body =" + ($Body.rotation_degrees as String))
	cnt = (cnt + 1) % 6

func _rotate_sprite():
	if rotation_degrees >= -180 + 45:
		$Body/Sprite.texture = ass
		$Body/Sprite.rotation_degrees = 90
	else:
		$Body/Sprite.texture = tanque
		$Body/Sprite.rotation_degrees = 180
		
