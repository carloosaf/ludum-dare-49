extends Path2D


export var spawn = [[5, "res://src/actors/enemies/test_enemy.tscn"],
					[2, "res://src/actors/enemies/test_enemy2.tscn"]]


func _ready():
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
