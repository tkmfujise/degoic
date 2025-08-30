extends ActionCable


func _handle(payload: Dictionary) -> void:
	print_debug('_handle: %s' % payload)


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if ws.get_ready_state() == WebSocketPeer.STATE_OPEN:
			perform('foo', { 'bar': true })
