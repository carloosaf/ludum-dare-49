extends Bullet

class_name Laser_bullet

func _ready():
	bullet_speed = 250

func _on_laser_bullet_body_entered(body):
	if body.is_in_group("enemies"):
		body.get_parent().take_damage(bullet_damage)
	self.queue_free()
