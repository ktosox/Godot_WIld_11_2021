extends Particles2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	lifetime += randf()
	$Timer.start(randf())
	var col
	match randi()%5:
		0:
			col = Color(0.560784, 0.12549, 1)
			pass
		1:
			col = Color(0.12549, 0.980392, 1)
			pass
		2:
			col = ColorN("white")
			pass
		3:
			col = Color(0.12549, 0.466667, 1)
			pass
		4:
			col = Color(0.12549, 1, 0.345098)
			pass
	self_modulate = col
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	emitting = true
	pass # Replace with function body.
