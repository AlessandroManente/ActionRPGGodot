extends Camera2D

onready var topLeft = $Limits/TopLeft
onready var bottomRight = $Limits/BottomRight

func _ready():
	set_limit_top(topLeft.position)
	set_limit_bottom(bottomRight.position)

func set_limit_top(position):
	limit_top = position.y
	limit_left = position.x

func set_limit_bottom(position):
	limit_bottom = position.y
	limit_right = position.x

func set_position_top(position):
	topLeft.set_position(position)
	set_limit_top(topLeft.position)

func set_position_bottom(position):
	bottomRight.set_position(position)
	set_limit_bottom(bottomRight.position)
