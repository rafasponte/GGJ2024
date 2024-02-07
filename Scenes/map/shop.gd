extends TextureButton

@onready var yellow_indicator : Sprite2D = $Sprite2D

func _ready():
	yellow_indicator.visible = false


func _on_mouse_entered():
	yellow_indicator.visible = true
	

func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/shop/shop.tscn")

func _on_mouse_exited():
	yellow_indicator.visible = false
