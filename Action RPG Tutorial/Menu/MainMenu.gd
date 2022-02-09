extends Control

func _ready():
	$SingleplayerButton.connect("pressed", self, "singleplayer")
	$OptionsButton.connect("pressed", self, "options")
	$QuitButton.connect("pressed", self, "quit")

func singleplayer():
	get_tree().change_scene("res://Menu/SinglePlayer.tscn")

func options():
	get_tree().change_scene("res://Menu/Options.tscn")

func quit():
	get_tree().quit()
