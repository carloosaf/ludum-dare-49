extends Path2D


export var spawn = [[10, "res://src/actors/enemies/test_enemy.tscn"]]


func _ready():
	spawn_enemies()

func spawn_enemies():
	var i = spawn[0]
	var type = load(i[1])
	for j in range(i[0]):
		var instance = type.instance()
		instance.set_offset(0)
		instance.loop = false
		add_child(instance)
		yield($SpawnRate, "timeout")
