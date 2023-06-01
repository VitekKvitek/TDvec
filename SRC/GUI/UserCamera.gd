extends Camera2D

#value of how much zoom will be aplied
@export var zoom_value = Vector2(0.1,0.1)
#boundries for zoom value
@export var zoom_max = Vector2 (6.5,6.5)
@export var zoom_min = Vector2 (0.3,0.3)
#speed of camera movement
@export var camera_movement_speed = Vector2 (400,400)

func _process(delta):
	#adjust the zoom for current frame
	var zoom_aplied = calculate_new_zoom()
	if (zoom_aplied != Vector2.ZERO):
		position += (get_global_mouse_position() - position).normalized() * 1000 * delta
	zoom += zoom_aplied
	
	#adjust the new camera position for new frame ( * delta is for smooth movement)
	position += calculate_new_camera_position() * delta
	
	
#calculates camera upcoming position based on player input
func calculate_new_camera_position () -> Vector2:
	var direction = Vector2.ZERO
	if (Input.is_action_pressed("camera_move_up")):
		direction.y = -1
	if (Input.is_action_pressed("camera_move_down")):
		direction.y = 1
	if (Input.is_action_pressed("camera_move_right")):
		direction.x = 1
	if (Input.is_action_pressed("camera_move_left")):
		direction.x = -1
	if(direction == Vector2.ZERO):
		return Vector2.ZERO
	return direction.normalized() * camera_movement_speed * calculate_speed_modifier(zoom.x)
	
#calculates the zoom based on player input
func calculate_new_zoom () -> Vector2:
	if (zoom < zoom_max and Input.is_action_just_released("zoom_in")):
		return 1 * zoom_value  * calculate_zoom_modifier(zoom.x)
	if (zoom > zoom_min and Input.is_action_just_released("zoom_out")):
		return -1 * zoom_value  * calculate_zoom_modifier(zoom.x)
	return Vector2.ZERO

#calcualtes the zoom modifier, for bigger zoom -> faster zooming
func calculate_zoom_modifier (actual_zoom) -> float :
	return pow(actual_zoom, 1.8)

#calculates speed based on zoom, for bigger zoom -> slower speed
func calculate_speed_modifier (actual_zoom) -> float :
	return 1/pow(actual_zoom, 1.1)



