extends Spatial

func _ready():
	for child in get_children():
		child.hide()
	
