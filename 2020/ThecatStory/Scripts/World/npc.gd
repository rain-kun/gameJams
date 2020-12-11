extends Area2D


func _ready():
	$Sprite2.hide()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$"../../Player/Control".hide()
		$Sprite2.show()
		$Control.show()
		body.camera .current = false
		$Camera2D.current = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		$"../../Player/Control".show()
		$Sprite2.hide()
		$Control.hide()
		body.camera.current = true
		$Camera2D.current = false

