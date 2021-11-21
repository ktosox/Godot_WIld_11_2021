extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("ui_accept"):
		match rect_scale.y :
			1.0:
				rect_position.y = 170
				rect_scale.y = -1.0
				pass
			-1.0:
				rect_position.y = 70
				rect_scale.y = 1.0
				pass
	
		
	pass
