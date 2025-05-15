extends Node2D

var enemy = preload("res://enemy.tscn")
@onready var comboThing = $"../CanvasLayer/VBoxContainer/EnemyComboThing"

var enemiesDepsawned : int

var spawnEnemies:bool = true

func _physics_process(delta: float) -> void:
	if enemiesDepsawned >= 100:
		comboThing.text = "MEGA"
		comboThing.add_theme_color_override("font_color", Color.GREEN)
	if enemiesDepsawned >= 500:
		comboThing.text = "ULTRA"
		comboThing.add_theme_color_override("font_color", Color.YELLOW)
	if enemiesDepsawned >= 1000:
		comboThing.text = "SUPERIOR"
		comboThing.add_theme_color_override("font_color", Color.ORANGE)
	if enemiesDepsawned >= 2500:
		comboThing.text = "GIGA"
		comboThing.add_theme_color_override("font_color", Color.RED)
	if enemiesDepsawned >= 5000:
		comboThing.text = "GODLY"
		comboThing.add_theme_color_override("font_color", Color.REBECCA_PURPLE)
	if enemiesDepsawned >= 10000:
		comboThing.text = "BRYAN"
		comboThing.add_theme_color_override("font_color", Color.SKY_BLUE)
		
		

func _on_spawn_timer_timeout() -> void:
	if spawnEnemies:
		_spawn_enemies()
	if !spawnEnemies:
		$"../CanvasLayer/Panel/VBoxContainer/EnemiesSurvivedText".text = "You survived " + str(enemiesDepsawned) + " enemies!"

func _spawn_enemies():
	var enemyins = enemy.instantiate()
	add_child(enemyins)
	var nodes = get_tree().get_nodes_in_group("Spawn")
	var node = nodes[randi() % nodes.size()]
	enemyins.position = node.position


func _on_enemy_despawn_area_body_entered(body: Node2D) -> void:
	if body != get_tree().get_first_node_in_group("Player"):
		body.queue_free()
		if spawnEnemies:
			enemiesDepsawned += 1
			$"../CanvasLayer/VBoxContainer/EnemiesText".text = "Enemies: " + str(enemiesDepsawned)
