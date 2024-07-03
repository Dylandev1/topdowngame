extends CharacterBody2D

const SPEED := 250.0

@onready var player: CharacterBody2D = get_node("/root/GameScene/Player")
@onready var slime := $Slime

var health := 3


func _ready() -> void:
	slime.play_walk()


func _process(_delta: float) -> void:
	var direction := position.direction_to(player.position)

	velocity = direction * SPEED

	move_and_slide()

	if health <= 0:
		queue_free()


func _on_hurtbox_detection_body_entered(body): #checks if the player touched the enemy
	if body.is_in_group("player"):
		player.queue_free() #kills the player
