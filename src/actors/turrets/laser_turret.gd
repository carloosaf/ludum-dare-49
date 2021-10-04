extends Node2D

export var bullet: PackedScene = preload("res://src/actors/bullets/laser_bullet.tscn")

onready var area : Area2D 
onready var raycast : RayCast2D  = $RayCast2D
onready var cooldown_timer : Timer 

class_name laser_turret

export var turret_cadence : float = 0.15
export var turret_damage : int = 3

var shot : bool = false				## if true -> cooldown 
var target_queue = []				## all enemies inside range 
var target							

var cnt = 0
var consumption = 5
onready var bullets = []

func _ready():
	area = $Area2D
	cooldown_timer = $turret_cooldown
	
func _physics_process(delta):
	if target_queue.size() != 0:
		_check_enemies()		
	if target != null:					## shoot
		if !is_instance_valid(target):
			target = null
			return
		_shoot(target)
	else:					
		_idle()
		
func _shoot(target ):
	if !shot:
		cooldown_timer.start(turret_cadence)
		for can in raycast.get_children():
			var b = bullet.instance()
			add_child(b)
			b.global_transform = can.global_transform
			b.bullet_damage = turret_damage

		if target.health <= 0:
			target_queue.remove(target_queue.find(target))
			target = null
		shot = true
		
						
	
func _idle():
	pass
	
func _check_enemies():
	var tmp_enemy
	if target_queue.size() > 0:
		tmp_enemy = target_queue[0]
		for enemy in target_queue:
			if enemy.offset > tmp_enemy.offset:
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
	
func _on_OnOff_toggled(button_pressed):
	self.set_physics_process(button_pressed)
