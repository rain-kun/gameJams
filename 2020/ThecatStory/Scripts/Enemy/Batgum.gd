extends Area2D

export(int) var speed 
export(int) var hit_vale

var dir = Vector2.ZERO

func _ready():
	$Timer.start()


func start(_position,_direction):
	position = _position
	rotation = _direction.angle() 
#	line.position  = _position 
#	line.rotation = _direction.angle()
	_direction.x = _direction.x# + offset
	_direction.y = _direction.y# + offset
	dir = (_direction ) * speed 


func _on_Timer_timeout():
	queue_free()

func _process(delta):
	position += dir * delta


func _on_Batgum_body_entered(body):
	if body.name == "Player":
		body.hit_box(hit_vale)
		queue_free()
