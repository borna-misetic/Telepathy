extends Area

var flag_color = SpatialMaterial.new()

func _on_Goal_area_entered(_area):
	flag_color.albedo_color = Color(1.0,1.0,0,1.0)
	$flag/Cube.material_override = flag_color

func _on_Goal_area_exited(_area):
	flag_color.albedo_color = Color(0,0,0,1.0)
	$flag/Cube.material_override = flag_color
