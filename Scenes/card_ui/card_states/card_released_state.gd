extends CardState

var played:bool

func enter() ->void:
	played = true
	
	if not card_ui.targets.is_empty():
		played = true
		print("play card for target(s)", card_ui.targets)
		
	Events.card_played.emit(get_parent().get_parent().card)
	Events.player_turn_ended.emit()
	card_ui.queue_free()

func on_input(_event: InputEvent) -> void:
	if played:
		return

	transition_requested.emit(self, CardState.State.BASE)

