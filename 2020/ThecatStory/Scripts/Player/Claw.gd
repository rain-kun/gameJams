extends Node2D

export var speed = 30
var velocity = Vector2.ZERO

func start(_position,_direction):
	position = _position
#	rotation = _direction.angle() 
#
	_direction.x = _direction.x 
	_direction.y = _direction.y
	velocity = (_direction ) * speed 

	
func _process(delta):
	position += velocity * delta
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Detector_body_entered(body):
	if body != self or body.name != "Player":
		body.hit_box()
		queue_free()
