extends Control

signal any_button_pressed

func _ready():
	$Rectangle/Turret.connect("pressed", self, "_on_TurretMenuButton_pressed", ["res://src/actors/turrets/test_turret.tscn"])
	$Rectangle/Tesla.connect("pressed", self, "_on_TurretMenuButton_pressed", ["res://src/actors/turrets/test_turret.tscn"])
	$Rectangle/Laser.connect("pressed", self, "_on_TurretMenuButton_pressed", ["res://src/actors/turrets/test_turret.tscn"])

func _on_TurretMenuButton_pressed(path):
	emit_signal("any_button_pressed", path)
