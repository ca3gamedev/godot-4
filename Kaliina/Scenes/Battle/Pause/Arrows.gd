extends Node2D

var current_button : int
var current_shoot : int

func _input(event):
	if event is InputEventKey:
		if current_button != 0:
			match(current_button):
				1 : 
					%Up.text = str(OS.get_keycode_string(event.get_keycode_with_modifiers()))
					current_button = 0
					InputMap.action_erase_events("UP")
					InputMap.action_add_event("UP", event)
					
				2 : 
					%Left.text = str(OS.get_keycode_string(event.get_keycode_with_modifiers()))
					current_button = 0
					InputMap.action_erase_events("LEFT")
					InputMap.action_add_event("LEFT", event)
					
				3 : 
					%Right.text = str(OS.get_keycode_string(event.get_keycode_with_modifiers()))
					current_button = 0
					InputMap.action_erase_events("RIGHT")
					InputMap.action_add_event("RIGHT", event)
					
				4 : 
					%Down.text = str(OS.get_keycode_string(event.get_keycode_with_modifiers()))
					current_button = 0
					InputMap.action_erase_events("DOWN")
					InputMap.action_add_event("DOWN", event)
					
		
		if current_shoot != 0:
			if current_shoot == 1:
				%Shoot.text = str(OS.get_keycode_string(event.get_keycode_with_modifiers()))
				current_shoot = 0
				InputMap.action_erase_events("SHOOT")
				InputMap.action_add_event("SHOOT", event)
				
			if current_shoot == 2:
				%Change.text = str(OS.get_keycode_string(event.get_keycode_with_modifiers()))
				current_shoot = 0
				InputMap.action_erase_events("UPGUN")
				InputMap.action_add_event("UPGUN", event)
				


func _on_w_button_up():
	current_button = 1


func _on_a_button_up():
	current_button = 2


func _on_d_button_up():
	current_button = 3


func _on_s_button_up():
	current_button = 4


func _on_shoot_button_up():
	current_shoot = 1


func _on_change_button_up():
	current_shoot = 2
