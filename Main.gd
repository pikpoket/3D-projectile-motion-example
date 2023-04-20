extends Node3D

var targetScene = preload('res://target.tscn')
var launcherScene = preload('res://launcher.tscn')

# You can get the default values for damping in the project with ProjectSettings.get("physics/3d/default_linear_damp")
# The function in the project assumes there is no damp, the projectile damping is set to "replace"

# Called when the node enters the scene tree for the first time.
func _ready():
	var target = targetScene.instantiate()
	target.global_position = Vector3(35,20,0)
	add_child(target)
	
	var launcher = launcherScene.instantiate()
	launcher.global_position = Vector3(-25,-10,0)
	launcher.target = target
	add_child(launcher) # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
