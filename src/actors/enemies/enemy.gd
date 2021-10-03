extends PathFollow2D

class_name Enemy

func follow(delta):
	set_offset(get_offset() + 100 * delta)


func _process(delta):
	follow(delta)
