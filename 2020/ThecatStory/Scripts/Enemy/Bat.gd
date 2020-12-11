extends KinematicBody2D

class_name bat
export var Max_Health = 0
export var speed = 10
export var end_jump = -100
export var hit_value = 1
var Health
var dir = Vector2.ZERO
var target = null
var player = false


signal dead
signal hit
signal get_hit

onready var health = $EnemyHealth
onready var animation_player = $AnimationPlayer

func _ready():
	health._on_max_health_updated(Max_Health)
	Health = Max_Health
	#position = Vector2(0,0)
	pass

func _in_attack_zone():
	if player:
		return true
	else:
		return false
	
	
func _attack():
	pass
	
	
func _chase_player():
	pass
	
	
func _idel():
	pass
	
	
func _should_chase():
	if player:
		return true
	else:
		return false
	
	
func _go_idel():
	if player:
		return false
	else:
		return true
	
	
func should_attack():
	pass



func _on_Detector_body_entered(body):
	if body.name == "Player":
		target = body
		player = true


func _on_Detector_body_exited(body):
	if body.name == "Player":
		target = null
		player = false



func hit_box():
	Health -= 1
	health._on_health_updated(Health)
	if Health == 0:
		emit_signal("dead", position)
		queue_free()
	emit_signal("get_hit")
	


func _on_HitZone_body_entered(body):
	if body.name == "Player":
		target.dir.y = end_jump
		hit_box()




func _on_AttackZone_body_entered(body):
	if target and body.name == "Player":
		target.hit_box(hit_value)
