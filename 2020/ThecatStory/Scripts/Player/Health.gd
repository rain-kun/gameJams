extends Area2D

export(int) var health = 1

func _on_Health_body_entered(body):
	if body.name == "Player":
		body.health_up(health)
		queue_free()
