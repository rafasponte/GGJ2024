extends Label

# This function is called when the node is ready
func _ready():
	Gold.gold_changed.connect(_on_gold_changed)
	var new_gold = Gold.gold
	text = str(new_gold)
	set_text(text)
	# Initial update of gold display

# This function updates the display with the current gold value
func update_gold_display(new_gold):
	# Convert the gold value to a string and set it as the text of the label
	text = str(new_gold)
	set_text(text)

# This function handles the gold_changed signal
func _on_gold_changed(new_gold):
	# Update the gold display
	update_gold_display(new_gold)
 
