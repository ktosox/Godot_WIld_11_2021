extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity_dir = Vector2(0,1)

var block_input = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY_VECTOR) )
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept") and !block_input:
		$Camera2D.zoom.y *= -1
		$AnimatedSprite.scale.y *= -1
		gravity_dir.y *= -1
		Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, gravity_dir)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if abs(rotation)>0.01:
		rotation = clamp(rotation,-0.01,0.01)
	$Label.text = String(applied_torque)

	var dir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")) 
	if dir == 0:
		$AnimatedSprite.play("Idle")
	else:
		$AnimatedSprite.play("Move")
		$AnimatedSprite.scale.x = -dir
	if block_input:
		linear_velocity = Vector2(0,0)
	else:
		linear_velocity.x += dir * delta * 740
		linear_velocity.x = clamp(linear_velocity.x,-129,129)


	pass

func kill():
	gravity_scale = 0
	$CollisionShape2D.queue_free()
	$AnimatedSprite.visible = false
	$Particles2D.emitting = true
	$Particles2D.set_deferred("one_shot",true)
	block_input = true
	get_parent().lose_game()
	pass

func end_level():
	gravity_scale = 0
	$CollisionShape2D.queue_free()
	$AnimatedSprite.visible = false
	$Particles2D.emitting = true
	$Particles2D.set_deferred("one_shot",true)
	block_input = true
	get_parent().win_game()
	pass


