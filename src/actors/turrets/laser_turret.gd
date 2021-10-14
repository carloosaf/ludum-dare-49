extends Turret

export var bullet: PackedScene = preload("res://src/actors/bullets/laser_bullet.tscn")

onready var raycast : RayCast2D  = $RayCast2D #Cambiar el raycast por un node 2D o algo decente
onready var cooldown_timer : Timer 

export var turret_cadence : float = 0.15
export var turret_damage : int = 3

var shot : bool = false             ## if true -> cooldown 

func _ready():
	cooldown_timer = $turret_cooldown
	
func _physics_process(delta):
	if target_queue.size() != 0:
		_check_enemies()
	if target != null:                   ## shoot
		if !is_instance_valid(target):
			target = null
		else:
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

func _on_Area2D_body_entered(body:KinematicBody2D):
	if body.is_in_group("enemies"):
		target_queue.push_back(body.get_parent())

func _on_Area2D_body_exited(body):
	if body.get_parent() == target:
		target = null
	target_queue.remove(target_queue.find(body.get_parent()))

func _on_turret_cooldown_timeout():
	shot = false
