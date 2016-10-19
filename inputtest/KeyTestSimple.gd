
extends Node

onready var _log = get_node("Log/Text")
var actions = InputMap.get_actions()

func _ready():
	print(actions)
	set_fixed_process(true)

func _fixed_process(delta):
	var found = false
	var text = ""
	for act in actions:
		if Input.is_action_pressed(act):
			text += act + " Pressed" + "\n"
			found = true
		if Input.is_action_just_pressed(act):
			_log.set_text(_log.get_text()+ "\n" + act + " just Pressed")
		if Input.is_action_just_released(act):
			_log.set_text(_log.get_text()+ "\n" + act + " just Released")
	
	if not found:
		text = "No Key"
	
	get_node("Control/Label").set_text(text)