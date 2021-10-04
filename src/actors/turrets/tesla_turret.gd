extends Node2D

export var stun_time : float = 2.5 ## secs

onready var area : Area2D 
onready var raycast : RayCast2D 
onready var cooldown_timer : Timer 
onready var stun_timer: Timer = $stun_cooldown
onready var stun_sprite: Timer = $stun_sprite_timer

export var turret_cadence : float = 1
export var turret_damage : int = 50

onready var bullet : AnimatedSprite = $AnimatedSprite
var stun = false
var stunned = []
var shot : bool = false				## if true -> cooldown 
var target_queue = []				## all enemies inside range 
var target	

func _ready():
	target = null
	turret_cadence = 5 
	bullet.visible = false
	bullet.stop()
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

func _idle():
	pass
	
func _shoot(target):
	if !shot:
		bullet.visible = true 
		bullet.play()
		stun_sprite.start(0.2)
		for enemy in target_queue:
			enemy.set_physics_process(false)
			stunned.push_back(enemy)
		shot = true	
		stun = true
		cooldown_timer.start(turret_cadence)
		stun_timer.start(stun_time)

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

func _on_stun_cooldown_timeout():
	stun = false
	for enemy in stunned:
		enemy.set_physics_process(true)
	stunned.clear()

func _on_stun_sprite_timer_timeout():
	bullet.stop()
	bullet.visible = false


func _on_OnOff_toggled(button_pressed):
	self.set_physics_process(button_pressed)
