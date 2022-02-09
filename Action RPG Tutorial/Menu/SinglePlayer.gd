extends Control

func _ready():
	$NewGameButton.connect("pressed", self, "new_game")
	$LoadGameButton.connect("pressed", self, "load_game")
	$BackButton.connect("pressed", self, "back")

func new_game():
	get_tree().change_scene("res://World.tscn")

func load_game():
	pass

func back():
	get_tree().change_scene("res://Menu/MainMenu.tscn")
