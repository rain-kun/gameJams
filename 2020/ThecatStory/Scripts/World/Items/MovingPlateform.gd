extends Node2D
#
#const IDEL_DURATION = 1.0
#export var speed = 3.0
#export var move_to = Vector2.RIGHT * 192
## class_name MovingPlatform
#onready var platform = $Platform
#onready var tween = $Tween
#
#var follow = Vector2.ZERO
#
func _ready():
	$AnimationPlayer.play("follow")

#
#func _init_tween():
#	var duration = move_to.length()/ float(speed * 8)
#	tween.interpolate_property(self,"follow",Vector2.ZERO,move_to,duration,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,IDEL_DURATION)
#	tween.interpolate_property(self,"follow",move_to,Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + IDEL_DURATION)
#
#
#func _physics_process(delta):
#	platform.position = platform.position.linear_interpolate(follow , 0.075)
# var members

#export var cycle = 1.0
#var accum = 0.0
#
#
#func _physics_process(delta):
#
#	accum += delta * (1.0 / cycle) * PI * 2.0
#	accum = fmod(accum , PI * 2.0)
#
#	var d = sin(accum)
#	var xf = Transform2D()
#
#	xf[2] = motion * d
#	($Platform as KinematicBody2D).transform = xf 
