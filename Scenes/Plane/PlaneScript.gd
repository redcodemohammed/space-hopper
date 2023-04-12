extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var r = randi_range(0.1, 1.0)
	var b = randi_range(0.1, 1.0)
	var g = randi_range(0.1, 1.0)
	var colour = Color(r, g, b)
	var material = StandardMaterial3D.new()
	material.emission_enabled = true
	material.emission = colour
	material.emission_intensity = 1
	material.albedo_color = colour
	$CSGBox3D.material = material;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	queue_free()
