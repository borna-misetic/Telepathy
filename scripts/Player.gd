extends KinematicBody

export var speed = 7 # varijabla "brzina" (export znači da ćemo vrijednost moći mijenjati van skripte)
export (Material) var color

onready var selected_color = load("res://models/player/BlueMaterial.material")

var velocity = Vector3.ZERO # najavljujemo novi prazan Vector3 za spremanje kretnje igrača
var character_selected = false

func _ready():
	$character/Armature/Skeleton/Circle.material_override = color

func _physics_process(_delta): # varijabla delta nam označava trajanje 1 frame-a (u ovom slučaju šesdesetina sekunde)
	get_input() # zovemo funkciju get_input()
	
func get_input():
	var direction = Vector3.ZERO # smjer gledanja lika
	# unos smjera kretanja
	if character_selected:
		$character/Armature/Skeleton/Circle.material_override = selected_color
		direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		direction.z = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	else:
		$character/Armature/Skeleton/Circle.material_override = color
	if direction != Vector3.ZERO:
		if $FootstepTimer.time_left <= 0:
			$Walk.pitch_scale = rand_range(0.6,1)
			$Walk.play()
			$FootstepTimer.start(0.8)
		direction = direction.normalized() # normalizacija vektora tako da se igrač ne bi kretao brže dijagonalno
		$character.look_at(translation + direction, Vector3.UP) # okretanje 3D modela igrača prema smjeru kretanja
		$character/AnimationPlayer.play("run-loop")
	else:
		$character/AnimationPlayer.play("idle-loop")
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= 0
	velocity = move_and_slide(velocity, Vector3.UP) # pokreće lika ovisno o iznosu vektora

func _on_SelectionArea_selection_toggled(selection) -> void:
	character_selected = selection
	$SelectCharacter.play()
