extends Node2D


export var length = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.shape = RectangleShape2D.new()
	for l in range(length-1):
		var sprite = $AnimatedSprite.duplicate()
		sprite.position.x += (1+l) * 16
		
		add_child(sprite)
		

	$CollisionShape2D.shape.extents.x = 8 * length
	$CollisionShape2D.shape.extents.y = 20
	$CollisionShape2D.position.x = 8 * length
	$CollisionShape2D.position.y = 20
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Magma_body_entered(body):
	body.kill()
	pass # Replace with function body.
