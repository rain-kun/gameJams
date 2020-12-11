extends Control

onready var health_bar = $HealthyBar

func _ready():
	pass

func _on_health_updated(health):
	health_bar.value = health
	$AnimationPlayer.play("Hit")
	
	
func _on_max_health_updated(Max_health):
	health_bar.max_value = Max_health
