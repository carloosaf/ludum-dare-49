extends CanvasLayer

onready var AnimationP := $Control/AnimationPlayer
var scene:String

func load_scene(new_scene, anim):
	scene = new_scene
	AnimationP.play(anim)

func _new_scene():
	get_tree().change_scene(scene)
