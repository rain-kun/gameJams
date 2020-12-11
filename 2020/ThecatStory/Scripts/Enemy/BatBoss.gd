extends bat

export (PackedScene) var batgum
export (PackedScene) var bossbat
export (float) var gum_time  
export (int)var reval
var is_idel
var timer
var prob = 1
var shot_state = false
var idel_state = true
var defend_state = false

var can_shot = true
var can_spawn = true

signal shot
signal spawn
var regain = true

func _ready():
	timer = get_tree().create_timer(gum_time)
	is_idel = true
	$StateTimer.start()
	
func _chase_player():

	if player:
		var p_pos = target.position
		var _max = max(p_pos.x, p_pos.y)
		var _x = p_pos.x/_max
		var _y = p_pos.y/_max

		position.x -= _x
		print(p_pos)
		dir = position.direction_to(-target.position) * speed


		dir = move_and_slide(dir)
func _be_idel():
	pass
	
	
func _in_idel_position():
	return idel_state
	
	
func _defend_boss():
	spawn()


func _can_spawn():
	return defend_state
	
func spawn():
	if can_spawn:
		can_spawn = false
#		print("span")
		emit_signal("spawn", bossbat, $Position2D.global_position)
		$SpawnTimer.start()
	
	
func _can_shot():
	return shot_state
	
func _power_up():
	if Health < Max_Health - reval and regain:
		regain = false
		Health = Max_Health /2
		health._on_health_updated(Health)
	if can_shot:
		can_shot = false
		var dir = Vector2(1,0).rotated($Position2D.global_rotation)
		emit_signal("shot", batgum, $Position2D.global_position, dir)
		


func _on_StateTimer_timeout():
	prob = randi() % 4
	if prob > 2:
		prob = 0
	else:
		prob = 1
	var state = randi() % 3 + prob
	match state:
		0:
			shot_state = false
			defend_state = false
			idel_state = true
			
		1:
			idel_state = false
			defend_state = false
			shot_state = true
			$ShotTimer.start()
		2:
			idel_state = false
			shot_state = false
			defend_state = true
			$SpawnTimer.start()
	$StateTimer.start()

		

func _on_SpawnTimer_timeout():
	can_spawn = true
	$SpawnTimer.start()


func _on_ShotTimer_timeout():
	can_shot = true
	$ShotTimer.start()

