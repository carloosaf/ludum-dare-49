extends Area2D

var bullet_damage
export var bullet_speed = 700

func _physics_process(delta):
	position += transform.x * bullet_speed * delta

func _on_test_bullet_body_entered(body):
	if body.is_in_group("enemies"):
		body.get_parent().take_damage(bullet_damage)
	self.queue_free()
