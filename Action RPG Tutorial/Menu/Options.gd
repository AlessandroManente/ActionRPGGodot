extends Control

func _ready():
	$VideoButton.connect("pressed", self, "video")
	$AudioButton.connect("pressed", self, "audio")
	$ControlsButton.connect("pressed", self, "controls")
	$BackButton.connect("pressed", self, "back")

func video():
	pass

func audio():
	pass

func controls():
	pass

func back():
	get_tree().change_scene("res://Menu/MainMenu.tscn")
