extends Camera2D

#value of how zoom will be aplied
var zoom_value = Vector2(0.1,0.1)
var zoom_max = Vector2 (2,2)
var zoom_min = Vector2 (0.1,0.1)

func _process(delta):
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
	
