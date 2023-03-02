extends Spatial

onready var main_menu = $Main
onready var settings_menu = $Settings

var master_bus = AudioServer.get_bus_index("Master")

func _ready():
	$AnimationPlayer.play("fade_out")
	MusicController.play_menu_music()

func _process(_delta):
	$robots/AnimationPlayer.play("Armature001Action")
	$robots/AnimationPlayer.play("ArmatureAction")

func _on_Play_pressed():
	$SelectMenu.play()
	$AnimationPlayer.play("fade_in")
	yield($AnimationPlayer,"animation_finished")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")

func _on_Settings_pressed():
	$SelectMenu.play()
	main_menu.visible = false
	settings_menu.visible = true

func _on_BackButton_pressed():
	$SelectMenu.play()
	settings_menu.visible = false
	main_menu.visible = true

func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus,value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
