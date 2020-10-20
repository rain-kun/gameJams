extends Interactable

onready var parent = $"../"

onready var paper = get_node("/root/Main/UI/Paper")

func get_interaction_text():
	return "Read"

func interact():
	parent.paperS.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	paper.visible = true
	paper.set_text(parent.display_text)
