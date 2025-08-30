extends Node
class_name ActionCable

@export var url := "ws://localhost:3000/cable"
@export var channel_name := 'SomeChannel'
@onready var ws := WebSocketPeer.new()
var identifier = ''


func _ready():
	var err = ws.connect_to_url(url)
	if err == OK:
		print_debug("Connecting to %s..." % url)
	else:
		push_error("Unable to connect.")
		set_process(false)


func _process(_delta):
	ws.poll()
	match ws.get_ready_state():
		WebSocketPeer.STATE_OPEN:
			while ws.get_available_packet_count():
				var data = ws.get_packet().get_string_from_utf8()
				handle(JSON.parse_string(data))
		WebSocketPeer.STATE_CLOSING: pass
		WebSocketPeer.STATE_CLOSED:
			var code = ws.get_close_code()
			print_debug("Closed: %d. Clean: %s" % [code, code != -1])
			set_process(false)


func handle(json: Dictionary) -> void:
	if json.has('type'):
		match json['type']:
			'welcome': subscribe()
			'ping': pass
			'confirm_subscription': pass
			_: print_debug("< Received: %s" % json)
	else:
		if json.has('message'):
			_handle(json['message'])


func subscribe() -> void:
	print_debug("> Subscribe: %s" % channel_name)
	var app_name = ProjectSettings.get('application/config/name')
	identifier = '{"channel": "%s", "name": "%s"}' % [channel_name, app_name]
	send_command('subscribe')


func send_command(command: String, payload: Dictionary = {}) -> void:
	var msg := {
		"command": command,
		"identifier": identifier,
	}
	if payload: msg.merge(payload)
	ws.send_text(JSON.stringify(msg))


func perform(action: String, payload: Dictionary) -> void:
	var data = { 'action': action }
	data.merge(payload)
	send_command('message', { 'data': JSON.stringify(data) })


func _handle(payload: Dictionary) -> void:
	pass # override this method
