extends KinematicBody2D

export var Speed = 100.0
export var Jump = -150
export var big_jump = -200
export(PackedScene) var attackitem
export var Max_Health = 15

#export (PackedScene)var scene

onready var jump_sound = $AudioStreamPlayer2D2
onready var walk_sound
onready var camera = $Camera2D
onready var sprite = $Sprite
onready var parent = get_parent()
onready var health = $PlayerHealth
var dir = Vector2()
var state_machine
var ammo = 10
var Health
const GRAVITY = 10

signal dead
signal get_hit
signal hit
var running = false
var can_shoot = false
var double_jump = true
var magic_of_light = false
#statemachinevar
var _can_walk = false
var _go_idel = false
var _have_ammo = false
var _can_jump = false
var _can_double_jump = false
# for boss

func _ready():
	Health = Max_Health
	health._on_max_health_updated(Max_Health)
	$ShootTimer.start()
	state_machine = $AnimationTree.get("parameters/playback")


func gravity():
	if not is_on_floor():
		dir.y += GRAVITY
		
func input():
	var _jump = Input.is_action_just_pressed("ui_accept")
	if not is_on_floor():
		#b state_machine.travel("jump")
		if double_jump == true and _jump:
			dir.y = big_jump
			double_jump = false
			_can_walk = false
			_can_jump = false
			_can_double_jump = true
			if running:
				state_machine.travel("jump2")
			else:
				state_machine.travel("double_jump")
			$AudioStreamPlayer2D2.play()
	else:
		pass
		double_jump = true
		if _jump:
			dir.y = Jump
			$AudioStreamPlayer2D2.play()
			if running:
				state_machine.travel("jump2")
			else:
				state_machine.travel("jump")
			_can_double_jump = false
			_can_walk = false
			_go_idel = false
			_can_jump = true
			
	if Input.is_action_pressed("ui_right"):
		dir.x = Speed
		$Sprite.scale.x = 1
#		$Sprite.position.x = 0.17
#		$Camera2D.offset_h = 0.12
		running = true
		_can_jump = false
		_can_double_jump = false
		_go_idel = false
		_can_walk = true
		
	elif Input.is_action_pressed("ui_left"):
		dir.x = -Speed
		$Sprite.scale.x = -1
#		$Sprite.position.x = -0.17
#		$Camera2D.offset_h = -0.12
		running = true
		_can_jump = false
		_can_double_jump = false
		_go_idel = false
		_can_walk = true
	else:
		dir.x = 0
		running = false
		_can_double_jump = false
		_can_jump = false
		_can_walk = false
		_go_idel = true
	
	var snap = Vector2.DOWN * 1
	
	if Input.is_action_just_pressed("attack"):
		_attack()
	
	
	
	dir = move_and_slide_with_snap(dir, snap, Vector2.UP)
	

func _can_walk():
	return running

func _attack():
		if can_shoot:
			can_shoot = false
			$AudioStreamPlayer2D.play()
			$ShootTimer.start()
			
			#emit_signal('hit', attackitem , $Sprite.global_position, dir)
			state_machine.travel("attack")

func hit_box(value):
	Health -= value
	health._on_health_updated(Health)
	emit_signal("get_hit")
	if Health <= 0:
		die()
	


func die():
	get_tree().change_scene("res://Scenes/World/Stages/"+str(parent.Scene_name)+".tscn")
	
	


func _on_ShootTimer_timeout():
	can_shoot = true
	$ShootTimer.start()
#
func health_up(heal):
	if Max_Health >= Health + heal:
		Health += heal
		$AudioStreamPlayer2D4.play()
		health._on_health_updated(Health)



func _on_Attack_body_entered(body):
	body.hit_box()
