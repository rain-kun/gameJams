extends Node

onready var chair = $AudioStreamPlayer3D
onready var draw = $AudioStreamPlayer3D4


func playcollidersound(_whichbody):
#	print(_whichbody)
	var body = _whichbody.get_name()
	if body.begins_with("Chair"):
		if not chair.playing:
#			print("c")
			chair.play()
	if body.begins_with("Table"):
		pass
	if body.begins_with("Draw"):
		if not draw.playing:
			draw.play()
	if body.begins_with("Little"):
		pass
	if body.begins_with("Lamp"):
		pass
