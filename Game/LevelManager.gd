extends Node

var level = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reset_level():
	get_tree().change_scene("res://Levels/Level"+String(level)+".tscn")
	pass


func next_level():
	level += 1
	print(level)
	reset_level()
	pass
