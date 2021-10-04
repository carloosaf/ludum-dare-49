extends Bullet 



func _on_turret_bullet_body_entered(body):
	if body.is_in_group("enemies"):
		body.get_parent().take_damage(bullet_damage)
	if !body.is_in_group("bullets"):
		self.queue_free()
