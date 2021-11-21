extends RigidBody2D


var direction = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$AnimatedSprite.scale.y = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY_VECTOR).y
	pass


func _on_BeeBoy_body_entered(body):
	if body.is_class("RigidBody2D"):
		if body.get_collision_layer_bit(1) :
			body.kill()
			linear_velocity = Vector2(0,0)
			angular_velocity = 0
	else:
		#apply_impulse(Vector2.ZERO,Vector2(-100*direction,0))
		linear_velocity.x = 35 * direction
		
		direction *= -1
		$AnimatedSprite.scale.x = direction
	pass # Replace with function body.
