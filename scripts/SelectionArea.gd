extends Area

signal selection_toggled(selection)

export var exclusive = true
var touch_input = InputEventScreenTouch

var selected = false setget set_selected


func set_selected(selection):
	if selection:
		make_exclusive()
		add_to_group("selected")
	else:
		remove_from_group("selected")
	selected = selection
	emit_signal("selection_toggled",selected)


func make_exclusive():
	if not exclusive:
		return
	get_tree().call_group("selected","set_selected",false)


func _input_event(_camera, event, _position, _normal, _shape_idx):
	if event is touch_input and event.is_pressed():
		set_selected(not selected)
