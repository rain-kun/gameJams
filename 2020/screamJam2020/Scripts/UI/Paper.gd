extends Label

onready var paper = $"."
onready var hover = $"../AudioStreamPlayer2"
onready var click = $"../AudioStreamPlayer"

func _ready():
	paper.hide()


func _on_Close_pressed():
	click.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	paper.hide()


func _on_Close_mouse_entered():
	hover.play()
