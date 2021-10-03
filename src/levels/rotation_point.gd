extends Area2D

signal rotate

func _on_Rotate_body_entered(body):
	if body.is_in_group("enemies"):
		emit_signal("rotate")
