extends CharacterBody2D

@export var speed : int
@export var health:int = 100

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
	
	if health <= 0:
		$"../GameManager".spawnEnemies = false
		$"../CanvasLayer/Panel".visible = true
		queue_free()

func _take_damage():
	health -= 1
	$"../CanvasLayer/VBoxContainer/HealthText".text = str(health) + "/100"
	$"../CanvasLayer/VBoxContainer/HealthText/ProgressBar".value = health
