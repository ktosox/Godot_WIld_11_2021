extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ball_body_entered(body):
	if body.is_class("RigidBody2D"):
		if body.get_collision_layer_bit(1) :
			body.kill()
			pass
	pass # Replace with function body.
