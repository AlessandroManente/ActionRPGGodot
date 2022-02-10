extends Control

onready var button_resume = $ResumeButton
onready var button_load_save = $LoadSaveButton
onready var button_save_game = $SaveGameButton
onready var button_options = $OptionsButton
onready var button_quit = $QuitButton

var scene

func _ready():
	button_resume.connect("pressed", self, "resume")
	button_load_save.connect("pressed", self, "load_save")
	button_save_game.connect("pressed", self, "save_game")
	button_options.connect("pressed", self, "options")
	button_quit.connect("pressed", self, "quit")
	pass

func resume():
	get_tree().change_scene("res://World.tscn")

func load_save():
	get_tree().change_scene("res://Menu/LoadGame.tscn")

func save_game():
	get_tree().change_scene("res://Menu/SaveGame.tscn")

func options():
	get_tree().change_scene("res://Menu/Options.tscn")

func quit():
	get_tree().change_scene("res://Menu/MainMenu.tscn")
