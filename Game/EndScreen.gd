extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var level_won = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept") and $CenterContainer.visible :
		_on_Button_pressed()

func win_game():
	level_won = true
	$CenterContainer.visible = true
	$CenterContainer/VBoxContainer/Label.text = "LEVEL COMPLETE"
	pass


func lose_game():
	$CenterContainer.visible = true
	$CenterContainer/VBoxContainer/Label.text = "CHICKY THE CHICKEN DIED, RIP"
	pass


func _on_Button_pressed():
	print("start next level")
	$ColorRect/AnimationPlayer.play("end")
	$CenterContainer/VBoxContainer/Button.visible = false
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"end":
			if level_won :
				LM.next_level()
				pass
			else:
				LM.reset_level()
				pass
			pass
		"start":
			pass
	pass # Replace with function body.
