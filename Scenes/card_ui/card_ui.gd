class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)

@export var card: Card
@export var char_stats: CharacterStats : set = _set_char_stats

@onready var color: TextureRect = $Color
@onready var state: Label = $State
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine
@onready var targets: Array[Node] = []

var disabled := false

# Called when the node enters the scene tree for the first time.
func _ready():
	# make the art of the card be the card on the ui
	card_state_machine.init(self)

func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)

func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()


func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()




func _on_drop_point_detector_area_entered(area: Area2D) -> void:
	print("Here")
	if not targets.has(area):
		targets.append(area)


func _on_drop_point_detector_area_exited(area: Area2D) -> void:
	targets.erase(area)
	
func _set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	char_stats.stats_changed.connect(_on_char_stats_changed)
	
func _on_char_stats_changed() -> void:
	#self.playable = 
	pass
