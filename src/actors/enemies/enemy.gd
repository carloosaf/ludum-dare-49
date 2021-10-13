extends PathFollow2D

class_name Enemy

# Sprites
var ass
var side

# Stats
var health : float
var damage : float
var velocity :float

func follow(delta):
	set_offset(get_offset() + velocity * delta)

func _physics_process(delta):
	if health <= 0:
		queue_free()
	else:
		follow(delta)

func take_damage(damage: int):
	health = health - damage

func change_sprite(): 
	if $Body/Sprite.texture == side:
		$Body/Sprite.texture = ass
		$Body/Sprite.rotation_degrees = 90
	else: 
		$Body/Sprite.texture = side
		$Body/Sprite.rotation_degrees = 180
