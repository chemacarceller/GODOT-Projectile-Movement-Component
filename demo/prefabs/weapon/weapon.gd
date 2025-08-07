class_name Weapon extends RigidBody3D

@export var bullet: PackedScene 

# indicates if it is possible to fire
var _isFireEnebled : bool = true

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		bullet = null

func _ready() -> void:
	pass
	
func _input(_event) -> void:

	# If the character is moving and not jumping nor falling is allowed to shoot
	if owner is CharacterBody3D and owner.get_movementComponent().get_isMoving() and not owner.get_movementComponent().get_isJumping() and not owner.get_movementComponent().get_isFalling():

		# Firing
		# I wanted to use is_action_just_pressed but it doesnt work perfectly, instead i use is_action_pressed and make my own code to convert
		if Input.is_action_pressed("fire") and _isFireEnebled:

			# Instantiate a bullet
			var _bullet = bullet.instantiate()

			# Putting the bullet in the game, in the bullet it is eliminated after a time or in a collision
			get_tree().get_root().add_child(_bullet)

			# Establishing the bullet position
			_bullet.global_position = global_position

			# Establishing the bullet direction, the speed is configured in the component
			_bullet.get_movementComponent().direction =  get_global_transform().basis.x

			# Disable the fire system until the button is released
			_isFireEnebled = false

		# When the button is released we can fire again
		if Input.is_action_just_released("fire") and not _isFireEnebled:
			_isFireEnebled = true
