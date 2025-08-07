class_name Bullet extends StaticBody3D

# This method is called when the basic-projectile-movement-component detects a collision
# Configure as a parameter in the component
func _on_basic_projectile_movement_stb__collision_taken_place(_collision : KinematicCollision3D) -> void:
	# When hitting anything it is eliminated. no further action
	queue_free()

# Getting the projectile movement
func get_movementComponent() -> BasicProjectileMovementComponent:
	return get_node("BasicProjectileMovementComponent")
