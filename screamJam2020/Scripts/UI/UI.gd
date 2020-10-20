extends Control


onready var pausemenu = get_node("/root/Main/UI/PauseLabel")
onready var click = $AudioStreamPlayer
onready var hover = $AudioStreamPlayer2


func _on_Resume_pressed():
	click.play()
	pausemenu.set_visible(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_Options_pressed():
	click.play()
	print("we have options")


func _on_MainMenu_pressed():
	click.play()
	get_tree().change_scene("res://UI/UserInterface.tscn")
	

func _on_button_mouse_entered():
	hover.play()

