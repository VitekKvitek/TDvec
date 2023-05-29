extends Camera2D

#value of how zoom will be aplied
@export var zoom_value = Vector2(0.1,0.1)
#boundries for zoom vale
@export var zoom_max = Vector2 (6.5,6.5)
@export var zoom_min = Vector2 (0.3,0.3)
#speed of camera
@export var camera_movement_speed = Vector2 (400,400)

func _process(delta):
	#calculates the zoom scale for each frame
	zoom += get_zooming() * zoom_value  *calculate_zoom_modifier(zoom.x)
	#calculates the new position of camera for each frame
	position += delta * camera_movement_speed * calculate_speed_modifier(zoom.x) * get_move_direction().normalized()
	
#returns the direction in which player wants to move the camera
func get_move_direction () -> Vector2:
	var direction = Vector2.ZERO
	if (Input.is_action_pressed("camera_move_up")):
		direction.y = -1
	if (Input.is_action_pressed("camera_move_down")):
		direction.y = 1
	if (Input.is_action_pressed("camera_move_right")):
		direction.x = 1
	if (Input.is_action_pressed("camera_move_left")):
		direction.x = -1
	
	return direction
	
#returns if the palyer wants to zoom in or out 
func get_zooming () -> int:
	if (zoom < zoom_max and Input.is_action_just_released("zoom_in")):
		return 1
	if (zoom > zoom_min and Input.is_action_just_released("zoom_out")):
		return -1
	return 0

#calcualtes the zoom modifier, for bigger zoom -> faster zooming
func calculate_zoom_modifier (actual_zoom) -> float :
	return pow(actual_zoom, 1.8)

#calculates speed based on zoom, for bigger zoom -> slower speed
func calculate_speed_modifier (actual_zoom) -> float :
	return 1/pow(actual_zoom, 1.1)


