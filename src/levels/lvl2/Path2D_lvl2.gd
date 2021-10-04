extends Path2D

export var spawn = [[3, "res://src/actors/enemies/car.tscn"],
					[1, "res://src/actors/enemies/tank.tscn"],
					[2, "res://src/actors/enemies/moto.tscn"],
					[1, "res://src/actors/enemies/tank.tscn"],
					[8, "res://src/actors/enemies/moto.tscn"]]
var finished = false

func _ready():
	yield(get_tree().create_timer(2.0), "timeout")
	spawn_enemies()

func _process(delta):
	if (len(get_tree().get_nodes_in_group("enemies")) == 0 and finished):
		scene_manager.load_scene("res://src/screens/main_menu.tscn", "fade")

func spawn_enemies():
	for i in spawn:
		var type = load(i[1])
		for j in range(i[0]):
			var instance = type.instance()
			instance.set_offset(0)
			instance.loop = false
			add_child(instance)
			yield($SpawnRate, "timeout")
	finished = true
