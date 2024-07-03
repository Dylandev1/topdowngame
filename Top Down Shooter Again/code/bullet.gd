extends Area2D

const SPEED := 700.0
const MAX_DISTANCE := 1200.0

var travelled_distance := 0.0


func _process(delta: float) -> void:
	var direction := Vector2.RIGHT.rotated(rotation)

	position += direction * SPEED * delta

	travelled_distance += SPEED * delta

	if travelled_distance >= MAX_DISTANCE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	# Detects collision with the enemies
	if body.is_in_group("enemy"):
		var enemy: CharacterBody2D = body
		enemy.slime.play_hurt()		# Look at the enemy.tscn.
		enemy.health -= 1
		queue_free()