extends Object

const STEPS = 32
var stepcounter = STEPS
var oscsndr

func _ready():
	
	oscsndr = load("res://addons/gdosc/gdoscsender.gdns").new()
	# [mandatory] will send messages to ip:port
	oscsndr.setup( "127.0.0.1", 57120 )
	# [mandatory] enabling emission
	oscsndr.start()

func _process(delta):
	stepcounter -= 1
	print(stepcounter)
	
	if(stepcounter <= 0):
		stepcounter = STEPS
		send_sound()

func _exit_tree ( ):
	# disable the sender, highly recommended!
	oscsndr.stop()

func send_sound():
	oscsndr.msg("/ding")
	# adding a string
	oscsndr.add( 440 )
	# sending the message
	oscsndr.send()
