class_name Enemy
extends Area2D

const ARROW_OFFSET := 5

@export var stats: EnemyStats : set = set_enemy_stats
@export var target: Node2D
@export var health_bar : TextureProgressBar

@onready var sprite_2d : Sprite2D = $Sprite2D
@onready var arrow: Sprite2D = $Arrow

var enemy_action_picker: EnemyActionPicker
var current_action: EnemyAction : set = set_current_action

func set_current_action(value : EnemyAction) -> void:
	current_action = value
	
func set_enemy_stats(value: EnemyStats) -> void:
	print("set enemy stats")
	stats = value.create_instance()
	stats.health = 30
	
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)
		stats.stats_changed.connect(update_action)
		
	update_enemy()
	
func setup_ai() -> void:
	if enemy_action_picker:
		enemy_action_picker.queue_free()
	
	var new_action_picker: EnemyActionPicker = stats.ai.instantiate()
	add_child(new_action_picker)
	enemy_action_picker = new_action_picker
	enemy_action_picker.enemy = self

func update_stats() -> void:
	health_bar.value = stats.health
	
func update_action() -> void:
	if not enemy_action_picker:
		print("no action picker")
		return
		
	if not current_action:
		print("no action")
		current_action = enemy_action_picker.get_action()
		print("current action" + str(current_action))
		return
	
	
	var new_conditional_action := enemy_action_picker.get_first_conditional_action()
	if new_conditional_action and current_action != new_conditional_action:
		current_action = new_conditional_action
	
func update_enemy() -> void:
	if not stats is Stats:
		return
	if not is_inside_tree():
		await ready
		
	sprite_2d.texture = stats.art
	arrow.position = Vector2.RIGHT * (sprite_2d.get_rect().size.x / 2 + ARROW_OFFSET)
	setup_ai()
	
func do_turn() -> void:
	stats.block = 0
	
	if not current_action:
		print("no action to perform")
		return
	
	print("action to perform")
	current_action.perform_action()
	
func take_damage(damage: int) -> void:
	print("enemy taking damage" + str(damage) + " " + str(stats.health))
	
	if stats.health <= 0:
		return
		
	stats.take_damage(damage)
	update_stats()
	
	if stats.health <= 0:
		Events.enemy_died.emit()
		queue_free()
	
	
