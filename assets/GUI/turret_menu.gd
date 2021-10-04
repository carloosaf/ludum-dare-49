extends Control

signal any_button_pressed

func _ready():
	$test_turret.connect("pressed", self, "_on_TurretMenuButton_pressed", ["res://src/actors/turrets/test_turret.tscn"])
	$test_turret2.connect("pressed", self, "_on_TurretMenuButton_pressed", ["res://src/actors/turrets/test_turret.tscn"])

func _on_TurretMenuButton_pressed(path):
	emit_signal("any_button_pressed", path)
