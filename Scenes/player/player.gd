class_name Player
extends Node2D

@export var player_handler: PlayerHandler

func take_damage(damage: int) -> void:
	player_handler.take_damage(damage)
