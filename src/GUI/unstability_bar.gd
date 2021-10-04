extends TextureProgress

onready var reactor = get_node("../../World/Reactor")


func _ready():
	reactor.connect("damaged_reactor", self, "_update_bar")

func _process(delta):
	value = reactor.unstability

func _update_bar():
	value = reactor.unstability
