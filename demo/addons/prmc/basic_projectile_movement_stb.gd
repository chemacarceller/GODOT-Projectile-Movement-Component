class_name BasicProjectileMovementComponent extends Node

# Property to activate or deactivate the movement
@export var _isEnabled : bool = true

func set_IsEnabled(value : bool) -> void :
	_isEnabled = value

func get_IsEnabled() -> bool :
	return _isEnabled


## Indicates if the parent Actor is blocked with the first hit
@export var _isBlockedByCollision : bool = false

func set_IsBlockedByCollision(value : bool) -> void :
	_isBlockedByCollision = value

func get_IsBlockedByCollision() -> bool :
	return _isBlockedByCollision


## Direction in which the parentActor must move, it is normalized so that the speed works corrctly
@export var direction : Vector3 = Vector3.ZERO :
	set(value):
		if (value != Vector3.ZERO):
			direction = value.normalized()
	get():
		return direction

## Movement speed
@export var speed : float = 0.0

## Method that gets the kinematiccollision3D object when a collision occurs, it is a String because a Collable appears disable
@export var collisionHandler : String = ""


# private variables
# Object storing the collision info
var _collision : KinematicCollision3D = null

# signal emitted when a collision occurs
signal _collisionTakenPlace

# Geting the actor this component is attached to
@onready var _myActor : StaticBody3D = get_parent()


func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		_collision = null
		_myActor = null

# Doing the signal conection
func _ready() -> void:
	if collisionHandler != "":
		if _myActor.has_method(collisionHandler):
			_collisionTakenPlace.connect(Callable(_myActor, collisionHandler))
		else:
			print("BasicPawnMovement : The method assigned to basic_projectile_movement doesnt exist")
	else:
		print("BasicPawnMovement : There is no method assigned to resolve the collision of basic_projectile_movement")


# Moving the parent actor detecting a collision
func _physics_process(delta: float) -> void:
	# Only if it is enabled
	if _isEnabled and _myActor != null:
		# It is allowed to move if there is not a collision or there is no right collisionHandler defined
		# If there is a collisionHandler defined the movement stops and the handler resolves the situation
		if _collision == null or not _isBlockedByCollision:
			_collision = _myActor.move_and_collide(direction * speed * delta)
			# If a collision happens and we have a right collisionhandler defined
			if _collision != null and collisionHandler != "" and _myActor.has_method(collisionHandler):
				_collisionTakenPlace.emit(_collision)

# API promoted by this component
func get_collision() -> KinematicCollision3D:
	return _collision
