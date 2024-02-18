extends Node

# Declare your global variables here
var gold = 0

# Create a signal to notify when the gold value changes
signal gold_changed(new_gold)

# Function to change the gold value
func change_gold(new_gold):
	gold += new_gold
	emit_signal("gold_changed", gold)
