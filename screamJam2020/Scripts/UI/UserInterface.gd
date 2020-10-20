extends Control


onready var hovor = $AudioStreamPlayer2
onready var click = $AudioStreamPlayer


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Start_pressed():
	click.play()
	get_tree().change_scene("res://Scenes/World/Levels/Main.tscn")


func _on_Options_pressed():
	click.play()


func _on_Exit_pressed():
	get_tree().quit()


func _on_button_mouse_entered():
	hovor.play()


func _on_Credits_pressed():
	$Credits.show()


func _on_Close_pressed():
	$Credits.hide()


func _on_Created_by_pressed():
	OS.shell_open("https://www.youtube.com/channel/UCZl5Gy9LmY6B2XQtL8QeKvQ")
