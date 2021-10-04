extends Path2D

export var spawn = [[2, "res://src/actors/enemies/car.tscn"],
					[2, "res://src/actors/enemies/tank.tscn"],
					[2, "res://src/actors/enemies/moto.tscn"]]


func _ready():
	yield(get_tree().create_timer(2.0), "timeout")
	spawn_enemies()

func spawn_enemies():
	for i in spawn:
		var type = load(i[1])
		for j in range(i[0]):
			var instance = type.instance()
			instance.set_offset(0)
			instance.loop = false
			add_child(instance)
			yield($SpawnRate, "timeout")
