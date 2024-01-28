class_name BattleUI
extends CanvasLayer

@export var char_stats: CharacterStats : set = _set_char_stats

@onready var hand: Hand = $Hand as Hand

func _set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	hand.char_stats = char_stats
	
#emit player turn ended
	
