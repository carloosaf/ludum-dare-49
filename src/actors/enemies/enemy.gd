extends PathFollow2D

class_name Enemy

var health: int = 100
export var velocity : float = 50

func follow(delta):
	set_offset(get_offset() + velocity * delta)



func _physics_process(delta):
	if health <= 0:
		queue_free()
	else:
		follow(delta)

func take_damage(damage: int):
	print("Au")
	health = health - damage
