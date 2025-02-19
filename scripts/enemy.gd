extends CharacterBody2D

var HP = 120
var ATTACK_POWER = 20

@onready var player: CharacterBody2D = $"../Player"

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Enemy's HP: ", HP)
