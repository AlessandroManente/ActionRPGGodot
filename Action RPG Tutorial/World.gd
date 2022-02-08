extends Node2D

onready var background = $Background
onready var camera2D = $Camera2D

func _ready():
	camera2D.set_position_top(background.region_rect.position)
	camera2D.set_position_bottom(background.region_rect.end)
