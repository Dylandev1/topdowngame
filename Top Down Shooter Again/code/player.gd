extends CharacterBody2D

@onready var weapon_holder := $WeaponHolder
@onready var timer: Timer = $Timer
@onready var gun := $"WeaponHolder/Gun"
var is_alive := true


func _physics_process(_delta: float) -> void:
	# Didn't clutter up the _physics_process() function.
	handle_holder_rotation()
	move_and_slide()
	mouseClick()


func handle_holder_rotation():
	# This line of code makes the weapon look at the position of the mouse
	# on the screen enabling the player to aim.
	weapon_holder.look_at(get_global_mouse_position())





func move_player():
	# get_parent() references the player node. Cause this node's parent
	# is the Player itself.
	

	# This sets the direction of the player to the opposite of the rotation of the weapon.

	# This is necessary so that the player moves backward to the rotation of the weapon.
	var direction: Vector2 = Vector2.LEFT.rotated(weapon_holder.rotation) * 400.0

	# Timer is used to that player doesn't keep on moving forever when we click.

	# TRY: Comment the timer.start(), await player.timer.timeout and the lines after it to see the results for yourself.
	timer.start()
	velocity = direction

	await timer.timeout

	velocity = Vector2.ZERO

func mouseClick():
	if Input.is_action_just_pressed("left_click"):
		# Code to execute when left mouse button is clicked
		gun.shoot_bullet()
		move_player()
