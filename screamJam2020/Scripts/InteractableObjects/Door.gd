extends Spatial

export(String) var Key_name = ""
export(int) var Door_name = 0

var door_open = false

onready var animation_player = $AnimationPlayer
onready var animation_sound =  $AnimationSound
