extends Node2D

onready var path : Path2D = get_tree().root.get_node("Path")
onready var area : Area2D = $Area2D
onready var raycast : RayCast2D = $RayCast2D
onready var cooldown_timer : Timer = $turret_cooldown

class_name Turret

export var turret_range : float = 50
export var turret_cadence : float = 0.5
export var turret_damage : float = 1

var shot : bool = false				## if true -> cooldown 
var projectile						## load scene of proyectile
var target_queue = []				## all enemies inside range 
var target							

func _physics_process(delta):
	if target_queue.size() != 0:
		_check_enemies()		
	if target != null:					## shoot
		if !is_instance_valid(target):
			target = null
			print("Fuera")
			return
		_point_towards(target)
		_shoot(target)
	else:					
		_idle()
		
func _shoot(target ):
	if !shot:
		cooldown_timer.start(turret_cadence)
		shot = true
		
func _point_towards(enemy ):		## puede uno calentarse y poner lerp 
	raycast.look_at(enemy.position)					
	
func _idle():
	pass
	
func _check_enemies():
	var tmp_enemy
	if target_queue.size() > 0:
		tmp_enemy = target_queue[0]
		for enemy in target_queue:
			if enemy.offset < tmp_enemy.offset:
				tmp_enemy = enemy
		target = tmp_enemy
		
func _on_Area2D_body_entered(body:KinematicBody2D):
	if body.is_in_group("enemies"):
		target_queue.push_back(body.get_parent())
		
func _on_Area2D_body_exited(body):
	if body.get_parent() == target:
		target = null
	target_queue.remove(target_queue.find(body.get_parent()))

func _on_turret_cooldown_timeout():
	shot = false

func _on_CheckButton_toggled(button_pressed):
	self.set_physics_process(button_pressed)
	
