extends Spatial

onready var window_size = get_viewport().get_visible_rect().size
onready var transition_animation = $AnimationPlayer

export (String) var next_level

var goal1_reached = false
var goal2_reached = false

func _ready():
	MusicController.music_index += 1
	transition_animation.play("fade_in")
	if(MusicController.music_index == 1):
		MusicController.play_main_music()
	#$"Player1/Virtual joystick/".set_position(Vector2(window_size.x-1000,window_size.y-450))
	#$"Player2/Virtual joystick/".set_position(Vector2(window_size.x-1000,window_size.y-450))


func _process(_delta):
	if(goal1_reached and goal2_reached):
		transition_animation.play("fade_out")
		yield(transition_animation,"animation_finished")
# warning-ignore:return_value_discarded
		get_tree().change_scene(next_level)

# provjerava jesu li igrači trenutno unutar ciljeva

func _on_Goal_area_entered(_area):
	$VictorySound.play()
	goal1_reached = true

func _on_Goal2_area_entered(_area):
	$VictorySound.play()
	goal2_reached = true

# vraća varijable na početne vrijednosti ako igrači nisu unutar ciljeva

func _on_Goal_area_exited(_area):
	goal1_reached = false

func _on_Goal2_area_exited(_area):
	goal2_reached = false
