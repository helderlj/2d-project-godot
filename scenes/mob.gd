extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")

func _ready() -> void:
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 150.0
	move_and_slide()
	
func take_damage():
	health -= 1
	%Slime.play_hurt()
	

	if health == 0:
		const SMOKE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var dying_smoke = SMOKE.instantiate()
		get_parent().add_child(dying_smoke)
		dying_smoke.global_position = global_position
		queue_free()
