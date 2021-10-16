extends Node

class_name Lvl

onready var path = $World/Path2D
onready var spawn_rate = $World/Path2D/SpawnRate
var spawn = [[]]

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
			path.add_child(instance)
			yield(spawn_rate, "timeout")
	finished = true
