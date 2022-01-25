extends Turret

var bullet = "res://src/actors/bullets/turret_bullet.tscn"

onready var raycast : RayCast2D = $RayCast2D
onready var cooldown_timer : Timer  = $turret_cooldown

export var turret_cadence : float = 0.5
export var turret_damage : int = 25

var shot : bool = false             ## if true -> cooldown 

func _physics_process(delta):
	if target_queue.size() != 0:
		_check_enemies()
	if target != null:            ## shoot
		if !is_instance_valid(target):
			target = null
		else:
			_point_towards(target)
			shoot(target)
	else:
		idle()

func shoot(target ):
	if !shot:
		cooldown_timer.start(turret_cadence)
		var b = load(bullet).instance()
		add_child(b)
		b.bullet_damage = turret_damage
		b.global_transform = raycast.get_node("canon").global_transform 
		if target.health <= 0:
			target_queue.remove(target_queue.find(target))
			target = null
		shot = true

func _on_turret_cooldown_timeout():
	shot = false

func _point_towards(enemy):          ## puede uno calentarse y poner lerp 
	raycast.look_at(enemy.position)

func _on_Area2D_body_entered(body:KinematicBody2D):
	if body.is_in_group("enemies"):
		target_queue.push_back(body.get_parent())

func _on_Area2D_body_exited(body):
	if body.get_parent() == target:
		target = null
	target_queue.remove(target_queue.find(body.get_parent()))

func _on_CheckButton_toggled(button_pressed):
	self.set_physics_process(button_pressed)
