extends Control

# Temporary

const DEFAULT_RES_WIDTH = 320
const DEFAULT_RES_HEIGHT = 180
const MAX_VOLUME = 24
const SAVE_PATH = "res://save.json"
var settings = {}
var play_music = 1
var play_effects = 1
var new_choice = 1
var song
var menu = true

onready var music_player = $MusicPlayer

# Saved

var master_volume = MAX_VOLUME
var music_volume = MAX_VOLUME
var effects_volume = MAX_VOLUME
var master_mute = false
var music_mute = false
var effects_mute = false
var res_width = DEFAULT_RES_WIDTH
var res_height = DEFAULT_RES_HEIGHT
var fullscreen = false
var sp_use = 32
var sp_pause = 16777217

func _ready():
	# save_game()
	load_game()
	choose_music()
	resolution()
	pass

func _process(delta):
	if !music_player.playing:
		choose_music()
	
	if master_volume > 0 and music_volume > 0:
		play_music = int(master_volume * music_volume / MAX_VOLUME)
	else:
		play_music = 0
	
	music_player.volume_db = play_music
	
	if master_volume > 0 and effects_volume > 0:
		play_effects = int(master_volume * effects_volume / MAX_VOLUME)
	else:
		play_effects = 0

func choose_music():
	if menu:
		menu_music()
	else:
		game_music()

func menu_music():
	song = load("res://Music and Sounds/Music.mp3")
	music_player.stream = song
	music_player.play(0.0)

func game_music():
	pass

func resolution():
	ProjectSettings.set_setting("display/window/size/width", res_width)
	ProjectSettings.set_setting("display/window/size/height", res_height)
	OS.set_window_size(Vector2(res_width, res_height))
	
	if fullscreen:
		OS.set_window_fullscreen(false)
		OS.set_window_fullscreen(true)
	else:
		OS.set_window_fullscreen(true)
		OS.set_window_fullscreen(false)
		OS.set_window_position(Vector2.ZERO)
	pass

func save_game():
	var settings = {
		resolution = {
			width = res_width,
			height = res_width
		},
		fullscreen = fullscreen,
		master_volume = master_volume,
		music_volume = music_volume,
		master_mute = master_mute,
		music_mute = music_mute,
		effects_volume = effects_volume,
		effects_mute = effects_mute
	}
	
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	save_file.store_line(to_json(settings))
	save_file.close()

func load_game():
	var save_file = File.new()
	if !save_file.file_exists(SAVE_PATH):
		return
	
	save_file.open(SAVE_PATH, File.READ)
	
	var data = {}
	data = parse_json(save_file.get_as_text())
	
	master_volume = data["master_volume"]
	music_volume = data["music_volume"]
	effects_volume = data["effects_volume"]
	master_mute = data["master_mute"]
	music_mute = data["music_mute"]
	effects_mute = data["effects_mute"]
	res_width = data["resolution"]["width"]
	res_height = data["resolution"]["height"]
	fullscreen = data["fullscreen"]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
