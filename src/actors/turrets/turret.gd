extends Node2D

class_name Turret

var target
var target_queue = []

func _ready():
	$OnOff.connect("toggle", self, "_on_OnOff_toggled")

func _check_enemies():
	var tmp_enemy
	if target_queue.size() > 0:
		tmp_enemy = target_queue[0]
		for enemy in target_queue:
			if enemy.offset > tmp_enemy.offset:
				tmp_enemy = enemy
		target = tmp_enemy

func idle():
	pass

func shoot(target):
	pass

func _on_OnOff_toggled(button_pressed):
	self.set_physics_process(button_pressed)
