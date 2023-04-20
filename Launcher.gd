extends Node3D

#Note: maxHeight should be > target height
# Code adapted from this video https://www.youtube.com/watch?v=IvT8hjy6q4o&ab_channel=SebastianLague

@export var maxHeight = 50
@export var gravity = -9.8 #Use the same as defined in project settings

var projectileScene = preload('res://projectile.tscn')
var target
var projectile = null

var startingLaunchPosition


func calculateLaunchVelocity():
	startingLaunchPosition = self.global_position
	
	var displacementY: float = target.global_position.y - startingLaunchPosition.y
	var displacementXZ = Vector3(target.global_position.x - startingLaunchPosition.x, 0, target.global_position.z - startingLaunchPosition.z)
	var velocityY = Vector3.UP * sqrt(-2*gravity*maxHeight)
	
	var time: float = sqrt(-2*maxHeight/gravity) + sqrt(2*(displacementY - maxHeight)/gravity)
	var velocityXZ = displacementXZ / time
	
#	print("displacement XZ: ", displacementXZ)
#	print("displacement Y : ", displacementY)
#	print("velocityY : ", velocityY)
#	print("velocityXZ : ", velocityXZ)
#
#	print("launch velocity: ", velocityXZ + velocityY * -sign(gravity))
	
	var result = velocityXZ + velocityY * -sign(gravity)
	
	return result

func launch():
	projectile = projectileScene.instantiate()
	projectile.position = self.global_position
	projectile.apply_impulse(calculateLaunchVelocity())
	get_parent().add_child(projectile)
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if Input.is_action_pressed("ui_accept"):
			launch()
