extends StaticBody3D

@export var powered: bool = true
@export var power_time: float = 8.0

@onready var omni_light_3d = $OmniLight3D
@onready var grabbed: AudioStreamPlayer3D = $Grabbed
@onready var running_out: AudioStreamPlayer = $RunningOut

var power_timout: float = 0.0
var has_power: bool = true
var low_sfx: bool = false

func _process(delta):
	if power_timout > 0.0:
		power_timout -= 1.0 * delta
		if power_timout < 3.5 and not low_sfx:
			running_out.play()
			low_sfx = true
	else:
		if powered and not has_power:
			set_power(true)

func _on_hand_grab_grabbed(hand: bool) -> void:
	if hand and Grabpack.right_hand.current_hand_node.name == "YellowHand":
		if Grabpack.right_hand.current_hand_node.powered or not has_power:
			return
		Grabpack.right_hand.current_hand_node.remaining_power = power_time
		Grabpack.right_hand.current_hand_node.set_power(true)
		power_timout = power_time
		grabbed.play()
		set_power(false)

func set_power(power):
	has_power = power
	omni_light_3d.visible = power
	low_sfx = false
