extends Control

onready var button_video = $VideoButton
onready var button_audio = $AudioButton
onready var button_controls = $ControlsButton
onready var button_back = $BackButton
onready var button_resolution = $ControlVideo/ButtonResolution
onready var button_fullscreen = $ControlVideo/ButtonFullscreen
onready var control_video = $ControlVideo
onready var control_audio = $ControlAudio
onready var control_controls = $ControlControls
onready var button_master_mute = $ControlAudio/ButtonMasterMute
onready var button_music_mute = $ControlAudio/ButtonMusicMute
onready var button_effects_mute = $ControlAudio/ButtonEffectsMute
onready var slider_master = $ControlAudio/HSliderMaster
onready var slider_music = $ControlAudio/HSliderMusic
onready var slider_effects = $ControlAudio/HSliderEffects
onready var button_use = $ControlControls/ButtonUse
onready var button_pause = $ControlControls/ButtonPause
onready var label_use = $ControlControls/LabelUse
onready var label_pause = $ControlControls/LabelUse

func _ready():
	button_video.connect("pressed", self, "video")
	button_audio.connect("pressed", self, "audio")
	button_controls.connect("pressed", self, "controls")
	button_back.connect("pressed", self, "back")
	button_resolution.connect("item_selected", self, "resolution")
	button_fullscreen.connect("item_selected", self, "fullscreen")
	button_master_mute.connect("pressed", self, "master_mute")
	button_music_mute.connect("pressed", self, "music_mute")
	button_effects_mute.connect("pressed", self, "effects_mute")
	slider_master.connect("value_changed", self, "master_volume")
	slider_music.connect("value_changed", self, "music_volume")
	slider_effects.connect("value_changed", self, "effects_volume")
	button_use.connect("pressed", self, "use_button")
	button_pause.connect("pressed", self, "pause_button")
	
	button_resolution.add_item("320 X 180", 0)
	button_resolution.add_item("640 X 360", 0)
	button_resolution.add_item("1280 X 720", 0)
	button_resolution.add_item("1920 X 1080", 0)
	
	if (OptionsMenu.res_width == 320 and OptionsMenu.res_height == 180):
		button_resolution.select(0) 
	elif (OptionsMenu.res_width == 640 and OptionsMenu.res_height == 360):
		button_resolution.select(1) 
	elif (OptionsMenu.res_width == 1280 and OptionsMenu.res_height == 720):
		button_resolution.select(2) 
	elif (OptionsMenu.res_width == 1920 and OptionsMenu.res_height == 1080):
		button_resolution.select(3) 
	
	button_fullscreen.add_item("Fullscreen", 0)
	button_fullscreen.add_item("Windowed", 1)
	
	if OptionsMenu.fullscreen:
		button_fullscreen.select(0) 
	else:
		button_fullscreen.select(1) 
	
	slider_master.value = OptionsMenu.master_volume
	slider_master.min_value = OptionsMenu.MIN_VOLUME
	slider_master.max_value = OptionsMenu.MAX_VOLUME
	slider_music.value = OptionsMenu.music_volume
	slider_music.min_value = OptionsMenu.MIN_VOLUME
	slider_music.max_value = OptionsMenu.MAX_VOLUME
	slider_effects.value = OptionsMenu.effects_volume
	slider_effects.min_value = OptionsMenu.MIN_VOLUME
	slider_effects.max_value = OptionsMenu.MAX_VOLUME

func video():
	control_video.show()
	control_audio.hide()
	control_controls.hide()

func audio():
	control_video.hide()
	control_audio.show()
	control_controls.hide()

func controls():
	control_video.hide()
	control_audio.hide()
	control_controls.show()

func back():
	get_tree().change_scene("res://Menu/MainMenu.tscn")

func change_resolution(width, height):
	OptionsMenu.res_width = width
	OptionsMenu.res_height = height
	OptionsMenu.resolution()
	OptionsMenu.save_game()

func resolution(item):
	match item:
		0:
			change_resolution(320, 180)
		1:
			change_resolution(640, 360)
		2:
			change_resolution(1280, 720)
		3:
			change_resolution(1920, 1080)
	pass

func change_fullscreen(flag):
	OptionsMenu.fullscreen = flag
	OptionsMenu.resolution()
	OptionsMenu.save_game()

func fullscreen(item):
	match item:
		0:
			change_fullscreen(true)
		1:
			change_fullscreen(false)

func master_mute():
	OptionsMenu.master_mute = !OptionsMenu.master_mute
	slider_master.editable = !OptionsMenu.master_mute 
	OptionsMenu.choose_music()
	OptionsMenu.save_game()

func master_volume(value):
	OptionsMenu.set_master_volume(slider_master.value)
	OptionsMenu.save_game()

func music_mute():
	OptionsMenu.music_mute = !OptionsMenu.music_mute
	slider_music.editable = !OptionsMenu.music_mute 
	OptionsMenu.choose_music()
	OptionsMenu.save_game()

func music_volume(value):
	OptionsMenu.set_music_volume(slider_music.value)
	OptionsMenu.save_game()

func effects_mute():
	OptionsMenu.effects_mute = !OptionsMenu.effects_mute
	slider_effects.editable = !OptionsMenu.master_effects 
	OptionsMenu.choose_music()
	OptionsMenu.save_game()

func effects_volume(value):
	OptionsMenu.set_effects_volume(slider_effects.value)
	OptionsMenu.save_game()
