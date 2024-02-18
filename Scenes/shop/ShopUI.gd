class_name ShopUI
extends CanvasLayer

@export var char_stats: CharacterStats : set = _set_char_stats

@onready var shop: Shop = $Shop as Shop

func _set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	shop.char_stats = char_stats
	
	
