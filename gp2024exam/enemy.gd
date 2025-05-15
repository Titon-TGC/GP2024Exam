extends CharacterBody2D

var speed = 300

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var particles = preload("res://enemydeathparticles.tscn")

func _physics_process(delta: float) -> void:
	velocity = speed * Vector2(-1, 0)
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		player._take_damage()
		var particleins = particles.instantiate()
		particleins.position = position
		get_tree().root.add_child(particleins)
		queue_free()
		
