extends KinematicBody2D


export var Max_Health = 2
export var speed = 50
export var hit_value = 1
export var end_jump = -100
var Health
var snap = Vector2.DOWN
var dir = Vector2.ZERO
var right = true
const GRAV = 10

signal dead
signal hit
signal get_hit

onready var health = $EnemyHealth
onready var animation_player = $AnimatedSprite

func _ready():
	health._on_max_health_updated(Max_Health)
	Health = Max_Health
	#position = Vector2(0,0)
	pass

	
	
func _chase_player():
	if not is_on_floor():
		dir.x += GRAV
	if right:
		dir.x = speed
		$AnimatedSprite.scale.x = -1
	else:
		dir.x = -speed
		$AnimatedSprite.scale.x = 1
		
	dir = move_and_slide_with_snap(dir,snap)


func hit_box():
	Health -= 1
	health._on_health_updated(Health)
	if Health == 0:
		emit_signal("dead", position)
		queue_free()
	emit_signal("get_hit")
	


func _on_HitZone_body_entered(body):
	if body.name == "Player":
		body.dir.y = end_jump
		hit_box()
	if body.name == "Claw":
		hit_box()




func _on_AttackZone_body_entered(body):
	if body.name == "Player":
		body.hit_box(hit_value)
	else:
		if right:
			right = false
		else:
			right = true

