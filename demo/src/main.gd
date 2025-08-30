@tool
extends Control

const WEBSOCKET_URL = 'ws://localhost:3000/cable'
var ws = WebSocketPeer.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var err = ws.connect_to_url(WEBSOCKET_URL)
	if err == OK:
		print("Connecting to %s..." % WEBSOCKET_URL)
		await get_tree().create_timer(2).timeout
		print("> Sending test packet.")
		#ws.send_text("Test packet")
	else:
		push_error("Unable to connect.")
		set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ws.poll()
	var state = ws.get_ready_state()
	print_debug(state)
