extends Node3D

const plane = preload("res://Scenes/Plane/Plane.tscn")

var position_vector = Vector3.ZERO
var score: RichTextLabel
var you_lost_label: RichTextLabel
var points = 0
var player:CharacterBody3D

func _ready():
	score = $UI/RichTextLabel
	player = $Player
	you_lost_label = $UI/YouLostLabel

func _on_timer_timeout():
	var axis = randi_range(0, 1)
	var dir  = [-1, 1][randi() % 2]
	
	var new_plane = plane.instantiate()
	var factor = dir * 2	# Add the gravity.


	if(axis > 0.5):
		# the new plane will be on the x axis
		position_vector.x += factor
	else:
		# the new plane will be on the z axis
		position_vector.z += factor
	
	new_plane.position = position_vector
		
	add_child(new_plane)
	
	points += 1
	
	score.text = "SCORE: " + str(points)

func _process(delta):
	if(player.position.y < 0):
		you_lost_label.text = "You Lost, your score is " + str(points) + "\n Press R to restart"
		get_tree().paused = true
