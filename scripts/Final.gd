extends Spatial


func _ready():
	MusicController.play_menu_music()
	$AnimationPlayer.play("fade_out")

func _process(_delta):
	$robots/AnimationPlayer.play("Armature001Action")
	$robots/AnimationPlayer.play("ArmatureAction")

func _on_ReturnButton_pressed():
	$SelectMenu.play()
	$AnimationPlayer.play("fade_in")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://scenes/Menu.tscn")
