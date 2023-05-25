extends Camera2D
#value of how zoom will be aplied
var zoom_value = Vector2(0.1,0.1)
var zoom_max = Vector2 (2,2)
var zoom_min = Vector2 (0.1,0.1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	if (Input.is_action_just_released("zoom_in")):
		zoom_in()
	if (Input.is_action_just_released("zoom_out")):
		zoom_out()
	print(zoom)
func zoom_in():
	if (zoom <= zoom_max):
		zoom += zoom_value
func zoom_out():
	if (zoom >= zoom_min):
		zoom -= zoom_value
	
