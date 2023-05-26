extends Camera2D

#value of how zoom will be aplied
var zoom_value = Vector2(0.1,0.1)
var zoom_max = Vector2 (4,4)
var zoom_min = Vector2 (0.3,0.3)

var camera_movement_speed = Vector2 (100,100)

func _process(delta):
	if (Input.is_action_pressed("camera_move_up")):
		move_up()
	if (Input.is_action_pressed("camera_move_down")):
		move_down()
	if (Input.is_action_pressed("camera_move_right")):
		move_right()
	if (Input.is_action_pressed("camera_move_left")):
		move_left()
	if (Input.is_action_just_released("zoom_in")):
		zoom_in()
	if (Input.is_action_just_released("zoom_out")):
		zoom_out()
#will zoom camera in (makes things look bigger)
func zoom_in():
	if (zoom <= zoom_max):
		zoom += zoom_value
#will zoom camera out (makes things look smaller)
func zoom_out():
	if (zoom >= zoom_min):
		zoom -= zoom_value
func move_up():
	transform.y += camera_movement_speed
func move_down():
	transform.y -= camera_movement_speed
func move_right():
	transform.x += camera_movement_speed
func move_left():
	transform.x -= camera_movement_speed
