extends Node


func _process(delta: float) -> void:
	
	if Input.is_action_pressed("BEGIN"):
		%Vertical.value = 0
		%Manager.position.y = %Vertical.value * -1 + 50
	
	if Input.is_action_pressed("END"):
		%Vertical.value = %Vertical.max_value - 200
		%Manager.position.y = %Vertical.value * -1 + 50
	
	
	if Input.is_action_pressed("DOWN"):
		%Vertical.value += 20
		%Manager.position.y = %Vertical.value * -1 + 50
	
	if Input.is_action_pressed("UP"):
		%Vertical.value -= 20
		%Manager.position.y = %Vertical.value * -1 + 50
	
	if Input.is_action_just_released("LEFT"):
		if %Girl.selected - 1 >= 0:
			%Girl.selected -= 1
			$"../../Manager".UpdateList()
			$"../../Face".Update()
	
	if Input.is_action_just_released("RIGHT"):
		%Girl.selected += 1
		$"../../Manager".UpdateList()
		$"../../Face".Update()
	
	if Input.is_action_just_released("PREV"):
		if %Family.selected - 1 >= 0:
			%Family.selected -= 1
			$"../../Manager".UpdateList()
			$"../../Face".Update()

	if Input.is_action_just_released("NEXT"):
		%Family.selected += 1
		$"../../Manager".UpdateList()
		$"../../Face".Update()
