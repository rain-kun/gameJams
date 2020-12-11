extends RigidBody


onready var base = get_node("../..")

var myname = ""
signal make_sound
	
func _ready():
	myname = self
	connect("make_sound", base, "playcollidersound")
	
	
func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Player"):
			emit_signal("make_sound", myname)
