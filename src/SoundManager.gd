extends Node

var available = []
var queue = []

func _ready():
	for _i in self.get_children():
		available.append(_i)
		_i.connect("finished", self, "_on_AS_finished", [_i])
	print(available)

func _process(delta):
	if not available.empty() && not queue.empty():
		var AS = available.pop_back()
		AS.stream = load((queue.pop_front()))
		AS.play()


func queue_sound(sound):
	queue.append(sound)

func _on_AS_finished(AS):
	available.append(AS)
