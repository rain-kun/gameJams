extends Control

onready var health_bar = $HealthyBar

export (Color) var healthy_color = Color.green
export (Color) var caution_color = Color.yellow
export (Color) var danger_color = Color.red
export (float,0, 0.05) var caution_zone = 0.5
export (float,1, 0.05) var dange_zone = 0.2

func _on_health_updated(health):
	health_bar.value = health
	
	_assign_color(health)
	
func _on_max_health_updated(Max_health):
	health_bar.max_value = Max_health

func _assign_color(health):
	if health < health_bar.max_value * dange_zone:
		health_bar.tint_progress = danger_color
	elif health < health_bar.max_value * caution_zone:
		health_bar.tint_progress = caution_color
	else:
		health_bar.tint_progress = healthy_color
		
