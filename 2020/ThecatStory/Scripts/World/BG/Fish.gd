extends Node2D

# Declare member variables here. Examples:
export var min_speed = 10  # Minimum speed range.
export var max_speed = 20  # Maximum speed range.
var fish_types = ["blue", "green", "red","white", "yellow"]


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = fish_types[randi() % fish_types.size()]
	$AnimatedSprite.play()
	$AnimationPlayer.play("swim")
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Timer_timeout():
	queue_free()

func _on_start_game():
	queue_free()
