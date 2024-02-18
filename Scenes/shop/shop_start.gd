extends Node2D

@export var char_stats: CharacterStats

@onready var shop_ui: ShopUI = $ShopUI as ShopUI
@onready var shop_handler: ShopHandler = $ShopHandler as ShopHandler


# Called when the node enters the scene tree for the first time.
func _ready():
	var new_stats: CharacterStats = char_stats.create_instance()
	new_stats.cards_per_turn = 4
	shop_ui.char_stats = new_stats
		
	start_battle(new_stats)

func start_battle(stats: CharacterStats) -> void:
	shop_handler.start_battle(stats)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
