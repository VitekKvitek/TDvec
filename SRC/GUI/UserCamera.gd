extends Camera2D
#value of how zoom will be aplied
var zoom_value = Vector2(0.1,0.1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if (Input.is_action_just_released("zoom_in")):
		zoom_in()
	if (Input.is_action_just_released("zoom_out")):
		zoom_out()

func zoom_in():
	zoom += zoom_value
func zoom_out():
	zoom -= zoom_value
	
