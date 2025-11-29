class_name InputHandler
extends Node

func get_action(player: Entity) -> Action:
	var action: Action = null
	
	if Input.is_action_just_pressed("up"):
		action = BumpAction.new(player, 0,-1)
	elif Input.is_action_just_pressed("down"):
		action = BumpAction.new(player, 0,1)
	elif Input.is_action_just_pressed("left"):
		action = BumpAction.new(player, -1,0)
	elif Input.is_action_just_pressed("right"):
		action = BumpAction.new(player, 1,0)
	elif Input.is_action_just_pressed("diag-UL"):
		action = BumpAction.new(player, -1,-1)
	elif Input.is_action_just_pressed("diag-UR"):
		action = BumpAction.new(player, 1,-1)
	elif Input.is_action_just_pressed("diag-DL"):
		action = BumpAction.new(player, -1,1)
	elif Input.is_action_just_pressed("diag-DR"):
		action = BumpAction.new(player, 1,1)
	
	if Input.is_action_just_pressed("cancel"):
		action = EscapeAction.new(player)
		
	return action
