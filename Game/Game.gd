extends Node2D


export var title = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2(0,1))
	add_child(load("res://EndScreen.tscn").instance())
	
	pass # Replace with function body.



func win_game():
	$EndScreen.win_game()
	pass


func lose_game():
	$EndScreen.lose_game()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
