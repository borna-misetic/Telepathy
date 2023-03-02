extends Area


export (String) var color
export (String) var collision
export (Material) var button_color

onready var head_position = $Head.global_transform.origin

var doors: Array

func _ready():
	$Head.material_override = button_color
	doors = get_tree().get_nodes_in_group(color)
	collision = get_tree().get_nodes_in_group(collision)


func _on_Button_area_entered(_area):
	$ButtonPressed.play()
	$Head.global_transform.origin = Vector3(head_position.x,head_position.y - 0.15,head_position.z)
	for door in doors:
		door.visible = false
	for collider in collision:
		collider.disabled = true


func _on_Button_area_exited(_area):
	$ButtonReleased.play()
	$Head.global_transform.origin = Vector3(head_position.x,head_position.y,head_position.z)
	for door in doors:
		door.visible = true
	for collider in collision:
		collider.disabled = false
