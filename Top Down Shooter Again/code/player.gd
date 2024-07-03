extends CharacterBody2D

@onready var weapon_holder := $WeaponHolder
@onready var timer: Timer = $Timer


func _physics_process(_delta: float) -> void:
	# Didn't clutter up the _physics_process() function.
	handle_holder_rotation()
	move_and_slide()


func handle_holder_rotation():
	# This line of code makes the weapon look at the position of the mouse
	# on the screen enabling the player to aim.
	weapon_holder.look_at(get_global_mouse_position())