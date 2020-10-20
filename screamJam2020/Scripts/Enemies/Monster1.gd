extends KinematicBody

export var Look_speed = 2
export var Speed = 30
export var Gravity = 0.98
export var active = true

var target = null
var space_state
var velocity = Vector3.ZERO
var can_follow = false
var dist_travelled = 0.0
var player : KinematicBody
var nav : Navigation

const ATTACK_DIST = 2


onready var walkS = $MonsterWalkingSounds
onready var animation_player = $body/AnimationPlayer
onready var eyes = $eyes

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	nav = get_parent()
	space_state = get_world().direct_space_state
	



func _physics_process(_delta):
#	AudioServer.set_bus_mute(AudioServer.get_bus_index("MonsterBreath"), microphone.can_see)
#	if microphone.can_see:
#		return
	
	if !active:
		return
	
	var our_pos = global_transform.origin
	var p_pos = player.global_transform.origin
	var path = nav.get_simple_path(our_pos, p_pos)
	
	if our_pos.distance_squared_to(p_pos) <= ATTACK_DIST * ATTACK_DIST:
		var space_state = get_world().direct_space_state
		var result = space_state.intersect_ray(our_pos + Vector3.UP, p_pos + Vector3.UP, [self], collision_mask)
		if !result:
			player.kill()
	elif path.size() > 1:
		var dir = path[1] - global_transform.origin
		dir.y = 0
		dir = dir.normalized()
		
		move_and_slide(dir * Speed, Vector3.UP)
		rotation.y = atan2(dir.x, dir.z)
		dist_travelled += global_transform.origin.distance_to(our_pos)
		if dist_travelled >= 1.0:
			$MonsterWalkingSounds.play()
			dist_travelled = 0.0

func set_active():
	active = true


func _follow(delta):
	var our_pos = global_transform.origin
	if target:
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if result.collider.is_in_group("Player"):
			can_follow = true
			move_to_target(delta)
			eyes.look_at(target.global_transform.origin, Vector3.UP)
			rotate_y(deg2rad(eyes.rotation.y * Look_speed))
			
			dist_travelled += global_transform.origin.distance_to(our_pos)
			if dist_travelled >= 1.0:
				walkS.play()
				dist_travelled = 0.0
		else:
			can_follow = false
	else:
		can_follow = false
	
func move_to_target(delta):
	apply_gravity()
	var direction = (target.transform.origin - transform.origin).normalized()
#	print(direction)
	velocity = direction * Speed * delta
	velocity = move_and_slide(velocity, Vector3.UP)


func apply_gravity():
	if not is_on_floor():
		velocity.y -= Gravity

func _on_Detected_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		$AnimationSound.play("roar")
#		print(target)

func _on_Detected_body_exited(body):
	if body.is_in_group("Player"):
		target = null
#		print(target)

